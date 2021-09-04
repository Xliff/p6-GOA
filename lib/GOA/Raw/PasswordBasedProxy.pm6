use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GIO::Raw::Definitions;
use GLib::Class::Object;
use GIO::Raw::Types;
use GIO::DBus::Raw::Types;
use GOA::Raw::Definitions;

unit package GOA::Raw::PasswordBasedProxy;

### /home/cbwood/Projects/p6-GOA/password_based_proxy

sub goa_password_based_proxy_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_password_based_proxy_new (
  GDBusConnection $connection,
  GDBusProxyFlags $flags,
  Str             $name,
  Str             $object_path,
  GCancellable    $cancellable,
                  &callback (GoaPasswordBasedProxy, GAsyncResult, gpointer),
  gpointer        $user_data
)
  is native(goa)
  is export
{ * }

sub goa_password_based_proxy_new_finish (
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns GoaPasswordBased
  is native(goa)
  is export
{ * }

sub goa_password_based_proxy_new_for_bus (
  GBusType        $bus_type,
  GDBusProxyFlags $flags,
  Str             $name,
  Str             $object_path,
  GCancellable    $cancellable,
                  &callback (GoaPasswordBasedProxy, GAsyncResult, gpointer),
  gpointer        $user_data
)
  is native(goa)
  is export
{ * }

sub goa_password_based_proxy_new_for_bus_finish (
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns GoaPasswordBased
  is native(goa)
  is export
{ * }

sub goa_password_based_proxy_new_for_bus_sync (
  GBusType                $bus_type,
  GDBusProxyFlags         $flags,
  Str                     $name,
  Str                     $object_path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GoaPasswordBased
  is native(goa)
  is export
{ * }

sub goa_password_based_proxy_new_sync (
  GDBusConnection         $connection,
  GDBusProxyFlags         $flags,
  Str                     $name,
  Str                     $object_path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GoaPasswordBased
  is native(goa)
  is export
{ * }
