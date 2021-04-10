use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GOA::Raw::Definitions;

unit package GOA::Raw::Client;

### /usr/include/goa-1.0/goa/goaclient.h

sub goa_client_get_accounts (GoaClient $self)
  returns GList
  is native(goa)
  is export
{ * }

sub goa_client_get_manager (GoaClient $self)
  returns GoaManager
  is native(goa)
  is export
{ * }

sub goa_client_get_object_manager (GoaClient $self)
  returns GDBusObjectManager
  is native(goa)
  is export
{ * }

sub goa_client_lookup_by_id (GoaClient $self, Str $id)
  returns GoaObject
  is native(goa)
  is export
{ * }

sub goa_client_new (
  GCancellable $cancellable,
               &callback (GoaClient, GAsyncResult, gpointer),
  gpointer     $user_data
)
  is native(goa)
  is export
{ * }

sub goa_client_new_finish (GAsyncResult $res, CArray[Pointer[GError]] $error)
  returns GoaClient
  is native(goa)
  is export
{ * }

sub goa_client_new_sync (
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns GoaClient
  is native(goa)
  is export
{ * }
