use v6.c;

use GOA::Raw::Types;
use GLib::Raw::Subs;

use GLib::MainLoop;
use GOA::Provider;

sub MAIN {
  my %get-all-data;

  %get-all-data<loop> = GLib::MainLoop.new;
  GOA::Provider.get-all(-> *@a {
    %get-all-data<providers> = GOA::Provider.get-all-finish( $, @a[1], :!seq );
    %get-all-data<loop>.quit;
  });
  %get-all-data<loop>.run;

  my @providers;

  END {
    %get-all-data<loop>.unref;
    .unref for @providers;
  }

  if $ERROR {
    $*ERR.say:
      sprintf(
        "Failed to lost providers %s (%s, %d)",
        $ERROR.message,
        GLib::Quark.to-string($ERROR.domain),

        $ERROR.code
      )
  }

  # cw: Should not need @providers or .Array - This should be done by returnGList
  say "Got provider: { .get-provider-name }" for
    (@providers = %get-all-data<providers>.Array);
}
