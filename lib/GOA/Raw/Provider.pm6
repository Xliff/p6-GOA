use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GOA::Raw::Definitions;
use GOA::Raw::Enums;
use GTK::Raw::Definitions;

### /usr/include/goa-1.0/goabackend/goaprovider.h

sub goa_provider_add_account (
  GoaProvider             $self,
  GoaClient               $client,
  GtkDialog               $dialog,
  GtkBox                  $vbox,
  CArray[Pointer[GError]] $error
)
  returns GoaObject
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_all (
           &callback (GoaProvider, GAsyncResult, gpointer),
  gpointer $user_data
)
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_all_finish (
  CArray[GList]           $out_providers,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_credentials_generation (GoaProvider $self)
  returns guint
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_for_provider_type (Str $provider_type)
  returns GoaProvider
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_preseed_data (GoaProvider $self)
  returns GVariant
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_provider_features (GoaProvider $self)
  returns GoaProviderFeatures
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_provider_group (GoaProvider $self)
  returns GoaProviderGroup
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_provider_icon (GoaProvider $self, GoaObject $object)
  returns GIcon
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_provider_name (GoaProvider $self, GoaObject $object)
  returns Str
  is native(goabackend)
  is export
{ * }

sub goa_provider_get_provider_type (GoaProvider $self)
  returns Str
  is native(goabackend)
  is export
{ * }

sub goa_provider_refresh_account (
  GoaProvider             $self,
  GoaClient               $client,
  GoaObject               $object,
  GtkWindow               $parent,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goabackend)
  is export
{ * }

sub goa_provider_set_preseed_data (
  GoaProvider $self,
  GVariant    $preseed_data
)
  is native(goabackend)
  is export
{ * }

sub goa_provider_show_account (
  GoaProvider $self,
  GoaClient   $client,
  GoaObject   $object,
  GtkBox      $vbox,
  GtkGrid     $dummy1,
  GtkGrid     $dummy2
)
  is native(goabackend)
  is export
{ * }

sub goa_util_account_notify_property_cb (
  GObject    $object,
  GParamSpec $pspec,
  gpointer   $user_data
)
  is native(goabackend)
  is export
{ * }

sub goa_util_add_row_switch_from_keyfile_with_blurb (
  GtkGrid   $grid,
  gint      $row,
  GoaObject $object,
  Str       $label_text,
  Str       $key,
  Str       $blurb
)
  returns GtkWidget
  is native(goabackend)
  is export
{ * }

sub goa_util_add_row_widget (
  GtkGrid   $grid,
  gint      $row,
  Str       $label_text,
  GtkWidget $widget
)
  returns GtkWidget
  is native(goabackend)
  is export
{ * }

sub goa_util_lookup_keyfile_boolean (GoaObject $object, Str $key)
  returns uint32
  is native(goabackend)
  is export
{ * }

sub goa_util_lookup_keyfile_string (GoaObject $object, Str $key)
  returns Str
  is native(goabackend)
  is export
{ * }
