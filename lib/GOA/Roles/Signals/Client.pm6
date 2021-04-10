use v6.c;

use NativeCall;

use GOA::Raw::Types;

role GOA::Roles::Signals::Client {
  has %!signals-gc

  # GoaClient, GoaObject, gpointer
  method connect-account (
    $obj,
    $signal,
    &handler?
  ) {
    my $hid;
    %!signals-gc{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-account-added($obj, $signal,
        -> $, $go, $ud {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $go, $ud ] );
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-gc{$signal}[0].tap(&handler) with &handler;
    %!signals-gc{$signal}[0];
  }

}

# GoaClient, GoaObject, gpointer
sub g-connect-account(
  Pointer $app,
  Str     $name,
          &handler (Pointer, GoaObject, Pointer),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
