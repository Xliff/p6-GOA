use v6.c;

use NativeCall;

use GOA::Raw::Types;

use GLib::Raw::ReturnedValue;

role GOA::Roles::Signals::OAuth2Based {
  has %!signals-goauth2;

  # GoaOAuth2Based, GDBusMethodInvocation, gpointer --> gboolean
  method connect-handle-get-access-token (
    $obj,
    $signal = 'handle-get-access-token',
    &handler?
  ) {
    my $hid;
    %!signals-goauth2{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-handle-get-access-token($obj, $signal,
        -> $, $dbi, $ud --> gboolean {
          CATCH {
            default { 𝒮.note($_) }
          }

          my $r = ReturnedValue.new;
          𝒮.emit( [self, $dbi, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-goauth2{$signal}[0].tap(&handler) with &handler;
    %!signals-goauth2{$signal}[0];
  }

}

# GoaOAuth2Based, GDBusMethodInvocation, gpointer --> gboolean
sub g-connect-handle-get-access-token(
  Pointer $app,
  Str     $name,
          &handler (Pointer, GDBusMethodInvocation, Pointer --> gboolean),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
