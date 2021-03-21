import 'dart:convert';

// todo (20th March 2021) review whether or not these are needed anymore

/// Method for including only non-null parameter to path
String includeNonNullParam(String name, Object value) =>
    value != null ? '$name=$value' : '';

/// If value != null, returns value as a JSON-encoded value, for use in a url.
/// Otherwise returns an empty string
///
/// Some URL parameters (e.g. startkey and endkey) expect JSON-encoded
/// values rather than bare strings. Mostly this amounts to adding
/// quotation marks on either side of the string and escaping
/// special characters.
String includeNonNullJsonParam(String name, Object value) =>
    value != null ? '$name=${jsonEncode(value)}' : '';
