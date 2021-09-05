use v6.c;

use GOA::Raw::Types;
use GOA::Raw::Mail;

use GLib::Class::Object;

use GLib::Roles::Object;

role GOA::Roles::Mail {
  also does GLib::Roles::Object;

  has GoaMail $!gm;

  method roleInit-GoaMail {
    return if $!gm;

    my \i = findProperImplementor(self.^attributes);
    $!gm = cast( GoaMail, i.get_value(self) );
  }

  method dup_email_address {
    goa_mail_dup_email_address($!gm);
  }

  method dup_imap_host {
    goa_mail_dup_imap_host($!gm);
  }

  method dup_imap_user_name {
    goa_mail_dup_imap_user_name($!gm);
  }

  method dup_name {
    goa_mail_dup_name($!gm);
  }

  method dup_smtp_host {
    goa_mail_dup_smtp_host($!gm);
  }

  method dup_smtp_user_name {
    goa_mail_dup_smtp_user_name($!gm);
  }

  method get_email_address {
    goa_mail_get_email_address($!gm);
  }

  method get_imap_accept_ssl_errors {
    so goa_mail_get_imap_accept_ssl_errors($!gm);
  }

  method get_imap_host {
    goa_mail_get_imap_host($!gm);
  }

  method get_imap_supported {
    so goa_mail_get_imap_supported($!gm);
  }

  method get_imap_use_ssl {
    so goa_mail_get_imap_use_ssl($!gm);
  }

  method get_imap_use_tls {
    so goa_mail_get_imap_use_tls($!gm);
  }

  method get_imap_user_name {
    goa_mail_get_imap_user_name($!gm);
  }

  method get_name {
    goa_mail_get_name($!gm);
  }

  method get_smtp_accept_ssl_errors {
    so goa_mail_get_smtp_accept_ssl_errors($!gm);
  }

  method get_smtp_auth_login {
    so goa_mail_get_smtp_auth_login($!gm);
  }

  method get_smtp_auth_plain {
    so goa_mail_get_smtp_auth_plain($!gm);
  }

  method get_smtp_auth_xoauth2 {
    so goa_mail_get_smtp_auth_xoauth2($!gm);
  }

  method get_smtp_host {
    goa_mail_get_smtp_host($!gm);
  }

  method get_smtp_supported {
    so goa_mail_get_smtp_supported($!gm);
  }

  method get_smtp_use_auth {
    so goa_mail_get_smtp_use_auth($!gm);
  }

  method get_smtp_use_ssl {
    so goa_mail_get_smtp_use_ssl($!gm);
  }

  method get_smtp_use_tls {
    so goa_mail_get_smtp_use_tls($!gm);
  }

  method get_smtp_user_name {
    goa_mail_get_smtp_user_name($!gm);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &goa_mail_get_type, $n, $t );
  }

  method interface_info {
    goa_mail_interface_info();
  }

  method override_properties (
    GObjectClass() $klass,
    Int()          $property_id_begin
  ) {
    my guint $p = $property_id_begin;

    goa_mail_override_properties($klass, $p);
  }

  method set_email_address (Str() $value) {
    goa_mail_set_email_address($!gm, $value);
  }

  method set_imap_accept_ssl_errors (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_imap_accept_ssl_errors($!gm, $v);
  }

  method set_imap_host (Str() $value) {
    goa_mail_set_imap_host($!gm, $value);
  }

  method set_imap_supported (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_imap_supported($!gm, $v);
  }

  method set_imap_use_ssl (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_imap_use_ssl($!gm, $v);
  }

  method set_imap_use_tls (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_imap_use_tls($!gm, $v);
  }

  method set_imap_user_name (Str() $value) {
    goa_mail_set_imap_user_name($!gm, $value);
  }

  method set_name (Str() $value) {
    goa_mail_set_name($!gm, $value);
  }

  method set_smtp_accept_ssl_errors (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_accept_ssl_errors($!gm, $v);
  }

  method set_smtp_auth_login (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_auth_login($!gm, $v);
  }

  method set_smtp_auth_plain (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_auth_plain($!gm, $v);
  }

  method set_smtp_auth_xoauth2 (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_auth_xoauth2($!gm, $v);
  }

  method set_smtp_host (Str() $value) {
    goa_mail_set_smtp_host($!gm, $value);
  }

  method set_smtp_supported (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_supported($!gm, $v);
  }

  method set_smtp_use_auth (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_use_auth($!gm, $v);
  }

  method set_smtp_use_ssl (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_use_ssl($!gm, $v);
  }

  method set_smtp_use_tls (Int() $value) {
    my gboolean $v = $value.so.Int;

    goa_mail_set_smtp_use_tls($!gm, $v);
  }

  method set_smtp_user_name (Str() $value) {
    goa_mail_set_smtp_user_name($!gm, $value);
  }

}

our subset GoaMailAncestry is export of Mu
  where GoaMail | GObject;

class GOA::Mail does GOA::Roles::Mail {

  submethod BUILD (:$mail) {
    self.setMail($mail) if $mail;
  }

  method setMail (GoaMailAncestry $_) {
    my $to-parent;

    $!gm = do {
      when GoaMail {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GoaMail, $_);
      }
    }
    self!setObject($to-parent);
    self.roleInit-GoaMail;
  }

  method new (GoaMailAncestry $mail, :$ref = True) {
    return Nil unless $mail;

    my $o = self.bless( :$mail );
    $o.ref if $ref;
    $o;
  }

  method get_type {
    GOA::Mail.GoaMail_get_type;
  }

}
