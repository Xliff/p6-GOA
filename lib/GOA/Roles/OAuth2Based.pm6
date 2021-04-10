use v6.c;

use NativeCall;

use GOA::Raw::Types;
use GOA::Raw::OAuth2Based;

use GLib::Class::Object;

use GLib::Roles::Object;
use GOA::Roles::Signals::OAuth2Based;

role GOA::Roles::OAuth2Based {
  also does GLib::Roles::Object;
  also does GOA::Roles::Signals::OAuth2Based;

  has GoaOAuth2Based $!goauth2;

  method roleInit-GoaOAuth2Based {
    return if $!goauth2;

    my \i = findProperImplementor(self.^attributes);
    $!goauth2 = cast( GoaOAuth2Based, i.get_value(self) );
  }

  method GOA::Raw::Definitions::GoaOAuth2Based
  { $!goauth2 }

  # Type: gchar
  method client-id is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('client-id', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('client-id', $gv);
      }
    );
  }

  # Type: gchar
  method client-secret is rw  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('client-secret', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('client-secret', $gv);
      }
    );
  }

  # Is originally:
  # GoaOAuth2Based, GDBusMethodInvocation, gpointer --> gboolean
  method handle-get-access-token {
    self.connect-handle-get-access-token($!goauth2);
  }

  method call_get_access_token (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  ) {
    goa_oauth2_based_call_get_access_token(
      $!goauth2,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method call_get_access_token_finish (
    CArray[Str]             $out_access_token,
    gint                    $out_expires_in    is rw,
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error             =  gerror
  ) {
    goa_oauth2_based_call_get_access_token_finish(
      $!goauth2,
      $out_access_token,
      $out_expires_in,
      $res, $error)
    ;
  }

  proto method call_get_access_token_sync (|)
  { * }

  multi method call_get_access_token_sync (
    GCancellable()          $cancellable       = GCancellable,
    CArray[Pointer[GError]] $error             = gerror
  ) {
    (my $oat = CArray[Str].new)[0] = Str;

    my $rv = samewith($oat, $, $cancellable, $error, :all);

    $rv[0] ?? $rv[1] !! Nil;
  }
  multi method call_get_access_token_sync (
    CArray[Str]             $out_access_token,
                            $out_expires_in    is rw,
    GCancellable()          $cancellable,
    CArray[Pointer[GError]] $error             =  gerror,
                            :$all              =  False
  ) {
    my gint $oei = 0;

    clear_error;
    my $rv = goa_oauth2_based_call_get_access_token_sync(
      $!goauth2,
      $out_access_token,
      $oei,
      $cancellable,
      $error
    );
    set_error($error);

    $out_expires_in = $oei;

    $all.not ?? $rv !! ($rv, $out_expires_in);
  }

  method complete_get_access_token (
    GDBusMethodInvocation() $invocation,
    Str()                   $access_token,
    Int()                   $expires_in
  ) {
    my gint $e = $expires_in;

    goa_oauth2_based_complete_get_access_token(
      $!goauth2,
      $invocation,
      $access_token,
      $expires_in
    );
  }

  method dup_client_id {
    goa_oauth2_based_dup_client_id($!goauth2);
  }

  method dup_client_secret {
    goa_oauth2_based_dup_client_secret($!goauth2);
  }

  method get_client_id {
    goa_oauth2_based_get_client_id($!goauth2);
  }

  method get_client_secret {
    goa_oauth2_based_get_client_secret($!goauth2);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_oauth2_based_get_type, $t, $n );
  }

  method interface_info (::?CLASS:U: ) {
    goa_oauth2_based_interface_info();
  }

  method override_properties (
    ::?CLASS:U:
    GObjectClass() $klass,
    Int()          $property_id_begin
  ) {
    my guint $p = $property_id_begin;

    goa_oauth2_based_override_properties($klass, $p);
  }

  method set_client_id (Str() $value) {
    goa_oauth2_based_set_client_id($!goauth2, $value);
  }

  method set_client_secret (Str() $value) {
    goa_oauth2_based_set_client_secret($!goauth2, $value);
  }

}

our subset GoaOAuth2BasedAncestry is export of Mu
  where GoaOAuth2Based | GObject;

class GOA::OAuth2Based does GOA::Roles::OAuth2Based {

  submethod BUILD (:$oauth2) {
    self.setGoaOAuth2($oauth2) if $oauth2;
  }

  method setGoaOAuth2 (GoaOAuth2BasedAncestry $_) {
    my $to-parent;

    $!goauth2 = do {
      when GoaOAuth2Based {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaOAuth2Based, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GoaOAuth2Based;
  }

  method new (GoaOAuth2BasedAncestry $oauth2, :$ref = True) {
    return Nil unless $oauth2;

    my $o = self.bless( :$oauth2 );
    $o.ref if $ref;
    $o;
  }

}
