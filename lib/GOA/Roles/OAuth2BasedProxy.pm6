use v6.c;

use NativeCall;

use GOA::Raw::Types;
use GOA::Raw::OAuth2BasedProxy;

role GOA::Roles::OAuth2BasedProxy {
  has GoaOAuth2BasedProxy $!gobp;

  method roleInit-GoaOAuth2BasedProxy {
    return if $!gp;

    my \i = findProperImplementor(self.^attributes);
    $!gobp = cast( GoaPasswordBased, i.get_value(self) );
  }

  method new_finish (
    GAsyncResult             $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $oauth2-based-proxy = goa_oauth2_based_proxy_new_finish(
      $!gobp,
      $res,
      $error
    );
    set_error($error);

    $oauth2-based-proxy ?? self.bless( :$oauth2-based-proxy ) !! Nil;
  }

  method new_for_bus_finish (
    GAsyncResult             $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $oauth2-based-proxy = goa_oauth2_based_proxy_new_for_bus_finish(
      $!gobp,
      $res,
      $error
    );
    set_error($error);

    $oauth2-based-proxy ?? self.bless( :$oauth2-based-proxy ) !! Nil;
  }

  proto method new_for_bus (|)
  { * }

  multi method new_for_bus (
    Int()          $bus_type,
    Int()          $flags,
    Str()          $name,
    Str()          $object_path,
                   &callback,
    gpointer       $user_data     = gpointer,
    GCancellable() :$cancellable  = GCancellable,
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

    my $oauth2-based-proxy = goa_oauth2_based_proxy_new_for_bus(
      $!gobp,
      $b,
      $f,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );

    $oauth2-based-proxy ?? self.bless( :$oauth2-based-proxy ) !! Nil;
  }

  method new_for_bus_sync (
    Int()                   $bus_type,
    Int()                   $flags,
    Str()                   $name,
    Str()                   $object_path,
    GCancellable()          $cancellable  = GCancellable,
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my GBusType        $b = $bus_type;
    my GDBusProxyFlags $f = $flags;

    clear_error;
    my $oauth2-based-proxy = goa_oauth2_based_proxy_new_for_bus_sync(
      $!gobp,
      $b,
      $f,
      $name,
      $object_path,
      $cancellable,
      $error
    );
    set_error($error);

    $oauth2-based-proxy ?? self.bless( :$oauth2-based-proxy ) !! Nil;
  }

  method new_sync (
    GDBusConnection()       $connection,
    Int()                   $flags,
    Str()                   $name,
    Str()                   $object_path,
    GCancellable()          $cancellable  = GCancellable
    CArray[Pointer[GError]] $error        = gerror
  ) {
    my GDBusProxyFlags $f = $flags;

    clear_error;
    my $oauth2-based-proxy = goa_oauth2_based_proxy_new_sync(
      $!gobp,
      $connection,
      $flags,
      $name,
      $object_path,
      $cancellable,
      $error
    );
    set_error($error);

    $oauth2-based-proxy ?? self.bless( :$oauth2-based-proxy ) !! Nil;
  }

  method new (
    Int()          $flags,
    Str()          $name,
    Str()          $object_path,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  ) {
    my $oauth2-based-proxy = goa_oauth2_based_proxy_new(
      $!gobp,
      $flags,
      $name,
      $object_path,
      $cancellable,
      &callback,
      $user_data
    );

    $oauth2-based-proxy ?? self.bless( :$oauth2-based-proxy ) !! Nil;
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_oauth2_based_proxy_get_type, $n, $t );
  }

}

our subset GoaOAuth2BasedProxyAncestry is export of Mu
  where GoaOAuth2BasedProxy | GoaOAuth2Based | GObject;

class GOA::OAuth2BasedProxy is GOA::OAuth2Based
  does GOA::Roles::OAuth2BasedProxy
{

  submethod BUILD ( :$oauth2-based-proxy ) {
    self.setOAuth2BasedProxy($oauth2-based-proxy) if $oauth2-based-proxy;
  }

  method setOAuth2BasedProxy (GoaOAuth2BasedProxyAncestry $_) {
    my $to-parent;

    $!gap = do {
      when GoaOAuth2BasedProxy {
        $to-parent = cast(GoaOAuth2Based, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaOAuth2BasedProxy, $_);
      }
    }
    self.setGoaOAuth2Based($to-parent);
    self.roleInit-GoaOAuth2BasedProxy;
  }

  method new (
    GoaOAuth2BasedProxyAncestry $oauth2-based-proxy,
                                  :$ref                  = True
  ) {
    return Nil unless $oauth2-based-proxy;

    my $o = self.bless( :$oauth2-based-proxy );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    self.GOA::Roles::OAuth2BasedProxy::get_type;
  }

}
