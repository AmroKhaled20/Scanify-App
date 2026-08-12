import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/features/home/domain/entities/pdf_file_entity.dart';
// متنساش تعمل import لملف الـ Failure وملف الـ PdfFileEntity

abstract class HomeRepo {
  Future<Either<Failure, List<PdfFileEntity>>> getSavedFiles();
}
