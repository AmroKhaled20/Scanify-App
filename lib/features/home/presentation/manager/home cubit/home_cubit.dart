import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanify_pdf/core/entities/pdf_file_entity.dart';
import 'package:scanify_pdf/features/home/domain/use_cases/delete_saved_file_use_case.dart';
import 'package:scanify_pdf/features/home/domain/use_cases/get_saved_files_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSavedFilesUseCase getSavedFilesUseCase;
  final DeleteSavedFileUseCase deleteSavedFileUseCase;

  List<PdfFileEntity> allFiles = [];

  List<PdfFileEntity> filteredFiles = [];

  HomeCubit(this.getSavedFilesUseCase, this.deleteSavedFileUseCase)
    : super(HomeInitial());

  Future<void> fetchSavedFiles() async {
    emit(HomeLoading());

    final result = await getSavedFilesUseCase.call();

    result.fold((failure) => emit(HomeFailure(failure.message)), (files) {
      allFiles = files;
      filteredFiles = files;
      emit(HomeSuccess(filteredFiles));
    });
  }

  void searchFiles(String query) {
    if (query.isEmpty) {
      filteredFiles = List.from(allFiles);
    } else {
      filteredFiles = allFiles.where((file) {
        return file.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    emit(HomeSuccess(filteredFiles));
  }

  Future<void> deleteFile(PdfFileEntity file) async {
    final result = await deleteSavedFileUseCase.call(file);

    result.fold(
      (failure) {
        emit(HomeFailure(failure.message));
      },
      (_) {
        allFiles.removeWhere((element) => element.id == file.id);
        filteredFiles.removeWhere((element) => element.id == file.id);

        emit(HomeSuccess(List.from(filteredFiles)));
      },
    );
  }
}
