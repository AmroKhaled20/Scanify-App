import 'dart:io';
import 'package:hive/hive.dart';
import 'package:scanify_pdf/core/entities/pdf_file_entity.dart';
import 'package:scanify_pdf/core/models/pdf_file_model.dart';
import 'package:scanify_pdf/core/utils/constants.dart';

abstract class HomeLocalDataSource {
  List<PdfFileModel> fetchSavedFiles();
  Future<void> saveFile(PdfFileModel file);
  Future<void> deleteFile(PdfFileEntity file);
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

  @override
  Future<void> deleteFile(PdfFileEntity file) async {
    final pdfFile = File(file.pdfPath);
    if (await pdfFile.exists()) {
      await pdfFile.delete();
    }

    if (file.thumbnailPath != null) {
      final thumbnailFile = File(file.thumbnailPath!);
      if (await thumbnailFile.exists()) {
        await thumbnailFile.delete();
      }
    }

    var box = Hive.box(kPdfFilesBox);
    await box.delete(file.id);
  }
}
