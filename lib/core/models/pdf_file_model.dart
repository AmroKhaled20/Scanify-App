import 'package:scanify_pdf/core/entities/pdf_file_entity.dart';

class PdfFileModel extends PdfFileEntity {
  PdfFileModel({
    required super.id,
    required super.name,
    required super.numOfPages,
    required super.thumbnailPath,
    required super.size,
    required super.createdAt,
  });

  factory PdfFileModel.fromMap(Map<String, dynamic> map) {
    return PdfFileModel(
      id: map['id'],
      name: map['name'],
      numOfPages: map['numOfPages'],
      thumbnailPath: map['thumbnailPath'],
      size: map['size'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'numOfPages': numOfPages,
      'thumbnailPath': thumbnailPath,
      'size': size,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
