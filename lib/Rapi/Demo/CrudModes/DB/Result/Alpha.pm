use utf8;
package Rapi::Demo::CrudModes::DB::Result::Alpha;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime");
__PACKAGE__->table("alpha");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "value_1",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 32,
  },
  "value_2",
  {
    data_type => "varchar",
    default_value => \"null",
    is_nullable => 1,
    size => 64,
  },
  "int_3",
  { data_type => "integer", default_value => \"null", is_nullable => 1 },
  "decimal_4",
  {
    data_type => "decimal",
    default_value => \"null",
    is_nullable => 1,
    size => [8, 2],
  },
  "datetime_5",
  { data_type => "datetime", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-05-30 05:32:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:61GB5UHTUCMxUzoM/kodJw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
