import 'dart:core';
import 'package:get/get.dart';
import '../localization/language/bangla.dart';
import '../localization/language/english.dart';
import '../localization/language/spanish.dart';



class Internationalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
        'es_ES': span,
      };
}
