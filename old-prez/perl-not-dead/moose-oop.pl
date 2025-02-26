package Foo;
use Moose;

has message => (
    is => 'rw',
    isa => 'Str'
);

sub hello {
    my $self = shift;
    say $self->message;
}

1;
