import 'package:get_it/get_it.dart';
import 'package:scanify_pdf/core/services/permission_service.dart';

// Imports للـ Home Feature
import 'package:scanify_pdf/features/home/data/data_sources/home_local_data_source.dart';
import 'package:scanify_pdf/features/home/data/repos/home_repo_impl.dart';
import 'package:scanify_pdf/features/home/domain/repos/home_repo.dart';
import 'package:scanify_pdf/features/home/domain/use_cases/get_saved_files_use_case.dart';

// Imports للـ Scanner Feature
import 'package:scanify_pdf/features/scanner/data/data_sources/scanner_local_data_source.dart';
import 'package:scanify_pdf/features/scanner/data/repos/scanner_repo_impl.dart';
import 'package:scanify_pdf/features/scanner/domain/repos/scanner_repo.dart';
import 'package:scanify_pdf/features/scanner/domain/use_cases/clear_cached_images_use_case.dart';
import 'package:scanify_pdf/features/scanner/domain/use_cases/generate_and_save_pdf_use_case.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // ==========================================
  // --- Core Services ---
  // ==========================================
  getIt.registerSingleton<PermissionService>(PermissionService());

  // ==========================================
  // --- Home Feature Dependencies ---
  // ==========================================

  // 1. Data Sources
  getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImpl());

  // 2. Repositories
  getIt.registerSingleton<HomeRepo>(
    // بنستخدم getIt.get() عشان يستدعي الـ Data Source اللي لسه مسجلينه فوق
    HomeRepoImpl(homeLocalDataSource: getIt.get<HomeLocalDataSource>()),
  );

  // 3. Use Cases
  getIt.registerSingleton<GetSavedFilesUseCase>(
    // بنستخدم getIt.get() عشان يستدعي الـ Repo اللي لسه مسجلينه
    GetSavedFilesUseCase(homeRepo: getIt.get<HomeRepo>()),
  );

  // ==========================================
  // --- Scanner Feature Dependencies ---
  // ==========================================

  // 1. Data Sources
  getIt.registerSingleton<ScannerLocalDataSource>(ScannerLocalDataSourceImpl());

  // 2. Repositories
  getIt.registerSingleton<ScannerRepo>(
    ScannerRepoImpl(localDataSource: getIt.get<ScannerLocalDataSource>()),
  );

  // 3. Use Cases
  getIt.registerSingleton<GenerateAndSavePdfUseCase>(
    GenerateAndSavePdfUseCase(scannerRepo: getIt.get<ScannerRepo>()),
  );

  getIt.registerSingleton<ClearCachedImagesUseCase>(
    ClearCachedImagesUseCase(scannerRepo: getIt.get<ScannerRepo>()),
  );
}
