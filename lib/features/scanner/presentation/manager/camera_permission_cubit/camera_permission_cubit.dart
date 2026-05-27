import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:scanify_pdf/core/services/permission_service.dart';

part 'camera_permission_state.dart';

class CameraPermissionCubit extends Cubit<CameraPermissionState> {
  final PermissionService permissionService;
  CameraPermissionCubit(this.permissionService)
    : super(CameraPermissionInitial());

  Future<void> requestPermission() async {
    emit(CameraPermissionInitial());

    final isGranted = await permissionService.requestCameraPermission();
    if (isGranted) {
      emit(CameraPermissionGranted());
    } else {
      emit(CameraPermissionDenied());
    }
  }
}
