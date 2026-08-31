import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:scanify_pdf/core/models/pdf_file_model.dart';

class PdfGeneratorUtil {
  static Future<PdfFileModel> generate({
    required List<String> imagePaths,
    required String pdfName,
  }) async {
    final pdf = pw.Document();

    for (final path in imagePaths) {
      final imageBytes = await File(path).readAsBytes();
      final pdfImage = pw.MemoryImage(imageBytes);

      final imageWidth = pdfImage.width?.toDouble() ?? 595.0;
      final imageHeight = pdfImage.height?.toDouble() ?? 842.0;

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(imageWidth, imageHeight),
          margin: pw.EdgeInsets.zero,
          build: (context) {
            return pw.SizedBox.expand(
              child: pw.Image(pdfImage, fit: pw.BoxFit.fill),
            );
          },
        ),
      );
    }

    final outputDir = await getApplicationDocumentsDirectory();
    final appPdfDir = Directory('${outputDir.path}/ScanifyPDFs');

    if (!await appPdfDir.exists()) {
      await appPdfDir.create(recursive: true);
    }

    final filePath = '${appPdfDir.path}/$pdfName.pdf';
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    final thumbnailFile = File(imagePaths.first);
    final savedThumbnailPath = '${appPdfDir.path}/$pdfName-thumb.jpg';
    await thumbnailFile.copy(savedThumbnailPath);

    final fileSizeInBytes = await file.length();

    return PdfFileModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: pdfName,
      numOfPages: imagePaths.length,
      thumbnailPath: savedThumbnailPath,
      size: '${(fileSizeInBytes / 1024).toStringAsFixed(2)} KB',
      createdAt: DateTime.now(),
      pdfPath: filePath,
    );
  }
}
