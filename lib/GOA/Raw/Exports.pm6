use v6.c;

unit package GOA::Raw::Exports;

our @goa-exports is export;

BEGIN {
  @goa-exports = <
    GOA::Raw::Definitions
    GOA::Raw::Enums
  >;
}
