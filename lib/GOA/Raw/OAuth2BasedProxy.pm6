use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GIO::DBus::Raw::Types;
use GOA::Raw::Definitions;

### /home/cbwood/Projects/p6-GOA/oauth2_based_proxy

sub goa_oauth2_based_proxy_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_proxy_new (
  GDBusConnection     $connection,
  GDBusProxyFlags     $flags,
  Str                 $name,
  Str                 $object_path,
  GCancellable        $cancellable,
                      &callback (GoaOAuth2BasedProxy, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_proxy_new_finish (
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns GoaOAuth2Based
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_proxy_new_for_bus (
  GBusType        $bus_type,
  GDBusProxyFlags $flags,
  Str             $name,
  Str             $object_path,
  GCancellable    $cancellable,
                  &callback (GoaOAuth2BasedProxy, GAsyncResult, gpointer),
  gpointer        $user_data
)
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_proxy_new_for_bus_finish (
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns GoaOAuth2Based
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_proxy_new_for_bus_sync (
  GBusType                $bus_type,
  GDBusProxyFlags         $flags,
  Str                     $name,
  Str                     $object_path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GoaOAuth2Based
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_proxy_new_sync (
  GDBusConnection         $connection,
  GDBusProxyFlags         $flags,
  Str                     $name,
  Str                     $object_path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GoaOAuth2Based
  is native(goa)
  is export
{ * }
