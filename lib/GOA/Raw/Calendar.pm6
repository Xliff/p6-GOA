use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Class::Object;
use GIO::DBus::Raw::Types;
use GOA::Raw::Definitions;

unit package GOA::Raw::Calendar;

### /home/cbwood/Projects/p6-GOA/calendar

sub goa_calendar_dup_uri (GoaCalendar $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_calendar_get_accept_ssl_errors (GoaCalendar $object)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_calendar_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_calendar_get_uri (GoaCalendar $object)
  returns Str
  is native(goa)
  is export
{ * }

sub goa_calendar_interface_info ()
  returns GDBusInterfaceInfo
  is native(goa)
  is export
{ * }

sub goa_calendar_override_properties (
  GObjectClass $klass,
  guint        $property_id_begin
)
  returns guint
  is native(goa)
  is export
{ * }

sub goa_calendar_set_accept_ssl_errors (GoaCalendar $object, gboolean $value)
  is native(goa)
  is export
{ * }

sub goa_calendar_set_uri (GoaCalendar $object, Str $value)
  is native(goa)
  is export
{ * }
