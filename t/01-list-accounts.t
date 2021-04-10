use v6.c;

use GOA::Client;

sub MAIN {
  die 'Could not create GOA client!' unless (my $client = GOA::Client.new-sync);

  for $client.get-accounts[] {
    say "\n{ .presentation-identity } at { .provider-name } ({
         .provider-type })"
    given (my $o = .get_account);

    if .get_oauth2_based -> $oa2 {
      if $oa2.call_get_access_token_sync -> $at {
        say "AccessToken:  { $at }";
      }

      say qq:to/INFO/.chomp;
        ClientId:     { $oa2.client-id }
        ClientSecret: { $oa2.client-secret }
        INFO
    }

    # cw: How to best make this as un-ubuquitous as possible? Could this be
    #     done via DESTROY? (If non-raw, should be handled in .get-accounts() !
    # g_list_free_full (accounts, (GDestroyNotify) g_object_unref);
  }
}
