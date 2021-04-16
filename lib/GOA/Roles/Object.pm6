use v6.c;

use GOA::Raw::Types;
use GOA::Raw::Object;

use GLib::Roles::Object;
use GOA::Roles::Account;
use GOA::Roles::OAuth2Based;
use GOA::Roles::Calendar;

role GOA::Roles::Object {
  also does GLib::Roles::Object;

  has GoaObject $!go;

  method roleInit-GoaObject {
    return if $!go;

    my \i = findProperImplementor(self.^attributes);
    $!go = cast( GoaObject, i.get_value(self) )
  }

  method GOA::Raw::Definitions::GoaObject
  { $!go }

  # All get_* methods are "Transfer: full"

  method get_account (:$raw = False) {
    my $a = goa_object_get_account($!go);

    $a ??
      ( $raw ?? $a !! GOA::Account.new($a, :!ref) )
      !!
      Nil;
  }

  method get_calendar (:$raw = False) {
    my $c = goa_object_get_calendar($!go);

    $c ??
      ( $raw ?? $c !! GOA::Calendar.new($c, :!ref) )
      !!
      Nil;
  }

  #
  # method get_chat (:$raw = False) {
  #   goa_object_get_chat($!go);
  # }
  #
  # method get_contacts (:$raw = False) {
  #   goa_object_get_contacts($!go);
  # }
  #
  # method get_documents (:$raw = False) {
  #   goa_object_get_documents($!go);
  # }
  #
  # method get_exchange (:$raw = False) {
  #   goa_object_get_exchange($!go);
  # }
  #
  # method get_files (:$raw = False) {
  #   goa_object_get_files($!go);
  # }
  #
  # method get_mail (:$raw = False) {
  #   goa_object_get_mail($!go);
  # }
  #
  # method get_manager (:$raw = False) {
  #   goa_object_get_manager($!go);
  # }
  #
  # method get_maps (:$raw = False) {
  #   goa_object_get_maps($!go);
  # }
  #
  # method get_media_server (:$raw = False) {
  #   goa_object_get_media_server($!go);
  # }
  #
  # method get_music (:$raw = False) {
  #   goa_object_get_music($!go);
  # }

  method get_oauth2_based (:$raw = False) {
    my $oa2 = goa_object_get_oauth2_based($!go);

    $oa2 ??
      ( $raw ?? $oa2 !! GOA::OAuth2Based.new($oa2) )
      !!
      Nil;
  }

  # method get_oauth_based (:$raw = False) {
  #   goa_object_get_oauth_based($!go);
  # }
  #
  # method get_password_based (:$raw = False) {
  #   goa_object_get_password_based($!go);
  # }
  #
  # method get_photos (:$raw = False) {
  #   goa_object_get_photos($!go);
  # }
  #
  # method get_printers (:$raw = False) {
  #   goa_object_get_printers($!go);
  # }
  #
  # method get_read_later (:$raw = False) {
  #   goa_object_get_read_later($!go);
  # }
  #
  # method get_ticketing (:$raw = False) {
  #   goa_object_get_ticketing($!go);
  # }
  #
  # method get_todo (:$raw = False) {
  #   goa_object_get_todo($!go);
  # }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_object_get_type, $n, $t );
  }

  method peek_account (:$raw = False) {
    my $a = goa_object_peek_account($!go);

    $a ??
      ( $raw ?? $a !! GOA::Account.new($a) )
      !!
      Nil;
  }

  # method peek_calendar (:$raw = False) {
  #   goa_object_peek_calendar($!go);
  # }
  #
  # method peek_chat (:$raw = False) {
  #   goa_object_peek_chat($!go);
  # }
  #
  # method peek_contacts (:$raw = False) {
  #   goa_object_peek_contacts($!go);
  # }
  #
  # method peek_documents (:$raw = False) {
  #   goa_object_peek_documents($!go);
  # }
  #
  # method peek_exchange (:$raw = False) {
  #   goa_object_peek_exchange($!go);
  # }
  #
  # method peek_files (:$raw = False) {
  #   goa_object_peek_files($!go);
  # }
  #
  # method peek_mail (:$raw = False) {
  #   goa_object_peek_mail($!go);
  # }
  #
  # method peek_manager (:$raw = False) {
  #   goa_object_peek_manager($!go);
  # }
  #
  # method peek_maps (:$raw = False) {
  #   goa_object_peek_maps($!go);
  # }
  #
  # method peek_media_server (:$raw = False) {
  #   goa_object_peek_media_server($!go);
  # }
  #
  # method peek_music (:$raw = False) {
  #   goa_object_peek_music($!go);
  # }

  method peek_oauth2_based (:$raw = False) {
    my $oa2 = goa_object_peek_oauth2_based($!go);

    $oa2 ??
      ( $raw ?? $oa2 !! GOA::OAuth2Based.new($oa2) )
      !!
      Nil;
  }

  # method peek_oauth_based (:$raw = False) {
  #   goa_object_peek_oauth_based($!go);
  # }
  #
  # method peek_password_based (:$raw = False) {
  #   goa_object_peek_password_based($!go);
  # }
  #
  # method peek_photos (:$raw = False) {
  #   goa_object_peek_photos($!go);
  # }
  #
  # method peek_printers (:$raw = False) {
  #   goa_object_peek_printers($!go);
  # }
  #
  # method peek_read_later (:$raw = False) {
  #   goa_object_peek_read_later($!go);
  # }
  #
  # method peek_ticketing (:$raw = False) {
  #   goa_object_peek_ticketing($!go);
  # }
  #
  # method peek_todo (:$raw = False) {
  #   goa_object_peek_todo($!go);
  # }

}

our subset GoaObjectAncestry is export of Mu
  where GoaObject | GObject;

class GOA::Object does GOA::Roles::Object {

  submethod BUILD (:$object) {
    self.setGoaObject($object) if $object;
  }

  method setGoaObject (GoaObjectAncestry $_) {
    my $to-parent;

    $!go = do {
      when GoaObject {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaObject, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GoaObject;
  }

  method new (GoaObjectAncestry $object, :$ref = True) {
    return Nil unless $object;

    my $o = self.bless( :$object );
    $o.ref if $ref;
    $o;
  }

}
