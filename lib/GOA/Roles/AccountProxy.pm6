use v6.c;

use GOA::Raw::Types;
use GOA::Raw::AccountProxy;

role GOA::Roles::AccountProxy {
  has GoaAccountProxy $!gap;

  proto method new(|)
  { * }

  multi method new (
    GIODBusConnection() $connection,
    Int()               $flags,
    Str()               $name,
    Str()               $object_path,
                        &callback,
    gpointer            $user_data    = gpointer,
    GCancellable()      :$cancellable = GCancellable
  ) {
    samewith(
      $connection,
      $flags,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method new (
    GIODBusConnection() $connection,
    Int()               $flags,
    Str()               $name,
    Str()               $object_path,
    GCancellable()      $cancellable,
                        &callback,
    gpointer            $user_data    = gpointer
  ) {
    my GDBusProxyFlags $f = $flags;

    goa_account_proxy_new(
      $connection,
      $f,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method new_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my $account-proxy = goa_account_proxy_new_finish($res, $error);

    $account-proxy ?? self.bless( :$account-proxy );
  }

  proto method new_for_bus (|)
  { * }

  multi method new_for_bus (
    Int()               $bus_type,
    Int()               $flags,
    Str()               $name,
    Str()               $object_path,
                        &callback,
    gpointer            $user_data     = gpointer,
    GCancellable()      :$cancellable  = GCancellable
  ) {
    samewith(
      $bus_type,
      $flags,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    )
  }
  multi method new_for_bus (
    Int()               $bus_type,
    Int()               $flags,
    Str()               $name,
    Str()               $object_path,
    GCancellable()      $cancellable,
                        &callback,
    gpointer            $user_data
  ) {
    my GBusType        $b = $bus_type;
    my GDBusProxyFlags $f = $flags;

    goa_account_proxy_new_for_bus(
      $b,
      $f,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method new_for_bus_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $acccount-proxy = goa_account_proxy_new_for_bus_finish($res, $error);
    set_error($error);

    $account-proxy ?? self.bless( :$account-proxy );
  }

  method new_for_bus_sync (
    Int()                   $bus_type,
    Int()                   $flags,
    Str()                   $name,
    Str()                   $object_path,
    GCancellable            $cancellable  = GCancellable,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my GBusType        $b = $bus_type;
    my GDBusProxyFlags $f = $flags;

    clear_error;
    my $account-proxy = goa_account_proxy_new_for_bus_sync(
      $b,
      $f,
      $name,
      $object_path,
      $cancellable,
      $error
    );
    set_error($error);

    $account-proxy ?? self.bless( :$account-proxy );
  }

  method new_sync (
    GDBusConnection()       $connection,
    Int()                   $flags,
    Str()                   $name,
    Str()                   $object_path,
    GCancellable()          $cancellable  = GCancellable,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my GDBusProxyFlags $f = $flags;

    clear_error;
    my $account-proxy = goa_account_proxy_new_sync(
      $connection,
      $f,
      $name,
      $object_path,
      $cancellable,
      $error
    );
    set_error($error);

    $account-proxy ?? self.bless( :$account-proxy );
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_account_proxy_get_type, $n, $t );
  }

}

our subset GoaAccountProxyAncestry is export of Mu
  where GoaAccountProxy | GoaAccount | GObject;

class GOA::AccountProxy is GOA::Account does GOA::Roles::AccountProxy {

  submethod BUILD ( :$account-proxy ) {
    self.setAccountProxy($account-proxy) if $account-proxy;
  }

  method setAccountProxy (GoaAccountProxyAncestry $_) {
    my $to-parent;

    $!gap = do {
      when GoaAccountProxy {
        $to-parent = cast(GoaAccount, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaAccountProxy, $_);
      }
    }
    self.setGoaAccount($to-parent);
    self.roleInit-GoaAccountProxy;
  }

  method new (GoaAccountProxyAncestry $account-proxy, :$ref = True) {
    return Nil unless $account-proxy;

    my $o = self.bless( :$account-proxy );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.GOA::Roles::AccountProxy::get_type;
  }

}
