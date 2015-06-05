package Rapi::Demo::CrudModes::Module::Alpha::Grid;

use strict;
use warnings;

use Moose;
extends 'RapidApp::Module::DbicGrid';

use RapidApp::Util qw(:all);

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


sub BUILD {
  my $self = shift;
  
  # Show full text with the store buttons (default is false)
  $self->apply_extconfig( show_store_button_text => \1 );
}

1;

