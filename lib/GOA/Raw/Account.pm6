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

unit package GOA::Raw::Account;

### /home/cbwood/Projects/p6-GOA/account

sub goa_account_call_ensure_credentials (
  GCancellable $cancellable,
  GoaAccount   $proxy,
               &callback (GObject, GAsyncResult, gpointer),
  gpointer     $user_data
)
  is native(goa)
  is export
{ * }

sub goa_account_call_ensure_credentials_finish (
  GoaAccount              $proxy,
  gint                    $out_expires_in is rw,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_call_ensure_credentials_sync (
  GoaAccount              $proxy,
  gint                    $out_expires_in is rw,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_call_remove (
  GoaAccount   $proxy,
  GCancellable $cancellable,
               &callback (GObject, GAsyncResult, gpointer),
  gpointer     $user_data
)
  is native(goa)
  is export
{ * }

sub goa_account_call_remove_finish (
  GoaAccount              $proxy,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_call_remove_sync (
  GoaAccount              $proxy,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_complete_ensure_credentials (
  GoaAccount            $object,
  GDBusMethodInvocation $invocation,
  gint                  $expires_in
)
  is native(goa)
  is export
{ * }

sub goa_account_complete_remove (
  GoaAccount            $object,
  GDBusMethodInvocation $invocation
)
  is native(goa)
  is export
{ * }

sub goa_account_dup_id (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_dup_identity (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_dup_presentation_identity (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_dup_provider_icon (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_dup_provider_name (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_dup_provider_type (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_get_attention_needed (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_calendar_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_chat_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_contacts_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_documents_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_files_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_id (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_get_identity (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_get_is_locked (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_is_temporary (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_mail_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_maps_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_music_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_photos_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_presentation_identity (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_get_printers_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_provider_icon (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_get_provider_name (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_get_provider_type (GoaAccount $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_account_get_read_later_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_ticketing_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_todo_disabled (GoaAccount $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_account_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_account_interface_info ()
  returns GDBusInterfaceInfo
  is native(goa)
  is export
{ * }

sub goa_account_override_properties (
  GObjectClass $klass,
  guint        $property_id_begin
)
  returns guint
  is native(goa)
  is export
{ * }

sub goa_account_set_attention_needed (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_calendar_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_chat_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_contacts_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_documents_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_files_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_id (GoaAccount $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_identity (GoaAccount $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_is_locked (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_is_temporary (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_mail_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_maps_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_music_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_photos_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_presentation_identity (GoaAccount $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_printers_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_provider_icon (GoaAccount $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_provider_name (GoaAccount $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_provider_type (GoaAccount $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_read_later_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_ticketing_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_account_set_todo_disabled (GoaAccount $object, gboolean $value)
  is native(goa)
  is export
{ * }
