import 'package:hive_flutter/hive_flutter.dart';
import 'package:scanify_pdf/core/utils/constants.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(kPdfFilesBox);
  }
}
