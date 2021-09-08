use v6.c;

use Method::Also;

use NativeCall;

use GTK::Raw::Definitions;
use GOA::Raw::Types;
use GOA::Raw::Provider;

use GLib::GList;

use GLib::Roles::Object;

our subset GoaProviderAncestry is export of Mu
  where GoaProvider | GObject;

class GOA::Provider {
  also does GLib::Roles::Object;

  has GoaProvider $!gp;

  submethod BUILD (:$provider) {
    self.setProvider($provider) if $provider;
  }

  method setProvider (GoaProviderAncestry $_) {
    my $to-parent;

    $!gp = do {
      when GoaProvider {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaProvider, $_);
      }
    }
    self!setObject($to-parent);
  }

  method new (GoaProviderAncestry $provider, :$ref = True) {
    return Nil unless $provider;

    my $o = self.bless( :$provider );
    $o.ref if $ref;
    $o;
  }

  method GOA::Raw::Definitions::GoaProvider
    is also<GoaProvider>
  { $!gp }

  method add_account (
    GoaClient()             $client,
    GtkDialog()             $dialog,
    GtkBox()                $vbox,
    CArray[Pointer[GError]] $error
  )
    is also<add-account>
  {
    goa_provider_add_account($!gp, $client, $dialog, $vbox, $error);
  }

  method get_all (
    GOA::Provider:U:

             &callback,
    gpointer $user_data = gpointer
  )
    is also<get-all>
  {
    goa_provider_get_all(&callback, $user_data);
  }


  proto method get_all_finish (|)
  { * }

  multi method get_all_finish (
    GOA::Provider:U:

    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error         =  gerror,
                            :$raw          =  False,
                            :$glist        =  False
  ) {
    samewith($, $result, $error, :$raw, :$glist);
  }
  multi method get_all_finish (
    GOA::Provider:U:

                            $out_providers is rw,
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error         =  gerror,
                            :$raw          =  False,
                            :$glist        =  False,
                            :$seq          =  True
  )
    is also<get-all-finish>
  {
    (my $opl = CArray[GList].new)[0] = GList;
    clear_error;
    my $rv = goa_provider_get_all_finish($opl, $result, $error);
    set_error($error);

    return Nil unless $rv;

    returnGList(
      ppr($opl),
      $raw,
      $glist,
      GoaProvider,
      GOA::Provider,
      :$seq
    );
  }

  method get_credentials_generation is also<get-credentials-generation> {
    goa_provider_get_credentials_generation($!gp);
  }

  method get_for_provider_type (GOA::Provider:U: Str() $type )
    is also<get-for-provider-type>
  {
    my $provider = goa_provider_get_for_provider_type($type);

    $provider ?? self.bless( :$provider ) !! Nil;
  }

  method get_preseed_data (:$raw = False)
    is DEPRECATED
    is also<get-preseed-data>
  {
    returnObject(
      goa_provider_get_preseed_data($!gp),
      $raw,
      GVariant,
      GLib::Variant
    )
  }

  method get_provider_features (:$raw = False) is also<get-provider-features> {
    # Bitmapped!
    goa_provider_get_provider_features($!gp);
  }

  method get_provider_group (:$raw = False)
    is DEPRECATED<.goa_provider_get_provider_features>
    is also<get-provider-group>
  {
    GoaProviderGroup( goa_provider_get_provider_group($!gp) )

  }

  method get_provider_icon (GoaObject() $object, :$raw = False)
    is also<get-provider-icon>
  {
    returnObject(
      goa_provider_get_provider_icon($!gp, $object),
      $raw,
      GIcon,
      GIO::Icon
    );
  }

  method get_provider_name (GoaObject() $object = GoaObject)
    is also<get-provider-name>
  {
    goa_provider_get_provider_name($!gp, $object);
  }

  method get_provider_type is also<get-provider-type> {
    goa_provider_get_provider_type($!gp);
  }

  method refresh_account (
    GoaClient()             $client,
    GoaObject()             $object,
    GtkWindow()             $parent,
    CArray[Pointer[GError]] $error
  )
    is also<refresh-account>
  {
    goa_provider_refresh_account($!gp, $client, $object, $parent, $error);
  }

  method set_preseed_data (GVariant() $preseed_data)
    is DEPRECATED
    is also<set-preseed-data>
  {
    goa_provider_set_preseed_data($!gp, $preseed_data);
  }

  method show_account (
    GoaClient() $client,
    GoaObject() $object,
    GtkBox()    $vbox,
    GtkGrid()   $dummy1,
    GtkGrid()   $dummy2
  )
    is also<show-account>
  {
    goa_provider_show_account($!gp, $client, $object, $vbox, $dummy1, $dummy2);
  }

}

use GLib::Roles::StaticClass;

class GOA::Util {
  also does GLib::Roles::StaticClass;

  method account_notify_property_cb (
    GObject()    $object,
    GParamSpec() $pspec,
    gpointer     $user_data = gpointer
  )
    is also<account-notify-property-cb>
  {
    goa_util_account_notify_property_cb($object, $pspec, $user_data);
  }

  method add_row_switch_from_keyfile_with_blurb (
    GtkGrid()   $grid,
    Int()       $row,
    GoaObject() $object,
    Str()       $label_text,
    Str()       $key,
    Str()       $blurb,
                :$raw        = False
  )
    is also<add-row-switch-from-keyfile-with-blurb>
  {
    my gint $r = $row;

    my $w = goa_util_add_row_switch_from_keyfile_with_blurb(
      $grid,
      $r,
      $object,
      $label_text,
      $key,
      $blurb
    );

    returnObject($w, $raw, GtkWidget, GTK::Widget);
  }

  method add_row_widget (
    GtkGrid()   $grid,
    Int()       $row,
    Str()       $label_text,
    GtkWidget() $widget,
                :$raw        = False
  )
    is also<add-row-widget>
  {
    my gint $r = $row;

    returnObject(
      goa_util_add_row_widget($grid, $r, $label_text, $widget),
      $raw,
      GtkWidget,
      GTK::Widget
    );
  }

  method lookup_keyfile_boolean (GoaObject() $object, Str() $key)
    is also<lookup-keyfile-boolean>
  {
    so goa_util_lookup_keyfile_boolean($object, $key);
  }

  method lookup_keyfile_string (GoaObject() $object, Str() $key)
    is also<lookup-keyfile-string>
  {
    goa_util_lookup_keyfile_string($object, $key);
  }

}
