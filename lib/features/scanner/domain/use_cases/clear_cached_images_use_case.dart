import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/core/use_cases/use_case.dart';
import 'package:scanify_pdf/features/scanner/domain/entities/scanned_image_entity.dart';
import 'package:scanify_pdf/features/scanner/domain/repos/scanner_repo.dart';

class ClearCachedImagesUseCase extends UseCase<void, ClearCacheParams> {
  final ScannerRepo scannerRepo;

  ClearCachedImagesUseCase({required this.scannerRepo});

  @override
  Future<Either<Failure, void>> call(ClearCacheParams param) async {
    if (param.images.isEmpty) {
      return const Right(null);
    }

    return await scannerRepo.clearCachedImages(images: param.images);
  }
}

class ClearCacheParams {
  final List<ScannedImageEntity> images;

  ClearCacheParams({required this.images});
}
