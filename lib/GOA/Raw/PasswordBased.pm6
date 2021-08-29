
### /home/cbwood/Projects/p6-GOA/password_based

sub goa_password_based_call_get_password (
  GoaPasswordBased    $proxy,
  Str                 $arg_id,
  GCancellable        $cancellable,
  GAsyncReadyCallback $callback,
  gpointer            $user_data
)
  is native(goa)
  is export
{ * }

sub goa_password_based_call_get_password_finish (
  GoaPasswordBased        $proxy,
  Str                     $out_password,
  GAsyncResult            $res,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_password_based_call_get_password_sync (
  GoaPasswordBased        $proxy,
  Str                     $arg_id,
  Str                     $out_password,
  GCancellable            $cancellable,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(goa)
  is export
{ * }

sub goa_password_based_complete_get_password (
  GoaPasswordBased      $object,
  GDBusMethodInvocation $invocation,
  Str                   $password
)
  is native(goa)
  is export
{ * }

sub goa_password_based_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_password_based_interface_info ()
  returns GDBusInterfaceInfo
  is native(goa)
  is export
{ * }

sub goa_password_based_override_properties (
  GObjectClass $klass,
  guint        $property_id_begin
)
  returns guint
  is native(goa)
  is export
{ * }
