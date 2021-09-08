use v6.c;

use GLib::Raw::Definitions;

unit package GOA::Raw::Definitions;

constant goa        is export = 'goa-1.0',v0;
constant goabackend is export = 'goa-backend-1.0',v1;

class GoaAccount            is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaAccountProxy       is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaCalendar           is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaClient             is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaManager            is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaMail               is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaOAuth2Based        is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaOAuth2BasedProxy   is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaObject             is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaProvider           is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaPasswordBased      is repr<CPointer> is export does GLib::Roles::Pointers { }
class GoaPasswordBasedProxy is repr<CPointer> is export does GLib::Roles::Pointers { }
