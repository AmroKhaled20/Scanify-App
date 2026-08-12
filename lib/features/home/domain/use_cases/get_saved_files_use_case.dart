import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/core/use_cases/no_param_use_case.dart';
import 'package:scanify_pdf/features/home/domain/entities/pdf_file_entity.dart';
import 'package:scanify_pdf/features/home/domain/repos/home_repo.dart';

class GetSavedFilesUseCase extends UseCase<List<PdfFileEntity>> {
  final HomeRepo homeRepo;

  GetSavedFilesUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<PdfFileEntity>>> call() async {
    final result = await homeRepo.getSavedFiles();

    return result.fold((failure) => Left(failure), (files) {
      files.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return Right(files);
    });
  }
}
