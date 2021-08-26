use v6.c;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use GLib::Class::Object;    # cw: DO NOT WANT (but need) --
                            #     Current distribution of Class files
                            #     needs to be broken up into traditional Raw/Class
                            #     compunits!
use GIO::Raw::Definitions;
use GIO::DBus::Raw::Types;
use GOA::Raw::Definition

unit package GOA::Raw::AccountProxy;

### /home/cbwood/Projects/p6-GOA/account_proxy

sub goa_account_proxy_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_account_proxy_new (
  GDBusConnection     $connection,
  GDBusProxyFlags     $flags,
  Str                 $name,
  Str                 $object_path,
  GCancellable        $cancellable,
  GAsyncReadyCallback $callback,
  gpointer            $user_data
)
  is native(goa)
  is export
{ * }

sub goa_account_proxy_new_finish (
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
  )
  returns GoaAccountProxy
  is native(goa)
  is export
{ * }

sub goa_account_proxy_new_for_bus (
  GBusType            $bus_type,
  GDBusProxyFlags     $flags,
  Str                 $name,
  Str                 $object_path,
  GCancellable        $cancellable,
                      &callback (GoaAccountProxy, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is native(goa)
  is export
{ * }

sub goa_account_proxy_new_for_bus_finish (
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
  )
  returns GoaAccountProxy
  is native(goa)
  is export
{ * }

sub goa_account_proxy_new_for_bus_sync (
  GBusType                $bus_type,
  GDBusProxyFlags         $flags,
  Str                     $name,
  Str                     $object_path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GoaAccountProxy
  is native(goa)
  is export
{ * }

sub goa_account_proxy_new_sync (
  GDBusConnection         $connection,
  GDBusProxyFlags         $flags,
  Str                     $name,
  Str                     $object_path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GoaAccountProxy
  is native(goa)
  is export
{ * }
