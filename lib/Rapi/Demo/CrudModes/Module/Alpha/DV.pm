package Rapi::Demo::CrudModes::Module::Alpha::DV;

use strict;
use warnings;

use Moose;
extends 'RapidApp::Module::DbicDV';

use RapidApp::Util qw(:all);
use Path::Class qw(file dir);

has '+include_colspec', default => sub {['*']};
has '+updatable_colspec', default => sub {['*']};
has '+creatable_colspec', default => sub {['*']};
has '+destroyable_relspec', default => sub {['*']};

has '+use_add_form',  default => 0;
has '+use_edit_form', default => 0;

has '+persist_immediately', default => sub{{
  create  => 1,
  update  => 1,
  destroy => 1
}};

has '+confirm_on_destroy', default => 0;

has 'ResultSource', is => 'ro', lazy => 1, default => sub {
  my $self = shift;
  $self->app->model('DB')->schema->source('Alpha')
};


has '+tt_file', default => 'templates/alpha_dv.html';

has '+tt_include_path', default => sub {
  my $self = shift;
  dir( $self->app->ra_builder->data_dir )->stringify;
};

sub BUILD {
  my $self = shift;
  
  $self->apply_extconfig( 
    itemSelector  => 'div.alpha-row',
    selectedClass => 'selected',
    show_store_button_text => \1
  );
}



1;

