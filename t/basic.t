use strict;
use warnings;
use Test::More;

use B::Marcel;

use B::OPCheck
    entersub => check => sub {
        my $op = shift; # op has been checked by normal PL_check
        hook_ppaddr($op, sub {
            my ($op) = @_;
            isa_ok $op, 'B::OP';
            warn "entersub";
        });
    };

sub foo {}
foo();

done_testing;
