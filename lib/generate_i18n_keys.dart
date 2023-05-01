String generateI18nKeysDart(List<String> keys) {
  final String generatedConstants = keys.map(_generateConst).join('\n');

  return '''
// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

class I18nKeys {
$generatedConstants
}
''';
}

String _generateConst(String key) {
  return '''\tstatic const $key = "$key";''';
}
