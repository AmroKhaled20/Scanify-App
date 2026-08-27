import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/widgets/camera_preview_widget.dart';
import 'package:scanify_pdf/features/scanner/presentation/views/widgets/scanner_controls_widget.dart';

class ScannerViewBody extends StatefulWidget {
  const ScannerViewBody({super.key});

  @override
  State<ScannerViewBody> createState() => _ScannerViewBodyState();
}

class _ScannerViewBodyState extends State<ScannerViewBody> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();

      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras![0],
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _cameraController!.initialize();

        if (mounted) {
          setState(() {});
        }
      } else {
        if (mounted) {
          setState(() {
            _errorMessage = "No camera found on this device.";
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = "An error occurred while starting the camera: $e";
        });
      }

      debugPrint("Camera Init Error: $e");
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            CameraPreviewWidget(cameraController: _cameraController!),
            ScannerControlsWidget(cameraController: _cameraController!),
          ],
        ),
      ),
    );
  }
}
