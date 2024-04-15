import 'dart:math';

import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> launchURL(String url) async {
  try {
    await launch(url);
  } catch (e) {
    BotToast.showText(text: "$e");
  }
}

DateTime parseDate(dynamic ts, [DateTime? d]) {
  final def = d ?? DateTime.now();
  if (ts == null) return def;
  switch (ts.runtimeType) {
    case Timestamp:
      return (ts as Timestamp).toDate();
    case DateTime:
      return ts as DateTime;
    case String:
      return DateTime.parse(ts as String).toLocal();
    case int:
      return DateTime.fromMillisecondsSinceEpoch(ts as int).toLocal();
    default:
      return def;
  }
}

double parseDouble(dynamic v, [double d = 0]) {
  if (v == null) {
    return d;
  } else if (v is double) {
    return v;
  } else if (v is int) {
    return v.toDouble();
  } else {
    return double.tryParse('${v ?? '0'}') ?? d;
  }
}

int parseInt(dynamic v, [int d = 0]) {
  if (v == null) {
    return d;
  } else if (v is int) {
    return v;
  } else if (v is double) {
    return v.toInt();
  } else {
    return int.tryParse('${v ?? '0'}') ?? d;
  }
}

bool parseBool(dynamic v, [bool d = false]) => v is bool ? v : d;

String parseString(dynamic v, [String d = '']) => v is String ? v : '${v ?? d}';

String getRandomString(int length) {
  Random rnd = Random();
  String chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}