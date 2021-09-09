use v6.c;

use GOA::Client;

sub MAIN {
  die 'Could not create GOA client!' unless (my $client = GOA::Client.new-sync);

  for $client.get-accounts[] {
    say "\n{ .presentation-identity } at { .provider-name } ({
         .provider-type })"
    given (my $o = .get_account);

    if .get_mail -> $m {
      my $e-addr = $m.get_email_address;

      say "{ $e-addr }\n{ '—' x $e-addr.chars }\n";
      for <SMTP IMAP> -> $mm {
        my $mmlc = $mm.lc;

        my $supported = $m."get_{ $mmlc }_supported"();

        say "{ $mm } supported: { $supported }";
        if $supported {
          say "\tHost: { $m."get_{ $mmlc }_host"() }";
          say "\tUser Name: { $m."get_{ $mmlc }_user_name"() }";
          for <SSL TLS> {
            say "\t{ $_ }: { $m."get_{ $mmlc }_use_{ .lc }"() }"
          }
        }
      }
    }

    # cw: How to best make this as un-ubuquitous as possible? Could this be
    #     done via DESTROY? (If non-raw, should be handled in .get-accounts() !
    # g_list_free_full (accounts, (GDestroyNotify) g_object_unref);
  }
}
