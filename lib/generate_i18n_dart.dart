import 'extra_json_message_tool.dart';

String generateI18nDart(String getters, String supportedLocale) {
  return '''
// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'i18n_keys.dart';
import 'messages_all.dart';

class S {
 
  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }
  
  static Future<S> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return S();
    });
  }

  /// Returns the translation for the given key. An optional list with arguments
  /// can be passed in for translations that contain variable placeholders.
  /// Translating gender-specific or plural strings is currently not supported.
  String trans(String key, {List<Object>? args}) {
    return Intl.message("", name: key, args: args);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return () => print('You tried to fetch: \${invocation.positionalArguments.first}');
  }
  
  // ignore_for_file: type_annotate_public_apis
$getters
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
$supportedLocale
    ];
  }

  LocaleListResolutionCallback listResolution({Locale? fallback}) {
    return (List<Locale>? locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale? fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale? locale, Locale? fallback, Iterable<Locale> supported) {
    if (locale == null) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

// ignore_for_file: unnecessary_brace_in_string_interps
''';
}

String generateGetterSimpleMessageFunction(String jsonKey, String message) {
  return '''
  String get $jsonKey {
    return Intl.message("${normalizedJsonMessage(message)}", name: I18nKeys.$jsonKey);
  }
''';
}

String generateGetterMessageWithArgsFunction(String jsonKey, String message, String args) {
  return '''
  String $jsonKey($args) {
    return Intl.message("${normalizedJsonMessage(message)}", name: I18nKeys.$jsonKey, args: [$args]);
  }
''';
}

String generateGetterPluralFunction(String jsonKey, String args, String? zero, String? one,
    String? two, String? few, String? many, String? other) {
  var zeroArg = generateArg(normalizedJsonMessage(zero));
  var oneArg = generateArg(normalizedJsonMessage(one));
  var twoArg = generateArg(normalizedJsonMessage(two));
  var fewArg = generateArg(normalizedJsonMessage(few));
  var manyArg = generateArg(normalizedJsonMessage(many));
  var otherArg = generateArg(normalizedJsonMessage(other));

  return '''
  String $jsonKey($args) {
    return Intl.plural(howMany,
        zero: $zeroArg,
        one: $oneArg,
        two: $twoArg,
        few: $fewArg,
        many: $manyArg,
        other: $otherArg,
        name: I18nKeys.$jsonKey,
        args: [$args]);
  }
''';
}

String generateGetterGenderFunction(
    String jsonKey, String args, String? male, String? female, String? other) {
  var maleArg = generateArg(normalizedJsonMessage(male));
  var femaleArg = generateArg(normalizedJsonMessage(female));
  var otherArg = generateArg(normalizedJsonMessage(other));

  return '''
  String $jsonKey($args) {
    return Intl.gender(targetGender,
        male: $maleArg,
        female: $femaleArg,
        other: $otherArg,
        name: I18nKeys.$jsonKey,
        args: [$args]);
  }
''';
}

String generateSupportedLocale(String locale) {
  String langCode = '';
  String countryCode = '';

  if (locale.contains('_')) {
    List<String> splits = locale.split('_');
    langCode = splits[0];
    countryCode = splits[1];
  } else {
    langCode = locale;
  }

  return '''\t\t\tLocale("$langCode", "$countryCode"),''';
}
