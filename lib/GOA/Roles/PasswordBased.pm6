use v6.c;

use NativeCall;

use GOA::Raw::Types;
use GOA::Raw::PasswordBased;

use GLib::Class::Object;

use GLib::Roles::Object;

role GOA::Roles::PasswordBased {
  also does GLib::Roles::Object;

  has GoaPasswordBased $!gp;

  method roleInit-GoaPasswordBased {
    return if $!gp;

    my \i = findProperImplementor(self.^attributes);
    $!gp = cast( GoaPasswordBased, i.get_value(self) );
  }

  method GOA::Raw::Definitions::GoaPasswordBased
  { $!gp }

  method interface_info (::?CLASS:U: ) {
    goa_password_based_interface_info();
  }

  method complete_get_password (
    GDBusMethodInvocation() $invocation,
    Str()                   $password
  ) {
    goa_password_based_complete_get_password($!gp, $invocation, $password);
  }

  proto method call_get_password (|)
  { * }

  multi method call_get_password (
    Str()          $arg_id,
                   &callback,
    gpointer       $user_data    = gpointer,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith(
      $arg_id,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method call_get_password (
    Str()          $arg_id,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data    = gpointer
  ) {
    goa_password_based_call_get_password(
      $!gp,
      $arg_id,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method call_get_password_sync (
    Str                     $arg_id,
    Str                     $out_password,
    GCancellable()          $cancellable,
    CArray[Pointer[GError]] $error
  ) {
    clear_error;
    goa_password_based_call_get_password_sync(
      $!gp,
      $arg_id,
      $out_password,
      $cancellable,
      $error
    );
    set_error($error);
  }

  proto method call_get_password_finish (|)
  { * }

  multi method call_get_password_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error         = gerror
  ) {
    my $rv = samewith($, $res, $error, :all);
    $rv[0] ?? $rv[1] !! Nil;
  }
  multi method call_get_password_finish (
                            $out_password,
    GAsyncResult            $res,
    CArray[Pointer[GError]] $error         = gerror,
                            :$all          = False
  ) {
    my $op = '';

    clear_error;
    my $rv = goa_password_based_call_get_password_finish(
      $!gp,
      $op,
      $res,
      $error
    );
    set_error($error);
    $out_password = $op;
    $all.not ?? $rv !! ($rv, $out_password);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_password_based_get_type, $n, $t );
  }

  method override_properties (
    ::?CLASS:U:

    GObjectClass() $klass,
    Int()          $property_id_begin
  ) {
    my guint $p = 0;

    goa_password_based_override_properties($klass, $p);
  }

}

our subset GoaPasswordBasedAncestry is export of Mu
  where GoaPasswordBased | GObject;

class GOA::PasswordBased does GOA::Roles::PasswordBased {

  submethod BUILD (:$Password) {
    self.setGoaPassword($Password) if $Password;
  }

  method setGoaPassword (GoaPasswordBasedAncestry $_) {
    my $to-parent;

    $!gp = do {
      when GoaPasswordBased {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaPasswordBased, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GoaPasswordBased;
  }

  method new (GoaPasswordBasedAncestry $Password, :$ref = True) {
    return Nil unless $Password;

    my $o = self.bless( :$Password );
    $o.ref if $ref;
    $o;
  }

  method get_type (GOA::PasswordBased:U: ) {
    self.GOA::Roles::PasswordBased::get_type;
  }

}
