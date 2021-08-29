use v6.c;

use GOA::Raw::Types;
use GOA::Raw::PasswordBased;

use GLib::Roles::Object;

role GOA::Roles::PasswordBased {
  also does GLib::Roles::Object;

  has GoaPasswordBased $!gp;

  method interface_info (::?CLASS:U: ) {
    goa_password_based_interface_info($!gp);
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
    gpointer       $user_data    = gpointer
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith(
      $arg_id,
      $cancellable,
      $callback,
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
      $callback,
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

  method override_properties (Int() $property_id_begin) {
    my guint $p = 0;

    goa_password_based_override_properties($!gp, $p);
  }

}
