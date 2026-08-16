import 'package:dartz/dartz.dart';
import 'package:scanify_pdf/core/entities/pdf_file_entity.dart';
import 'package:scanify_pdf/core/errors/failure.dart';
import 'package:scanify_pdf/features/home/domain/repos/home_repo.dart';
import 'package:scanify_pdf/features/home/data/data_sources/home_local_data_source.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<PdfFileEntity>>> getSavedFiles() async {
    try {
      final files = homeLocalDataSource.fetchSavedFiles();
      return right(files);
    } catch (e) {
      return left(LocalDatabaseFailure(e.toString()));
    }
  }
}
