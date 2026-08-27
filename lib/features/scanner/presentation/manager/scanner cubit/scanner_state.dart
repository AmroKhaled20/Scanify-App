part of 'scanner_cubit.dart';

@immutable
sealed class ScannerState {}

final class ScannerInitial extends ScannerState {}

// الحالة دي هنعملها emit كل ما نضيف صورة أو نمسح صورة من القائمة
final class ScannerImagesUpdated extends ScannerState {
  final List<ScannedImageEntity> images;
  ScannerImagesUpdated({required this.images});
}

// لما اليوزر يدوس "Convert to PDF"
final class ScannerPdfGenerationLoading extends ScannerState {}

// لما الملف يتحفظ بنجاح
final class ScannerPdfGenerationSuccess extends ScannerState {}

// لو حصلت أي مشكلة
final class ScannerPdfGenerationError extends ScannerState {
  final String errorMessage;
  ScannerPdfGenerationError({required this.errorMessage});
}
