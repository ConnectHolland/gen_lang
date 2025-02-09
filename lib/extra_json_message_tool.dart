RegExp ARG_REG_EXP = RegExp(r'\$?{(\w+)}');
RegExp ARG_REPLACE_REG_EXP = RegExp(r'(?<!\$){\w+}');
const String DEFAULT_PLURAL_ARGS = 'howMany';
const String DEFAULT_GENDER_ARG = 'targetGender';

List<String> getArgs(Iterable<Match> allMatch, String? defaultArg) {
  List<String> args = [];
  if (null != defaultArg) {
    args.add(defaultArg);
  }

  for (Match match in allMatch) {
    String arg = match.group(1).toString();
    if (!args.contains(arg)) {
      args.add(arg);
    }
  }

  return args;
}

String normalizedSpecialCharacters(String message) {
  String normalizedJson = message.replaceAll(r"\", r"\\");
  return normalizedJson.replaceAll(r'\\"', r'\\\"');
}

String? normalizedJsonMessage(String? message) {
  if (null != message) {
    return appendDollarSignToArgs(message);
  }
  return null;
}

String appendDollarSignToArgs(String message) {
  // Add a $ before all arguments that're not already preceded by a $.
  final replaced = message.replaceAllMapped(ARG_REPLACE_REG_EXP, (match) {
    return '\$${match.group(0)}';
  });
  return replaced;
}

String generateArg(dynamic arg) {
  return null != arg ? '"$arg"' : 'null';
}

String extraArgsFromGender(String? male, String? female, String? other) {
  List<String?> plurals = [male, female, other];
  Iterable<Match> theMostMatch = [];

  for (String? plural in plurals) {
    if (null != plural) {
      Iterable<Match> allMatch = ARG_REG_EXP.allMatches(plural);
      if (allMatch.length > theMostMatch.length) {
        theMostMatch = allMatch;
      }
    }
  }

  StringBuffer builder = StringBuffer();
  List<String> args = getArgs(theMostMatch, DEFAULT_GENDER_ARG);
  for (int i = 0; i < args.length; i++) {
    if (i != 0) {
      builder.write(', ');
    }
    builder.write(args[i]);
  }

  return builder.toString();
}

String extraArgsFromPlural(
    String? zero, String? one, String? two, String? few, String? many, String? other) {
  List<String?> plurals = [zero, one, two, few, many, other];
  Iterable<Match> theMostMatch = [];

  for (String? plural in plurals) {
    if (null != plural) {
      Iterable<Match> allMatch = ARG_REG_EXP.allMatches(plural);
      if (allMatch.length > theMostMatch.length) {
        theMostMatch = allMatch;
      }
    }
  }

  StringBuffer builder = StringBuffer();
  List<String> args = getArgs(theMostMatch, DEFAULT_PLURAL_ARGS);
  for (int i = 0; i < args.length; i++) {
    if (i != 0) {
      builder.write(', ');
    }
    builder.write(args[i]);
  }

  return builder.toString();
}

String extraArgsFromMessage(String? message) {
  StringBuffer builder = StringBuffer();
  List<String> args = getArgs(ARG_REG_EXP.allMatches(message ?? ''), null);

  for (int i = 0; i < args.length; i++) {
    if (i != 0) {
      builder.write(', ');
    }
    builder.write(args[i]);
  }
  return builder.toString();
}
