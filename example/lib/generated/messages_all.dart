// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';

import 'i18n_keys.dart';

final _$ja = $ja();

class $ja extends MessageLookupByLibrary {
  @override
  String get localeName => 'ja';
  
  @override
  final Map<String, dynamic> messages = {
		I18nKeys.genderMessage : (targetGender, name) => "${Intl.genderLogic(targetGender, male: "こんにちは${name}、彼は男です。", female: "こんにちは${name}、彼女は女性です。", other: "こんにちは${name}、彼/彼女は男性/女性です。")}",
		I18nKeys.locale : MessageLookupByLibrary.simpleMessage("日文"),
		I18nKeys.messageWithParams : (yourName) => "こんにちは${yourName}、ようこそ。",
		I18nKeys.pluralMessage : (howMany, interviewerName) => "${Intl.pluralLogic(howMany, zero: null, one: "こんにちは${interviewerName}、仕事の経験がありません。", two:null, few:null, many:null, other: "こんにちは${interviewerName}、私は${howMany}年の実務経験があります。")}",
		I18nKeys.simpleMessage : MessageLookupByLibrary.simpleMessage("これは簡単なメッセージです"),
		I18nKeys.specialCharactersMessage : MessageLookupByLibrary.simpleMessage("Special Characters Nice Developer's \"Message\"\n Next Line"),

  };
}

final _$zh_TW = $zh_TW();

class $zh_TW extends MessageLookupByLibrary {
  @override
  String get localeName => 'zh_TW';
  
  @override
  final Map<String, dynamic> messages = {
		I18nKeys.genderMessage : (targetGender, name) => "${Intl.genderLogic(targetGender, male: "你好 ${name}，他是男。", female: "你好 ${name}，她是女。", other: "你好 ${name}，他/她是男/女。")}",
		I18nKeys.locale : MessageLookupByLibrary.simpleMessage("中文"),
		I18nKeys.messageWithParams : (yourName) => "你好 ${yourName}，歡迎你。",
		I18nKeys.pluralMessage : (howMany, interviewerName) => "${Intl.pluralLogic(howMany, zero: null, one: "你好 ${interviewerName}，我沒有工作經驗。", two:null, few:null, many:null, other: "你好 ${interviewerName}，我有${howMany}年工作經驗。")}",
		I18nKeys.simpleMessage : MessageLookupByLibrary.simpleMessage("這是簡單消息"),
		I18nKeys.specialCharactersMessage : MessageLookupByLibrary.simpleMessage("Special Characters Nice Developer's \"Message\"\n Next Line"),

  };
}

final _$en = $en();

class $en extends MessageLookupByLibrary {
  @override
  String get localeName => 'en';
  
  @override
  final Map<String, dynamic> messages = {
		I18nKeys.genderMessage : (targetGender, name) => "${Intl.genderLogic(targetGender, male: "Hi ${name}, He is boy.", female: "Hi ${name}, She is girl.", other: "Hi ${name}, he/she is boy/girl.")}",
		I18nKeys.locale : MessageLookupByLibrary.simpleMessage("English"),
		I18nKeys.messageWithParams : (yourName) => "Hi ${yourName}, Welcome you!",
		I18nKeys.pluralMessage : (howMany, interviewerName) => "${Intl.pluralLogic(howMany, zero: null, one: "Hi ${interviewerName}, I have one year working experience.", two:null, few:null, many:null, other: "Hi ${interviewerName}, I have ${howMany} years of working experience.")}",
		I18nKeys.simpleMessage : MessageLookupByLibrary.simpleMessage("This is a simple Message"),
		I18nKeys.specialCharactersMessage : MessageLookupByLibrary.simpleMessage("Special Characters Nice Developer's \"Message\"\n Next Line"),

  };
}



typedef LibraryLoader = Future<dynamic> Function();
Map<String, LibraryLoader> _deferredLibraries = {
	"ja": () => Future.value(null),
	"zh_TW": () => Future.value(null),
	"en": () => Future.value(null),

};

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case "ja":
        return _$ja;
    case "zh_TW":
        return _$zh_TW;
    case "en":
        return _$en;

    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  final availableLocale = Intl.verifiedLocale(
      localeName,
          (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  final lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future.value(false) : lib());

  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);

  return Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  final actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}

// ignore_for_file: unnecessary_brace_in_string_interps
