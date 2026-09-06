import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/utils/constants.dart';
import 'package:scanify_pdf/core/utils/size_extensions.dart';
import 'package:scanify_pdf/core/utils/styles.dart';

class CustomSnackbar {
  static void showSuccess(BuildContext context, String message) {
    _showOverlay(
      context: context,
      message: message,
      iconData: Icons.check,
      iconColor: primaryColor,
      durationInSeconds: 3,
    );
  }

  static void showError(BuildContext context, String message) {
    _showOverlay(
      context: context,
      message: message,
      iconData: Icons.priority_high_rounded,
      iconColor: const Color(0xFFE63946),
      durationInSeconds: 4,
    );
  }

  static void _showOverlay({
    required BuildContext context,
    required String message,
    required IconData iconData,
    required Color iconColor,
    required int durationInSeconds,
  }) {
    final overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.paddingOf(context).top,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, -40 * (1 - value)),
                child: Opacity(opacity: value, child: child),
              );
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600,
                minHeight: (context.h * 0.09).clamp(70.0, 90.0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: (context.w * 0.05).clamp(16.0, 24.0),
                vertical: 16,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF202334),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: iconColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: iconColor.withOpacity(0.25),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Icon(iconData, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle18.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry);

    Future.delayed(Duration(seconds: durationInSeconds), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
