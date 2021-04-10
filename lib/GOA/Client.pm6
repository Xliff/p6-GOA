use v6.c;

use NativeCall;
use Method::Also;

use GOA::Raw::Types;
use GOA::Raw::Client;

use GLib::GList;

use GLib::Roles::Object;
use GIO::Roles::AsyncInitable;
use GIO::Roles::Initable;
use GIO::DBus::Roles::ObjectManager;
use GOA::Roles::Object;

our subset GoaClientAncestry is export of Mu
  where GoaClient | GInitable | GAsyncInitable | GObject;

class GOA::Client {
  also does GLib::Roles::Object;
  also does GIO::Roles::AsyncInitable;
  also does GIO::Roles::Initable;

  has GoaClient $!gc is implementor;

  submethod BUILD (:$client, :$init, :$cancellable) {
    self.setGoaClient($client, :$init, :$cancellable) if $client;
  }

  submethod setGoaClient (GoaClientAncestry $_, :$init, :$cancellable) {
    my $to-parent;

    $!gc = do {
      when GoaClient {
        $to-parent = cast(GObject, $_);
        $_;
      }

      when GAsyncInitable {
        $to-parent = cast(GObject, $_);
        $!i = $_;
        cast(GoaClient, $_);
      }

      when GInitable {
        $to-parent = cast(GObject, $_);
        $!ai = $_;
        cast(GoaClient, $_);
      }

      default {
        $to-parent = $_;
        cast(GoaClient, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-AsyncInitable;
    self.roleInit-Initable(:$init, :$cancellable);
  }

  method GOA::Raw::Definitions::GoaClient
    is also<GoaClient>
  { $!gc }

  multi method new (GoaClientAncestry $client, :$ref = True) {
    return Nil unless $client;

    my $o = self.bless( :$client );
    $o.ref if $ref;
    $o;
  }

  multi method new (
                   &callback,
    gpointer       $user_data    = gpointer,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($cancellable, &callback, $user_data);
  }
  multi method new (
    GCancellable() $cancellable,
                   &callback,
    gpointer       $user_data = gpointer
  ) {
    my $client = goa_client_new($!gc, &callback, $user_data);

    $client ?? self.bless( :$client ) !! Nil;
  }

  method new_finish (
    GAsyncResult()          $res,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<new-finish>
  {
    my $client = goa_client_new_finish($res, $error);

    $client ?? self.bless( :$client ) !! Nil;
  }

  method new_sync (
    GCancellable()          $cancellable = GCancellable,
    CArray[Pointer[GError]] $error       = gerror
  )
    is also<new-sync>
  {
    my $client = goa_client_new_sync($cancellable, $error);

    $client ?? self.bless( :$client ) !! Nil;
  }

  # Type: GDBusObjectManager
  method object-manager (:$raw = False) is rw is also<object_manager> {
    my $gv = GLib::Value.new( GIO::DBus::ObjectManager.get-type );
    Proxy.new(
      FETCH => sub ($) {
        $gv = GLib::Value.new(
          self.prop_get('object-manager', $gv)
        );

        propReturnObject(
          $gv.object,
          $raw,
          GDBusObjectManager,
          GIO::DBus::ObjectManager
        )
      },
      STORE => -> $, $val is copy {
        warn 'object-manager does not allow writing'
      }
    );
  }

  # Is originally:
  # GoaClient, GoaObject, gpointer --> void
  method account-added is also<account_added> {
    self.connect-account-added($!gc, 'account-added');
  }

  # Is originally:
  # GoaClient, GoaObject, gpointer --> void
  method account-changed is also<account_changed> {
    self.connect-account-changed($!gc, 'account-changed');
  }

  # Is originally:
  # GoaClient, GoaObject, gpointer --> void
  method account-removed is also<account_removed> {
    self.connect-account-removed($!gc, 'account-removed');
  }


  method get_accounts (:$glist = False, :$raw = False) is also<get-accounts> {
    returnGList(
      goa_client_get_accounts($!gc),
      $glist,
      $raw,
      GoaObject,
      GOA::Object
    );
  }

  method get_manager (:$raw = False) is also<get-manager> {
    my $m = goa_client_get_manager($!gc);

    $m ??
      ( $raw ?? $m !! GOA::Manager.new($m) )
      !!
      Nil;
  }

  method get_object_manager (:$raw = False) is also<get-object-manager> {
    my $m = goa_client_get_object_manager($!gc);

    $m ??
      ( $raw ?? $m !! GIO::DBus::ObjectManager.new($m) )
      !!
      Nil;
  }

  method lookup_by_id (Str() $id) is also<lookup-by-id> {
    goa_client_lookup_by_id($!gc, $id);
  }

}
