import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart'; // مسار ملف الأخطاء
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
      // 1. (هنا هيتكتب كود تحويل الصور لـ PDF باستخدام مكتبة فلاتر)

      // 2. (هنا هيتكتب كود حفظ الملف نفسه في الـ File System بتاع الموبايل)

      // 3. بعد ما الملف الحقيقي اتعمل، نجهز الـ Model ونحفظه في Hive
      /* 
      final pdfModel = PdfFileModel(
        id: ..., 
        name: pdfName, 
        numOfPages: images.length, 
        ...
      );
      await localDataSource.savePdfMetadata(pdfModel);
      */
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
      // لوجيك المرور على مسارات الصور وحذفها من كاش الموبايل هيتكتب هنا
      // (هنا هيتكتب كود حذف الصور من كاش الموبايل)
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
