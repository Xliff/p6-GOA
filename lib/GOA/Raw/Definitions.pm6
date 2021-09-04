use v6.c;

use GLib::Raw::Definitions;

constant goa = 'goa-1.0',v0;

class GoaAccount            is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaAccountProxy       is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaCalendar           is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaClient             is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaManager            is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaOAuth2Based        is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaOAuth2BasedProxy   is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaObject             is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaPasswordBased      is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaPasswordBasedProxy is repr<CPointer> is export does GLib::Roles::Pointers { }
