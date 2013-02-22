
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "generate scaled or mangled images",
  "AUTHOR" => "Wolfgang Kinkeldei <wolfgang\@kinkeldei.de>",
  "BUILD_REQUIRES" => {
    "Catalyst" => 0,
    "Catalyst::Runtime" => 0,
    "Catalyst::Test" => 0,
    "FindBin" => 0,
    "Image::Info" => 0,
    "Path::Class::Dir" => 0,
    "Path::Class::File" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Catalyst-Controller-Imager",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Catalyst::Controller::Imager",
  "PREREQ_PM" => {
    "Catalyst::Controller" => 0,
    "Catalyst::Runtime" => "5.80",
    "FindBin" => "1.47",
    "Image::Info" => "1.31",
    "Imager" => "0.86",
    "Imager::File::GIF" => "0.82",
    "Imager::File::JPEG" => "0.82",
    "Imager::File::PNG" => "0.82",
    "MIME::Types" => 0,
    "Moose" => "1.0",
    "Moose::Util::TypeConstraints" => 0,
    "Path::Class" => "0.16",
    "strict" => 0
  },
  "VERSION" => "0.05",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



