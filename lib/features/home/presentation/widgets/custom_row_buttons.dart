import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanify_pdf/features/home/presentation/widgets/custom_button.dart';
import 'package:scanify_pdf/features/scanner/presentation/manager/camera_permission_cubit/camera_permission_cubit.dart';

class CustomRowButtons extends StatelessWidget {
  const CustomRowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            imagePath: 'assets/icons/pdf.png',
            label: 'Image to PDF',
            onTap: () {},
          ),

          BlocListener<CameraPermissionCubit, CameraPermissionState>(
            listener: (context, state) {
              if (state is CameraPermissionGranted) {
                // // لو أخد الصلاحية، يروح لشاشة الكاميرا
              } else if (state is CameraPermissionDenied) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Camera permission is required to scan documents',
                    ),
                  ),
                );
              }
            },
            child: CustomButton(
              imagePath: 'assets/icons/scan.png',
              label: 'Smart Scan',
              onTap: () {
                context.read<CameraPermissionCubit>().requestPermission();
              },
            ),
          ),
        ],
      ),
    );
  }
}
