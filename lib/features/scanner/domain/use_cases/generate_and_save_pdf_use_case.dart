import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/core/use_cases/use_case.dart';
import 'package:scanify_pdf/features/scanner/domain/entities/scanned_image_entity.dart';
import 'package:scanify_pdf/features/scanner/domain/repos/scanner_repo.dart';

class GenerateAndSavePdfUseCase extends UseCase<void, GeneratePdfParams> {
  final ScannerRepo scannerRepo;

  GenerateAndSavePdfUseCase({required this.scannerRepo});

  @override
  Future<Either<Failure, void>> call(GeneratePdfParams param) async {
    if (param.images.isEmpty) {
      return Left(ServerFailure('No images found to convert to PDF'));
    }

    if (param.pdfName.trim().isEmpty) {
      return Left(ServerFailure('PDF file name is required'));
    }

    return await scannerRepo.generateAndSavePdf(
      images: param.images,
      pdfName: param.pdfName,
    );
  }
}

class GeneratePdfParams {
  final List<ScannedImageEntity> images;
  final String pdfName;

  GeneratePdfParams({required this.images, required this.pdfName});
}
