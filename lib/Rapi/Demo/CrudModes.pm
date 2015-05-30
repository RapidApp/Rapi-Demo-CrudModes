package Rapi::Demo::CrudModes;

use strict;
use warnings;

# ABSTRACT: RapidApp Demo app

use RapidApp 1.0401_08;

use Moose;
extends 'RapidApp::Builder';

use Types::Standard qw(:all);

use RapidApp::Util ':all';
use File::ShareDir qw(dist_dir);
use FindBin;
use Path::Class qw(file dir);
use Module::Runtime;
use Scalar::Util 'blessed';
use Cwd;

our $VERSION = '0.001';

has '+base_appname', default => sub { 'CrudModes::Demo' };
has '+debug',        default => sub {1};

sub _build_plugins {[
  'RapidApp::RapidDbic'
]}

sub _build_config {
  my $self = shift;
  
  my $tpl_dir = join('/',$self->share_dir,'templates');
  -d $tpl_dir or die join('',
    "template dir ($tpl_dir) not found; ", 
    __PACKAGE__, " may not be installed properly.\n"
  );
  
  my $loc_assets_dir = join('/',$self->share_dir,'assets');
  -d $loc_assets_dir or die join('',
    "assets dir ($loc_assets_dir) not found; ", 
    __PACKAGE__, " may not be installed properly.\n"
  );
  
  unless(-d (my $dir = $self->data_dir)) {
    print STDERR "Initializing local data_dir '$dir'\n" if ($self->debug);
    dir($dir)->mkpath
  }
  
  return {
    'RapidApp' => {
      local_assets_dir => $loc_assets_dir,
      #load_modules => {
      #
      #}
    },

    'Controller::RapidApp::Template' => {
      include_paths => [ $tpl_dir ]
    },
    'Controller::SimpleCAS' => {
      store_path	=> $self->cas_store_dir
    },

  }
}

has 'share_dir', is => 'ro', isa => Str, lazy => 1, default => sub {
  my $self = shift;
  $ENV{RAPI_DEMO_CRUDMODES_SHARE_DIR} || (
    try{dist_dir('Rapi-Demo-CrudModes')} || (
      -d "$FindBin::Bin/share" ? "$FindBin::Bin/share" : "$FindBin::Bin/../share" 
    )
  )
};

has 'data_dir', is => 'ro', isa => Str, lazy => 1, default => sub {
  my $self = shift;
  # Default to the cwd
  dir( cwd(), 'crudmodes_data')->stringify;
};


has 'crudmodes_db', is => 'ro', isa => Str, lazy => 1, default => sub {
  my $self = shift;
  file( $self->data_dir, 'crudmodes.db' )->stringify
};

has 'cas_store_dir', is => 'ro', isa => Str, lazy => 1, default => sub {
  my $self = shift;
  dir( $self->data_dir, 'cas_store' )->stringify
};


has '+inject_components', default => sub {
  my $self = shift;
  my $model = 'Rapi::Demo::CrudModes::Model::DB';
  
  my $db = file( $self->crudmodes_db );

  Module::Runtime::require_module($model);
  $model->config->{connect_info}{dsn} = "dbi:SQLite:$db";

  return [
    [ $model => 'Model::DB' ]
  ]
};


after 'bootstrap' => sub {
  my $self = shift;
  
  my $c = $self->appname;
  $c->model('DB')->_auto_deploy_schema
};




1;


__END__

=head1 NAME

Rapi::Demo::CrudModes - RapidApp DBIC-driven module config examples 

=head1 SYNOPSIS

 use Rapi::Demo::CrudModes;
 my $app = Rapi::Demo::CrudModes->new;

 # Plack/PSGI app:
 $app->to_app

Or, from the command-line:

 plackup -MRapi::Demo::CrudModes -e 'Rapi::Demo::CrudModes->new->to_app'


=head1 DESCRIPTION

...

=head1 CONFIGURATION

...

=head1 SEE ALSO

=over

=item * 

L<RapidApp>

=item * 

L<RapidApp::Builder>

=back


=head1 AUTHOR

Henry Van Styn <vanstyn@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by IntelliTree Solutions llc.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut



