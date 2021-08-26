use v6.c;

use NativeCall;

use GLib::Class::Object;
use GOA::Raw::Types;
use GOA::Raw::Manager;

use GLib::Roles::Object;

role GOA::Roles::Manager {
  also does GLib::Roles::Object;

  has GoaManager $!gm;

  method roleInit-GoaManager {
    return if $!gm;

    my \i = findProperImplementor(self.^attributes);
    $!gm = cast( GoaManager, i.get_value(self) );
  }

  proto method call_add_account (|)
  { * }

  multi method call_add_account (
    Str()          $arg_provider,
    Str()          $arg_identity,
    Str()          $arg_presentation_identity,
    GVariant()     $arg_credentials,
    GVariant()     $arg_details,
                   &callback,
    gpointer       $user_data                  = gpointer,
    GCancellable() :$cancellable               = GCancellable
  ) {
    samewith(
      $arg_provider,
      $arg_identity,
      $arg_presentation_identity,
      $arg_credentials,
      $arg_details,
      $cancellable,
      &callback,
      $user_data
    )
  }
  multi method call_add_account (
    Str()          $arg_provider,
    Str()          $arg_identity,
    Str()          $arg_presentation_identity,
    GVariant()     $arg_credentials,
    GVariant()     $arg_details,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data                  = gpointer
  ) {
    goa_manager_call_add_account(
      $!gm,
      $arg_provider,
      $arg_identity,
      $arg_presentation_identity,
      $arg_credentials,
      $arg_details,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method call_add_account_finish (
    Str()                   $out_account_object_path,
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error
  ) {
    clear_error;
    my $rv = so goa_manager_call_add_account_finish(
      $!gm,
      $out_account_object_path,
      $res,
      $error
    );
    set_error($error);
    $rv;
  }

  proto method call_add_account_sync (|)
  { * }

  multi method call_add_account_sync (
    Str()                   $arg_provider,
    Str()                   $arg_identity,
    Str()                   $arg_presentation_identity,
    GVariant()              $arg_credentials,
    GVariant()              $arg_details,
    CArray[Pointer[GError]] $error                      =  gerror,
    GCancellable()          :$cancellable               =  GCancellable
  ) {
    samewith(
      $arg_provider,
      $arg_identity,
      $arg_presentation_identity,
      $arg_credentials,
      $arg_details,
      $,
      $cancellable,
      $error
    );
  }
  multi method call_add_account_sync (
    Str()                   $arg_provider,
    Str()                   $arg_identity,
    Str()                   $arg_presentation_identity,
    GVariant()              $arg_credentials,
    GVariant()              $arg_details,
                            $out_account_object_path    is rw,
    GCancellable()          $cancellable                =  GCancellable,
    CArray[Pointer[GError]] $error                      =  gerror
  ) {
    (my $oaop = CArray[Str].new)[0] = Str;

    clear_error;
    my $rv = so goa_manager_call_add_account_sync(
      $arg_provider,
      $arg_identity,
      $arg_presentation_identity,
      $arg_credentials,
      $arg_details,
      $oaop,
      $cancellable,
      $error
    );
    set_error($error);

    $out_account_object_path = ppr($oaop);
    $rv;
  }

  proto method call_is_supported_provider (|)
  { * }

  multi method call_is_supported_provider (
    Str()          $arg_provider_type,
                   &callback,
    gpointer       $user_data          = gpointer,
    GCancellable() :$cancellable       = GCancellable
  ) {
    samewith(
      $arg_provider_type,
      $cancellable,
      &callback,
      $user_data
    );
  }
  multi method call_is_supported_provider (
    Str()          $arg_provider_type,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data          = gpointer
  ) {
    goa_manager_call_is_supported_provider(
      $!gm,
      $arg_provider_type,
      $cancellable,
      &callback,
      $user_data
    );
  }

  proto method call_is_supported_provider_finish (|)
  { * }

  multi method call_is_supported_provider_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  ) {
    samewith($, $res, $error);
  }
  multi method call_is_supported_provider_finish (
                            $out_is_supported is rw,
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error            =  gerror
  ) {
    my gboolean $o = 0;

    clear_error;
    my $rv = so goa_manager_call_is_supported_provider_finish(
      $!gm,
      $o,
      $res,
      $error
    );
    set_error($error);
    $out_is_supported = $o.so;
    $rv;
  }

  proto method call_is_supported_provider_sync (|)
  { * }

  multi method call_is_supported_provider_sync (
    Str()                   $arg_provider_type,
    CArray[Pointer[GError]] $error              = gerror,
    GCancellable()          :$cancellable       = GCancellable,
  ) {
    samewith(
      $arg_provider_type,
      $,
      $cancellable,
      $error
    );
  }
  multi method call_is_supported_provider_sync (
    Str()                   $arg_provider_type,
                            $out_is_supported   is rw,
    GCancellable()          $cancellable,
    CArray[Pointer[GError]] $error              =  gerror
  ) {
    my gboolean $ois = 0;
    clear_error;
    my $rv = so goa_manager_call_is_supported_provider_sync(
      $!gm,
      $arg_provider_type,
      $ois,
      $cancellable,
      $error
    );
    set_error($error);
    $out_is_supported = $ois.so;
    $rv;
  }

  method complete_add_account (
    GDBusMethodInvocation() $invocation,
    Str()                   $account_object_path
  ) {
    goa_manager_complete_add_account($!gm, $invocation, $account_object_path);
  }

  method complete_is_supported_provider (
    GDBusMethodInvocation() $invocation,
    Int()                   $is_supported
  ) {
    my gboolean $i = $is_supported.so.Int;

    goa_manager_complete_is_supported_provider($!gm, $invocation, $i);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_manager_get_type, $n, $t );
  }

  method interface_info (::?CLASS:U: ) {
    goa_manager_interface_info();
  }

  method override_properties (
    ::?CLASS:U:
    GObjectClass() $klass,
    Int()          $property_id_begin
  ) {
    my guint $p = $property_id_begin;

    goa_manager_override_properties($klass, $p);
  }
}

our subset GoaManagerAncestry is export of Mu
  where GoaManager | GObject;

class GOA::Manager does GOA::Roles::Manager {

  submethod BUILD (:$manager) {
    self.setManager($manager) if $manager;
  }

  method setManager (GoaManagerAncestry $_) {
    my $to-parent;

    $!gm = do {
      when GoaManager {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaManager, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GoaManager;
  }

  method new (GoaManagerAncestry $manager, :$ref = True) {
    return Nil unless $manager;

    my $o = self.bless( :$manager );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    GOA::Manager.GoaManager_get_type;
  }

}
