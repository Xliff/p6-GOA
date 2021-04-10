use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GOA::Raw::Definitions;

unit package GOA::Raw::Object;

### /home/cbwood/Projects/p6-GOA/object

sub goa_object_get_account (GoaObject $object)
  returns GoaAccount
  is native(goa)
  is export
{ * }

# sub goa_object_get_calendar (GoaObject $object)
#   returns GoaCalendar
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_chat (GoaObject $object)
#   returns GoaChat
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_contacts (GoaObject $object)
#   returns GoaContacts
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_documents (GoaObject $object)
#   returns GoaDocuments
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_exchange (GoaObject $object)
#   returns GoaExchange
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_files (GoaObject $object)
#   returns GoaFiles
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_mail (GoaObject $object)
#   returns GoaMail
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_manager (GoaObject $object)
#   returns GoaManager
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_maps (GoaObject $object)
#   returns GoaMaps
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_media_server (GoaObject $object)
#   returns GoaMediaServer
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_music (GoaObject $object)
#   returns GoaMusic
#   is native(goa)
#   is export
# { * }
#
sub goa_object_get_oauth2_based (GoaObject $object)
  returns GoaOAuth2Based
  is native(goa)
  is export
{ * }
#
# sub goa_object_get_oauth_based (GoaObject $object)
#   returns GoaOAuthBased
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_password_based (GoaObject $object)
#   returns GoaPasswordBased
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_photos (GoaObject $object)
#   returns GoaPhotos
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_printers (GoaObject $object)
#   returns GoaPrinters
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_read_later (GoaObject $object)
#   returns GoaReadLater
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_ticketing (GoaObject $object)
#   returns GoaTicketing
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_get_todo (GoaObject $object)
#   returns GoaTodo
#   is native(goa)
#   is export
# { * }
#
sub goa_object_get_type ()
  returns GType
  is native(goa)
  is export
{ * }

sub goa_object_peek_account (GoaObject $object)
  returns GoaAccount
  is native(goa)
  is export
{ * }
#
# sub goa_object_peek_calendar (GoaObject $object)
#   returns GoaCalendar
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_chat (GoaObject $object)
#   returns GoaChat
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_contacts (GoaObject $object)
#   returns GoaContacts
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_documents (GoaObject $object)
#   returns GoaDocuments
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_exchange (GoaObject $object)
#   returns GoaExchange
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_files (GoaObject $object)
#   returns GoaFiles
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_mail (GoaObject $object)
#   returns GoaMail
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_manager (GoaObject $object)
#   returns GoaManager
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_maps (GoaObject $object)
#   returns GoaMaps
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_media_server (GoaObject $object)
#   returns GoaMediaServer
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_music (GoaObject $object)
#   returns GoaMusic
#   is native(goa)
#   is export
# { * }
#
sub goa_object_peek_oauth2_based (GoaObject $object)
  returns GoaOAuth2Based
  is native(goa)
  is export
{ * }
#
# sub goa_object_peek_oauth_based (GoaObject $object)
#   returns GoaOAuthBased
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_password_based (GoaObject $object)
#   returns GoaPasswordBased
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_photos (GoaObject $object)
#   returns GoaPhotos
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_printers (GoaObject $object)
#   returns GoaPrinters
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_read_later (GoaObject $object)
#   returns GoaReadLater
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_ticketing (GoaObject $object)
#   returns GoaTicketing
#   is native(goa)
#   is export
# { * }
#
# sub goa_object_peek_todo (GoaObject $object)
#   returns GoaTodo
#   is native(goa)
#   is export
# { * }
