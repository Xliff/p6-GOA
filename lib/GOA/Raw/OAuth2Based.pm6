use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GLib::Raw::Object;
use GLib::Class::Object;
use GIO::Raw::Definitions;
use GIO::DBus::Raw::Types;
use GOA::Raw::Definitions;

unit package GOa::Raw::OAuth2Based;

### /home/cbwood/Projects/p6-GOA/oauth2

sub goa_oauth2_based_call_get_access_token (
  GoaOAuth2Based $proxy,
  GCancellable   $cancellable,
                 &callback (GObject, GAsyncResult, gpointer),
  gpointer       $user_data
)
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_call_get_access_token_finish (
  GoaOAuth2Based          $proxy,
  CArray[Str]             $out_access_token,
  gint                    $out_expires_in is rw,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_call_get_access_token_sync (
  GoaOAuth2Based          $proxy,
  CArray[Str]             $out_access_token,
  gint                    $out_expires_in is rw,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_complete_get_access_token (
  GoaOAuth2Based        $object,
  GDBusMethodInvocation $invocation,
  Str                   $access_token,
  gint                  $expires_in
)
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_dup_client_id (GoaOAuth2Based $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_dup_client_secret (GoaOAuth2Based $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_get_client_id (GoaOAuth2Based $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_get_client_secret (GoaOAuth2Based $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

  sub goa_oauth2_based_interface_info ()
  returns GDBusInterfaceInfo
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_override_properties (
  GObjectClass $klass,
  guint        $property_id_begin
)
  returns guint
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_set_client_id (GoaOAuth2Based $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_oauth2_based_set_client_secret (GoaOAuth2Based $object, Str $value)
  is native(goa)
  is export
{ * }
