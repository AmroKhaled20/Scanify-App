import 'package:get_it/get_it.dart';
import 'package:scanify_pdf/core/services/permission_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<PermissionService>(PermissionService());
}
