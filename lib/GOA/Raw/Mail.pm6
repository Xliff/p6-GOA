use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GLib::Class::Object;
use GIO::Raw::Definitions;
use GIO::DBus::Raw::Types;
use GOA::Raw::Definitions;

unit package GOA::Raw::Mail;

### /home/cbwood/Projects/p6-GOA/c-definitions/mail

sub goa_mail_dup_email_address (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_dup_imap_host (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_dup_imap_user_name (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_dup_name (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_dup_smtp_host (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_dup_smtp_user_name (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_get_email_address (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_get_imap_accept_ssl_errors (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_imap_host (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_get_imap_supported (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_imap_use_ssl (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_imap_use_tls (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_imap_user_name (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_get_name (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_accept_ssl_errors (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_auth_login (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_auth_plain (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_auth_xoauth2 (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_host (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_supported (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_use_auth (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_use_ssl (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_use_tls (GoaMail $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_mail_get_smtp_user_name (GoaMail $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_mail_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_mail_interface_info ()
  returns GDBusInterfaceInfo
  is native(goa)
  is export
{ * }

sub goa_mail_override_properties (GObjectClass $klass, guint $property_id_begin)
  returns guint
  is native(goa)
  is export
{ * }

sub goa_mail_set_email_address (GoaMail $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_imap_accept_ssl_errors (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_imap_host (GoaMail $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_imap_supported (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_imap_use_ssl (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_imap_use_tls (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_imap_user_name (GoaMail $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_name (GoaMail $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_accept_ssl_errors (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_auth_login (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_auth_plain (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_auth_xoauth2 (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_host (GoaMail $object, Str $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_supported (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_use_auth (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_use_ssl (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_use_tls (GoaMail $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_mail_set_smtp_user_name (GoaMail $object, Str $value)
  is native(goa)
  is export
{ * }
