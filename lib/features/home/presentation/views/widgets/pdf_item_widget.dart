import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/utils/app_spacing.dart';
// import 'package:scanify_pdf/core/utils/app_spacing.dart';
import 'package:scanify_pdf/core/utils/size_extensions.dart';
import 'package:scanify_pdf/core/utils/styles.dart';

class PdfItemWidget extends StatelessWidget {
  const PdfItemWidget({super.key});

  // @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: AppSpacing.s8,
      ), // مسافة بين كل كارت والتاني
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==========================================
          // 1. صورة الملف (Responsive Width)
          // ==========================================
          SizedBox(
            width: context.w * 0.23, // بياخد 22% من عرض الشاشة أياً كان حجمها
            height: context.w * 0.23,
            child: Stack(
              children: [
                // الخلفية البيضاء للورقة
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // مؤقتاً فاضية لحد ما نجيب الصورة الحقيقية للـ Scan
                ),
                // علامة الـ PDF (Badge)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFF9E9E9E), // لون رصاصي زي الصورة
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'PDF',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.s16),

          // ==========================================
          // 2. تفاصيل الملف (Expanded لمنع أي Overflow)
          // ==========================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم الملف
                Text(
                  'مرفقات', // داتا وهمية مؤقتاً
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                  maxLines: 1, // مهم جداً عشان لو الاسم طويل
                  overflow:
                      TextOverflow.ellipsis, // بيحط ... في آخر الكلام الطويل
                ),
                const SizedBox(height: AppSpacing.s8),

                // صف البيانات (عدد الصفحات، التاريخ، المساحة)
                Row(
                  children: [
                    // مربع عدد الصفحات
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A4E69), // اللون الكحلي الفاتح
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s8),

                    // التاريخ
                    Text(
                      '06/25 03:35',
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
                    const SizedBox(width: AppSpacing.s16),

                    // المساحة (استخدمنا Expanded هنا كزيادة أمان للشاشات الصغيرة جداً)
                    Expanded(
                      child: Text(
                        '381 kB',
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                // زراير المشاركة والإعدادات (متحاذية لليمين)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.grey,
                        size: 22,
                      ),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(width: AppSpacing.s24),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                        size: 22,
                      ),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
