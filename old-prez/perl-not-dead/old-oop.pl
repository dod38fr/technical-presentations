use strict;
use warnings;

package Foo;

sub new {
   my $class = shift;
   my $self = bless {}, $class;
   my %args = @_;
   $self->{_message} = $args{message};
   return $self;
}

sub hello {
   my $self = shift;
   print $self->{_message}, "\n";
}
1;
