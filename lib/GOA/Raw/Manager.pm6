use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use GLib::Class::Object;    # cw: DO NOT WANT (but need) --
                            #     Current distribution of Class files
                            #     needs to be broken up into traditional Raw/Class
                            #     compunits!
use GIO::Raw::Definitions;
use GIO::DBus::Raw::Types;
use GOA::Raw::Definitions;

unit package GOA::Raw::Manager;

### /home/cbwood/Projects/p6-GOA/manager

sub goa_manager_call_add_account (
  GoaManager          $proxy,
  Str                 $arg_provider,
  Str                 $arg_identity,
  Str                 $arg_presentation_identity,
  GVariant            $arg_credentials,
  GVariant            $arg_details,
  GCancellable        $cancellable,
                      &callback (GoaManager, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is native(goa)
  is export
{ * }

sub goa_manager_call_add_account_finish (
  GoaManager              $proxy,
  Str                     $out_account_object_path,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_manager_call_add_account_sync (
  GoaManager              $proxy,
  Str                     $arg_provider,
  Str                     $arg_identity,
  Str                     $arg_presentation_identity,
  GVariant                $arg_credentials,
  GVariant                $arg_details,
  Str                     $out_account_object_path,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_manager_call_is_supported_provider (
  GoaManager          $proxy,
  Str                 $arg_provider_type,
  GCancellable        $cancellable,
                      &callback (GoaManager, GAsyncResult, gpointer),
  gpointer            $user_data
)
  is native(goa)
  is export
{ * }

sub goa_manager_call_is_supported_provider_finish (
  GoaManager              $proxy,
  gboolean                $out_is_supported,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_manager_call_is_supported_provider_sync (
  GoaManager              $proxy,
  Str                     $arg_provider_type,
  gboolean                $out_is_supported,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_manager_complete_add_account (
  GoaManager            $object,
  GDBusMethodInvocation $invocation,
  Str                   $account_object_path
)
  is native(goa)
  is export
{ * }

sub goa_manager_complete_is_supported_provider (
  GoaManager            $object,
  GDBusMethodInvocation $invocation,
  gboolean              $is_supported
)
  is native(goa)
  is export
{ * }

sub goa_manager_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_manager_interface_info ()
  returns GDBusInterfaceInfo
  is native(goa)
  is export
{ * }

sub goa_manager_override_properties (
  GObjectClass $klass,
  guint        $property_id_begin
)
  returns guint
  is native(goa)
  is export
{ * }
