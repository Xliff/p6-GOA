use v6.c;

use NativeCall;

use GOA::Raw::Types;
use GOA::Raw::Account;

use GLib::Class::Object;

use GLib::Roles::Object;
use GOA::Roles::Signals::Account;

role GOA::Roles::Account {
  also does GLib::Roles::Object;
  also does GOA::Roles::Signals::Account;

  has GoaAccount $!ga;

  method roleInit-GoaAccount {
    return if $!ga;

    my \i = findProperImplementor(self.^attributes);
    $!ga = cast( GoaAccount, i.get_value(self) )
  }

  # Type: gboolean
  method attention-needed is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('attention-needed', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('attention-needed', $gv);
      }
    );
  }

  # Type: gboolean
  method calendar-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('calendar-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('calendar-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method chat-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('chat-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('chat-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method contacts-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('contacts-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('contacts-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method documents-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('documents-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('documents-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method files-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('files-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('files-disabled', $gv);
      }
    );
  }

  # Type: gchar
  method id is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('id', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('id', $gv);
      }
    );
  }

  # Type: gchar
  method identity is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('identity', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('identity', $gv);
      }
    );
  }

  # Type: gboolean
  method is-locked is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('is-locked', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('is-locked', $gv);
      }
    );
  }

  # Type: gboolean
  method is-temporary is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('is-temporary', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('is-temporary', $gv);
      }
    );
  }

  # Type: gboolean
  method mail-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('mail-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('mail-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method maps-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('maps-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('maps-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method music-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('music-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('music-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method photos-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('photos-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('photos-disabled', $gv);
      }
    );
  }

  # Type: gchar
  method presentation-identity is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('presentation-identity', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('presentation-identity', $gv);
      }
    );
  }

  # Type: gboolean
  method printers-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('printers-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('printers-disabled', $gv);
      }
    );
  }

  # Type: gchar
  method provider-icon is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('provider-icon', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('provider-icon', $gv);
      }
    );
  }

  # Type: gchar
  method provider-name is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('provider-name', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('provider-name', $gv);
      }
    );
  }

  # Type: gchar
  method provider-type is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('provider-type', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('provider-type', $gv);
      }
    );
  }

  # Type: gboolean
  method read-later-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('read-later-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('read-later-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method ticketing-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('ticketing-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('ticketing-disabled', $gv);
      }
    );
  }

  # Type: gboolean
  method todo-disabled is rw  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('todo-disabled', $gv)
        );
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('todo-disabled', $gv);
      }
    );
  }

  # Is originally:
  # GoaAccount, GDBusMethodInvocation, gpointer --> gboolean
  method handle-ensure-credentials {
    self.connect-method-invocation($!ga, 'handle-ensure-credentials');
  }

  # Is originally:
  # GoaAccount, GDBusMethodInvocation, gpointer --> gboolean
  method handle-remove {
    self.connect-method-invocation($!ga, 'handle-remove');
  }


  proto method call_ensure_credentials (|)
  { * }

  multi method call_ensure_credentials (
                   &callback,
    gpointer       $user_data    = gpointer,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($cancellable, &callback, $user_data);
  }
  multi method call_ensure_credentials (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  ) {
    goa_account_call_ensure_credentials(
      $!ga,
      $cancellable,
      &callback,
      $user_data
    );
  }

  proto method call_ensure_credentials_finish (|)
  { * }

  multi method call_ensure_credentials_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my $rv = samewith($, $res, $error, :all);

    $rv[0] ?? $rv[1] !! Nil;
  }
  multi method call_ensure_credentials_finish (
                            $out_expires_in is rw,
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error          =  gerror,
                            :$all           =  False
  ) {
    my gint $oei = 0;

    clear_error;
    my $rv = so goa_account_call_ensure_credentials_finish(
      $!ga,
      $oei,
      $res,
      $error
    );
    set_error($error);
    $out_expires_in = $oei;

    $all.not ?? $rv !! ($rv, $out_expires_in);
  }

  proto method call_ensure_credentials_sync (|)
  { * }

  multi method call_ensure_credentials_sync (
    GCancellable()          $cancellable    =  GCancellable,
    CArray[Pointer[GError]] $error          =  gerror
  ) {
    my $rv = samewith($, $cancellable, $error, :all);

    $rv[0] ?? $rv[1] !! Nil;
  }
  multi method call_ensure_credentials_sync (
                            $out_expires_in is rw,
    GCancellable()          $cancellable    =  GCancellable,
    CArray[Pointer[GError]] $error          =  gerror,
                            :$all           =  False
  ) {
    my gint $oei = 0;

    clear_error;
    my $rv = goa_account_call_ensure_credentials_sync(
      $!ga,
      $oei,
      $cancellable,
      $error
    );
    set_error($error);
    $out_expires_in = $oei;

    $all.not ?? $rv !! ($rv, $out_expires_in);
  }

  proto method call_remove (|)
  { * }

  multi method call_remove (
                   &callback,
    gpointer       $user_data    = gpointer,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($cancellable, &callback, $user_data);
  }
  multi method call_remove (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  ) {
    goa_account_call_remove($!ga, $cancellable, &callback, $user_data);
  }

  method call_remove_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $rv = so goa_account_call_remove_finish($!ga, $res, $error);
    set_error($error);
    $rv;
  }

  method call_remove_sync (
    GCancellable()          $cancellable = GCancellable,
    CArray[Pointer[GError]] $error       = gerror
  ) {
    goa_account_call_remove_sync($!ga, $cancellable, $error);
  }

  method complete_ensure_credentials (
    GDBusMethodInvocation() $invocation,
    Int()                   $expires_in
  ) {
    my gint $e = $expires_in;

    goa_account_complete_ensure_credentials($!ga, $invocation, $e);
  }

  method complete_remove (GDBusMethodInvocation() $invocation) {
    goa_account_complete_remove($!ga, $invocation);
  }

  method dup_id {
    goa_account_dup_id($!ga);
  }

  method dup_identity {
    goa_account_dup_identity($!ga);
  }

  method dup_presentation_identity {
    goa_account_dup_presentation_identity($!ga);
  }

  method dup_provider_icon {
    goa_account_dup_provider_icon($!ga);
  }

  method dup_provider_name {
    goa_account_dup_provider_name($!ga);
  }

  method dup_provider_type {
    goa_account_dup_provider_type($!ga);
  }

  method get_attention_needed {
    so goa_account_get_attention_needed($!ga);
  }

  method get_calendar_disabled {
    so goa_account_get_calendar_disabled($!ga);
  }

  method get_chat_disabled {
    so goa_account_get_chat_disabled($!ga);
  }

  method get_contacts_disabled {
    so goa_account_get_contacts_disabled($!ga);
  }

  method get_documents_disabled {
    so goa_account_get_documents_disabled($!ga);
  }

  method get_files_disabled {
    so goa_account_get_files_disabled($!ga);
  }

  method get_id {
    goa_account_get_id($!ga);
  }

  method get_identity {
    goa_account_get_identity($!ga);
  }

  method get_is_locked {
    so goa_account_get_is_locked($!ga);
  }

  method get_is_temporary {
    so goa_account_get_is_temporary($!ga);
  }

  method get_mail_disabled {
    so goa_account_get_mail_disabled($!ga);
  }

  method get_maps_disabled {
    so goa_account_get_maps_disabled($!ga);
  }

  method get_music_disabled {
    so goa_account_get_music_disabled($!ga);
  }

  method get_photos_disabled {
    so goa_account_get_photos_disabled($!ga);
  }

  method get_presentation_identity {
    goa_account_get_presentation_identity($!ga);
  }

  method get_printers_disabled {
    so goa_account_get_printers_disabled($!ga);
  }

  method get_provider_icon {
    goa_account_get_provider_icon($!ga);
  }

  method get_provider_name {
    goa_account_get_provider_name($!ga);
  }

  method get_provider_type {
    goa_account_get_provider_type($!ga);
  }

  method get_read_later_disabled {
    so goa_account_get_read_later_disabled($!ga);
  }

  method get_ticketing_disabled {
    so goa_account_get_ticketing_disabled($!ga);
  }

  method get_todo_disabled {
    so goa_account_get_todo_disabled($!ga);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_account_get_type, $n, $t );
  }

  method interface_info (::?CLASS:U: ) {
    goa_account_interface_info();
  }

  method override_properties (
    ::?CLASS:U:
    GObjectClass() $klass,
    Int()          $property_id_begin
  ) {
    my guint $p = $property_id_begin;

    goa_account_override_properties($klass, $p);
  }

  method set_attention_needed (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_account_set_attention_needed($!ga, $v);
  }

  method set_calendar_disabled (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_account_set_calendar_disabled($!ga, $v);
  }

  method set_chat_disabled (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_account_set_chat_disabled($!ga, $v);
  }

  method set_contacts_disabled (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_account_set_contacts_disabled($!ga, $v);
  }

  method set_documents_disabled (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_account_set_documents_disabled($!ga, $v);
  }

  method set_files_disabled (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_account_set_files_disabled($!ga, $v);
  }

  method set_id (Str() $value) {
    goa_account_set_id($!ga, $value);
  }

  method set_identity (Str() $value) {
    goa_account_set_identity($!ga, $value);
  }

  method set_is_locked (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_account_set_is_locked($!ga, $v);
  }

  method set_is_temporary (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_is_temporary($!ga, $v);
  }

  method set_mail_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_mail_disabled($!ga, $v);
  }

  method set_maps_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_maps_disabled($!ga, $v);
  }

  method set_music_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_music_disabled($!ga, $v);
  }

  method set_photos_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_photos_disabled($!ga, $v);
  }

  method set_presentation_identity (Str() $value) {
    goa_account_set_presentation_identity($!ga, $value);
  }

  method set_printers_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_printers_disabled($!ga, $v);
  }

  method set_provider_icon (Str() $value) {
    goa_account_set_provider_icon($!ga, $value);
  }

  method set_provider_name (Str() $value) {
    goa_account_set_provider_name($!ga, $value);
  }

  method set_provider_type (Str() $value) {
    goa_account_set_provider_type($!ga, $value);
  }

  method set_read_later_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_read_later_disabled($!ga, $v);
  }

  method set_ticketing_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_ticketing_disabled($!ga, $v);
  }

  method set_todo_disabled (Int() $value) {
    my gboolean $v = $value;

    goa_account_set_todo_disabled($!ga, $v);
  }

}

our subset GoaAccountAncestry is export of Mu
  where GoaAccount | GObject;

class GOA::Account does GOA::Roles::Account {

  submethod BUILD (:$account) {
    self.setGoaAccount($account) if $account;
  }

  method setGoaAccount (GoaAccountAncestry $_) {
    my $to-parent;

    $!ga = do {
      when GoaAccount {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaAccount, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GoaAccount;
  }

  method new (GoaAccountAncestry $account, :$ref = True) {
    return Nil unless $account;

    my $o = self.bless( :$account );
    $o.ref if $ref;
    $o;
  }

}
