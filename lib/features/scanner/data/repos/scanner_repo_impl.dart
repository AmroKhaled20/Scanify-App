import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/core/models/pdf_file_model.dart';
import 'package:scanify_pdf/features/scanner/data/data_sources/scanner_local_data_source.dart';
import 'package:scanify_pdf/features/scanner/domain/entities/scanned_image_entity.dart';
import 'package:scanify_pdf/features/scanner/domain/repos/scanner_repo.dart';

class ScannerRepoImpl implements ScannerRepo {
  final ScannerLocalDataSource localDataSource;

  ScannerRepoImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> generateAndSavePdf({
    required List<ScannedImageEntity> images,
    required String pdfName,
  }) async {
    try {
      final pdf = pw.Document();
      // 2. المرور على الصور وإضافتها كصفحات
      for (var image in images) {
        final imageBytes = await File(image.imagePath).readAsBytes();
        final pdfImage = pw.MemoryImage(imageBytes);

        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Center(child: pw.Image(pdfImage));
            },
          ),
        );
      }

      final outputDir = await getApplicationDocumentsDirectory();
      final appPdfDir = Directory('${outputDir.path}/ScanifyPDFs');
      if (!await appPdfDir.exists()) {
        await appPdfDir.create(recursive: true);
      }

      final filePath = '${appPdfDir.path}/$pdfName.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      final thumbnailFile = File(images.first.imagePath);
      final savedThumbnailPath = '${appPdfDir.path}/$pdfName-thumb.jpg';
      await thumbnailFile.copy(savedThumbnailPath);

      final fileSizeInBytes = await file.length();
      final pdfModel = PdfFileModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: pdfName,
        numOfPages: images.length,
        thumbnailPath: savedThumbnailPath,
        size: (fileSizeInBytes / 1024).toStringAsFixed(2) + ' KB',
        createdAt: DateTime.now(),
      );
      await localDataSource.savePdfMetadata(pdfModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCachedImages({
    required List<ScannedImageEntity> images,
  }) async {
    try {
      for (var image in images) {
        final file = File(image.imagePath);
        if (await file.exists()) {
          await file.delete();
        }
      }
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
