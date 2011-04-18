use strict;
use warnings;

package B::Marcel;

use XSLoader;
use B::Hooks::OP::Check;
use B::Hooks::OP::PPAddr;
use Sub::Exporter -setup => {
    exports => ['hook_ppaddr'],
    groups  => { default => ['hook_ppaddr'] },
};

our $VERSION = '0.01';

XSLoader::load(__PACKAGE__, $VERSION);
