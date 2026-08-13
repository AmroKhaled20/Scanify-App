import 'package:hive/hive.dart';

part 'pdf_file_entity.g.dart';

@HiveType(typeId: 0)
class PdfFileEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int numOfPages;

  @HiveField(3)
  final String thumbnailPath;

  @HiveField(4)
  final String size;

  @HiveField(5)
  final DateTime createdAt;

  PdfFileEntity({
    required this.id,
    required this.name,
    required this.numOfPages,
    required this.thumbnailPath,
    required this.size,
    required this.createdAt,
  });
}
