class PdfFileEntity {
  final String id;
  final String name;
  final int numOfPages;
  final String thumbnailPath;
  final String size;
  final DateTime createdAt;
  final String pdfPath;

  PdfFileEntity({
    required this.id,
    required this.name,
    required this.numOfPages,
    required this.thumbnailPath,
    required this.size,
    required this.createdAt,
    required this.pdfPath,
  });
}
