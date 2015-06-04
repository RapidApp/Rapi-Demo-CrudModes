use utf8;
package Rapi::Demo::CrudModes::DB;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-05-30 05:32:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k4L9fzxLIc2uX2IG9+peGw


sub _auto_populate {
  my $self = shift;
  
  $self->resultset('Alpha')->populate([ 
  
    [qw/string1                string2         number   bool    date/         ],
    ['something',             'blah',          23,      1,      '2015-02-15'  ],
    ['sfdgsdgf',              'bHHlah',        7.4,     0,      '2011-02-06'  ],
    ['something',             'blah',          23,      1,      '2009-06-29'  ],
    ['Table',                 'Apple',         23,      0,      '1987-05-01'  ],
    ['Blah foo run',          'blah',          23,      1,      '1783-10-31'  ],
    ['something',             'joe',           23,      1,      '1944-06-04'  ],
  
  ]);


}



# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable(inline_constructor => 0);
1;
