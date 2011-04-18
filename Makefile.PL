use ExtUtils::MakeMaker;
use ExtUtils::Depends;

my $dep = ExtUtils::Depends->new('B::Marcel', 'B::Hooks::OP::Check', 'B::Hooks::OP::PPAddr');

WriteMakefile(
    NAME => 'B::Marcel',
    VERSION_FROM => 'lib/B/Marcel.pm',
    $dep->get_makefile_vars,
);
