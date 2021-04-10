use v6.c;

use NativeCall;

use GOA::Raw::Types;

use GLib::Raw::ReturnedValue;

# Consider something akin to GIO::DBus::Roles::Signals::DBus (?)
role GOA::Roles::Signals::Account {
  has %!signals-ga;

  # GoaAccount, GDBusMethodInvocation, gpointer --> gboolean
  method connect-handle-ensure-credentials (
    $obj,
    $signal,
    &handler?
  ) {
    my $hid;
    %!signals-ga{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-handle-method-invocation($obj, $signal,
        -> $, $gdmi, $ud --> gboolean {
          CATCH {
            default { 𝒮.note($_) }
          }

          my $r = ReturnedValue.new;
          𝒮.emit( [self, $gdmi, $ud, $r] );
          $r.r;
        },
        Pointer, 0
      );
      [ 𝒮.Supply, $obj, $hid ];
    };
    %!signals-ga{$signal}[0].tap(&handler) with &handler;
    %!signals-ga{$signal}[0];
  }

}

# GoaAccount, GDBusMethodInvocation, gpointer --> gboolean
sub g-connect-handle-method-invocation(
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
