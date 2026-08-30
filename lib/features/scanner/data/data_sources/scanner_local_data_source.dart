import 'package:hive/hive.dart';
import 'package:scanify_pdf/core/models/pdf_file_model.dart';
import 'package:scanify_pdf/core/utils/constants.dart';

abstract class ScannerLocalDataSource {
  Future<void> savePdfMetadata(PdfFileModel pdfFile);
}

class ScannerLocalDataSourceImpl implements ScannerLocalDataSource {
  @override
  Future<void> savePdfMetadata(PdfFileModel pdfFile) async {
    var box = Hive.box(kPdfFilesBox);

    await box.put(pdfFile.id, pdfFile.toMap());
  }
}
