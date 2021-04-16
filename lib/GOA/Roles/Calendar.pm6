use v6.c;

use GLib::Class::Object;
use GOA::Raw::Types;
use GOA::Raw::Calendar;

use GLib::Roles::Object;

role GOA::Roles::Calendar {
  also does GLib::Roles::Object;

  has GoaCalendar $!gc;

  method roleInit-GoaCalendar {
    return if $!gc;

    my \i = findProperImplementor(self.^attributes);
    $!gc = cast( GoaCalendar, i.get_value(self) );
  }

  # Type: gboolean
  method accept-ssl-errors is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('accept-ssl-errors', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('accept-ssl-errors', $gv);
      }
    );
  }

  # Type: gchar
  method uri is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('uri', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('uri', $gv);
      }
    );
  }

  method dup_uri {
    goa_calendar_dup_uri($!gc);
  }

  method get_accept_ssl_errors {
    goa_calendar_get_accept_ssl_errors($!gc);
  }

  method GoaCalendar_get_type (::?CLASS:U: ) {
    state ($n, $t);

    unstable_get_type(
      ::?CLASS.^name,
      &goa_calendar_get_type,
      $n,
      $t
    )
  }

  method get_uri {
    goa_calendar_get_uri($!gc);
  }

  method interface_info (::?CLASS:U: ) {
    goa_calendar_interface_info();
  }

  method override_properties (
    ::?CLASS:U:
    GObjectClass() $klass,
    Int()          $property_id_begin
  ) {
    my guint $p = $property_id_begin;

    goa_calendar_override_properties($klass, $p);
  }

  method set_accept_ssl_errors (Int() $value) {
    my gboolean $v = $value;

    goa_calendar_set_accept_ssl_errors($!gc, $v);
  }

  method set_uri (Str() $value) {
    goa_calendar_set_uri($!gc, $value);
  }

}

our subset GoaCalendarAncestry is export of Mu
  where GoaCalendar | GObject;

class GOA::Calendar does GOA::Roles::Calendar {

  submethod BUILD (:$calendar) {
    self.setCalendar($calendar) if $calendar;
  }

  method setCalendar (GoaCalendarAncestry $_) {
    my $to-parent;

    $!gc = do {
      when GoaCalendar {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaCalendar, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GoaCalendar;
  }

  method new (GoaCalendarAncestry $calendar, :$ref = True) {
    return Nil unless $calendar;

    my $o = self.bless( :$calendar );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    GOA::Calendar.GoaCalendar_get_type;
  }

}
