use strict;
use B::Marcel;

use B::OPCheck
    entersub => check => sub {
        my $op = shift; # op has been checked by normal PL_check
        hook_ppaddr($op, sub {
            warn "entersub";
        });
    };

foo();
