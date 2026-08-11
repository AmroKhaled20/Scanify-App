import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      // 1. جلب الكاميرات المتاحة في الجهاز
      cameras = await availableCameras();

      if (cameras != null && cameras!.isNotEmpty) {
        // 2. اختيار الكاميرا الخلفية (رقم 0) بجودة عالية
        _controller = CameraController(
          cameras![0],
          ResolutionPreset.high,
          enableAudio: false, // مش محتاجين صوت لأننا بنسكان ورق
        );

        // 3. تهيئة الكاميرا
        await _controller!.initialize();

        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    // إغلاق الكاميرا لتوفير البطارية لما نخرج من الشاشة
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // لو الكاميرا لسه بتحمل، نعرض شاشة تحميل
    if (!_isInitialized || _controller == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. الكاميرا في الخلفية مالية الشاشة
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: CameraPreview(_controller!),
          ),

          // 2. شريط علوي فيه زرار الرجوع وزرار للفلاش (مبدئي)
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.flash_off,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () {
                        // منطق الفلاش هيتعمل هنا بعدين
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 3. الجزء السفلي (أوضاع التصوير وزرار الالتقاط)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 40, top: 20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6), // خلفية شبه شفافة
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // نصوص أوضاع التصوير
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Docs',
                        style: TextStyle(
                          color: Colors.amber, // اللون النشط
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        'ID card',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // زرار التقاط الصورة الدائري
                  GestureDetector(
                    onTap: () {
                      // لوجيك التصوير الحقيقي والـ Cubit الجديد هيتركب هنا
                      debugPrint('Capture Pressed!');
                    },
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
