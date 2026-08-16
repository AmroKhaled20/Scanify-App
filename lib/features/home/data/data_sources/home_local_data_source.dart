import 'package:hive/hive.dart';
import 'package:scanify_pdf/core/models/pdf_file_model.dart';
import 'package:scanify_pdf/core/utils/constants.dart';

abstract class HomeLocalDataSource {
  List<PdfFileModel> fetchSavedFiles();
  Future<void> saveFile(PdfFileModel file);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<PdfFileModel> fetchSavedFiles() {
    var box = Hive.box(kPdfFilesBox);

    List<PdfFileModel> files = [];
    for (var item in box.values) {
      final map = Map<String, dynamic>.from(item as Map);
      files.add(PdfFileModel.fromMap(map));
    }

    return files;
  }

  @override
  Future<void> saveFile(PdfFileModel file) async {
    var box = Hive.box(kPdfFilesBox);
    await box.put(file.id, file.toMap());
  }
}
