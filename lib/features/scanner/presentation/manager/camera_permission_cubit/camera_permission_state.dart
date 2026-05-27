part of 'camera_permission_cubit.dart';

@immutable
sealed class CameraPermissionState {}

final class CameraPermissionInitial extends CameraPermissionState {}

final class CameraPermissionGranted extends CameraPermissionState {}

final class CameraPermissionDenied extends CameraPermissionState {}
