import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/core/use_cases/no_param_use_case.dart';
import 'package:scanify_pdf/features/scanner/domain/entities/scanned_image_entity.dart';
import 'package:scanify_pdf/features/scanner/domain/repos/scanner_repo.dart';

class PickImagesFromGalleryUseCase extends UseCase {
  final ScannerRepo scannerRepo;

  PickImagesFromGalleryUseCase({required this.scannerRepo});

  @override
  Future<Either<Failure, List<ScannedImageEntity>>> call() async {
    return await scannerRepo.pickImagesFromGallery();
  }
}
