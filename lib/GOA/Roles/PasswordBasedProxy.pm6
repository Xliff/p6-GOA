use v6.c;

use NativeCall;

use GOA::Raw::Types;
use GOA::Raw::PasswordBasedProxy;

use GLib::Class::Object;

use GLib::Roles::Object;
use GOA::Roles::PasswordBased;

role GOA::Roles::PasswordBasedProxy {
  also does GLib::Roles::Object;

  has GoaPasswordBasedProxy $!gpp;

  method roleInit-GoaPasswordBasedProxy {
    return if $!gpp;

    my \i = findProperImplementor(self.^attributes);
    $!gpp = cast( GoaPasswordBasedProxy, i.get_value(self) );
  }

  method GOA::Raw::Definitions::GoaPasswordBasedProxy
  { $!gpp }

  method new_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $password-based-proxy = goa_password_based_proxy_new_finish(
      $res,
      $error
    );
    set_error($error);

    $password-based-proxy ?? self.bless( :$password-based-proxy ) !! Nil;
  }

  method new_for_bus_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $password-based-proxy = goa_password_based_proxy_new_for_bus_finish(
      $res,
      $error
    );
    set_error($error);

    $password-based-proxy ?? self.bless( :$password-based-proxy ) !! Nil;
  }

  proto method new_for_bus (|)
  { * }

  multi method new_for_bus (
    Int()          $bus_type,
    Int()          $flags,
    Str()          $name,
    Str()          $object_path,
                   &callback,
    gpointer       $user_data    = gpointer,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith(
      $bus_type,
      $flags,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method new_for_bus (
    Int()          $bus_type,
    Int()          $flags,
    Str()          $name,
    Str()          $object_path,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  ) {
    my GBusType        $b = $bus_type;
    my GDBusProxyFlags $f = $flags;

    goa_password_based_proxy_new_for_bus(
      $b,
      $f,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method new_for_bus_sync (
    GBusType $bus_type,
    GDBusProxyFlags $flags,
    Str                     $name,
    Str                     $object_path,
    GCancellable            $cancellable  = GCancellable,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my GBusType        $b = $bus_type;
    my GDBusProxyFlags $f = $flags;

    clear_error;
    my $password-based-proxy = goa_password_based_proxy_new_for_bus_sync(
      $b,
      $f,
      $name,
      $object_path,
      $cancellable,
      $error
    );
    set_error($error);

    $password-based-proxy ?? self.bless( :$password-based-proxy ) !! Nil;
  }

  method new_sync (
    GDBusConnection()       $connection,
    GDBusProxyFlags()       $flags,
    Str()                   $name,
    Str()                   $object_path,
    GCancellable()          $cancellable  = GCancellable,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my GDBusProxyFlags $f = $flags;

    clear_error;
    my $password-based-proxy = goa_password_based_proxy_new_sync(
      $connection,
      $flags,
      $name,
      $object_path,
      $cancellable,
      $error
    );
    set_error($error);

    $password-based-proxy ?? self.bless( :$password-based-proxy ) !! Nil;
  }

  method new (
    Int()          $flags,
    Str()          $name,
    Str()          $object_path,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data
  ) {
    my GDBusProxyFlags $f = $flags;

    my $password-based-proxy = goa_password_based_proxy_new(
      $f,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );

    $password-based-proxy ?? self.bless( :$password-based-proxy ) !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_password_based_proxy_get_type, $n, $t );
  }

}

our subset GoaPasswordBasedProxyAncestry is export of Mu
  where GoaPasswordBasedProxy | GoaPasswordBased | GObject;

class GOA::PasswordBasedProxy is GOA::PasswordBased
  does GOA::Roles::PasswordBasedProxy
{

  submethod BUILD ( :$password-based-proxy ) {
    self.setPasswordBasedProxy($password-based-proxy) if $password-based-proxy;
  }

  method setPasswordBasedProxy (GoaPasswordBasedProxyAncestry $_) {
    my $to-parent;

    $!gpp = do {
      when GoaPasswordBasedProxy {
        $to-parent = cast(GoaPasswordBased, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaPasswordBasedProxy, $_);
      }
    }
    self.setGoaPasswordBased($to-parent);
    self.roleInit-GoaPasswordBasedProxy;
  }

  method new (
    GoaPasswordBasedProxyAncestry $password-based-proxy,
                                  :$ref                  = True
  ) {
    return Nil unless $password-based-proxy;

    my $o = self.bless( :$password-based-proxy );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.GOA::Roles::PasswordBasedProxy::get_type;
  }

}
