import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/entities/pdf_file_entity.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/core/use_cases/use_case.dart';
import 'package:scanify_pdf/features/home/domain/repos/home_repo.dart';

class DeleteSavedFileUseCase extends UseCase<void, PdfFileEntity> {
  final HomeRepo homeRepo;

  DeleteSavedFileUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, void>> call(PdfFileEntity file) async {
    return await homeRepo.deleteFile(file);
  }
}
