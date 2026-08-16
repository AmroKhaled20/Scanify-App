import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/entities/pdf_file_entity.dart';
import 'package:scanify_pdf/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PdfFileEntity>>> getSavedFiles();
}
