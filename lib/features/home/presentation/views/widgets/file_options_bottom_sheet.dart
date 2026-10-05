import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scanify_pdf/core/entities/pdf_file_entity.dart';
import 'package:scanify_pdf/features/home/presentation/views/widgets/delete_confirmation_dialog.dart';

void showFileOptionsBottomSheet(BuildContext context, PdfFileEntity file) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF1C1E2D),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (BuildContext bottomSheetContext) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: file.thumbnailPath != null
                      ? Image.file(
                          File(file.thumbnailPath!),
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey,
                          child: const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.white,
                          ),
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF32364B),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '${file.numOfPages}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            file.size,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFF2A2D3E), thickness: 1),

            ListTile(
              leading: const Icon(Icons.picture_as_pdf, color: Colors.white),
              title: const Text(
                'Edit PDF',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.grey),
              title: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // بنستدعي الديالوج بتاع الحذف ونقفل الـ Bottom Sheet لو حابب
                showDeleteConfirmationDialog(context, file);
              },
            ),
          ],
        ),
      );
    },
  );
}
