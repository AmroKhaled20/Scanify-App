import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scanify_pdf/core/utils/app_spacing.dart';
import 'package:scanify_pdf/core/utils/styles.dart';

class CapturedImagesAppBar extends StatelessWidget {
  const CapturedImagesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s16,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: AppSpacing.s16),
          Text(
            'Review Scans',
            style: Styles.titleMeduim.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
