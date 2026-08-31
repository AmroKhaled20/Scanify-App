import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/features/scanner/data/data_sources/scanner_local_data_source.dart';
import 'package:scanify_pdf/features/scanner/domain/entities/scanned_image_entity.dart';
import 'package:scanify_pdf/features/scanner/domain/repos/scanner_repo.dart';
import 'package:scanify_pdf/core/utils/pdf_generator_util.dart';

class ScannerRepoImpl implements ScannerRepo {
  final ScannerLocalDataSource localDataSource;

  ScannerRepoImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> generateAndSavePdf({
    required List<ScannedImageEntity> images,
    required String pdfName,
  }) async {
    try {
      final imagePaths = images.map((e) => e.imagePath).toList();

      final pdfModel = await PdfGeneratorUtil.generate(
        imagePaths: imagePaths,
        pdfName: pdfName,
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
      for (final image in images) {
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
