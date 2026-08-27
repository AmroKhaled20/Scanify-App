import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:scanify_pdf/features/scanner/domain/entities/scanned_image_entity.dart';
import 'package:scanify_pdf/features/scanner/domain/use_cases/clear_cached_images_use_case.dart';
import 'package:scanify_pdf/features/scanner/domain/use_cases/generate_and_save_pdf_use_case.dart';

part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  // بنحقن الـ Use Cases
  final GenerateAndSavePdfUseCase generateAndSavePdfUseCase;
  final ClearCachedImagesUseCase clearCachedImagesUseCase;

  // دي اللستة اللي هشيل فيها الصور واليوزر بيصور قبل ما يحولها
  List<ScannedImageEntity> capturedImages = [];

  ScannerCubit({
    required this.generateAndSavePdfUseCase,
    required this.clearCachedImagesUseCase,
  }) : super(ScannerInitial());

  // 1. دالة إضافة صورة جديدة (لما الكاميرا تلقط صورة)
  void addImage(String imagePath) {
    final newImage = ScannedImageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      imagePath: imagePath,
    );
    capturedImages.add(newImage);

    // بعمل List.from عشان فلاتر يحس إن اللستة اتغيرت ويعمل Re-build للشاشة
    emit(ScannerImagesUpdated(images: List.from(capturedImages)));
  }

  // 2. دالة مسح صورة من القائمة (لو اليوزر شاف صورة مهزوزة وعايز يمسحها)
  void removeImage(int index) {
    capturedImages.removeAt(index);
    emit(ScannerImagesUpdated(images: List.from(capturedImages)));
  }

  // 3. دالة تحويل الصور لـ PDF
  Future<void> generatePdf(String pdfName) async {
    emit(ScannerPdfGenerationLoading());

    // بنادي على الـ Use Case اللي إنا حطيت فيها الـ Business Logic
    final result = await generateAndSavePdfUseCase.call(
      GeneratePdfParams(images: capturedImages, pdfName: pdfName),
    );

    result.fold(
      (failure) =>
          emit(ScannerPdfGenerationError(errorMessage: failure.message)),
      (success) => emit(ScannerPdfGenerationSuccess()),
    );
  }

  // 4. دالة التنظيف (لو اليوزر قفل الشاشة أو بعد ما نخلص تحويل بنجاح)
  Future<void> clearSession() async {
    await clearCachedImagesUseCase.call(
      ClearCacheParams(images: capturedImages),
    );
    capturedImages.clear();
    emit(ScannerInitial());
  }
}
