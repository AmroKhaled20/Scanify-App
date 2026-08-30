import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:scanify_pdf/core/utils/styles.dart';

class PdfViewerView extends StatefulWidget {
  final String filePath;
  final String fileName;

  const PdfViewerView({
    super.key,
    required this.filePath,
    required this.fileName,
  });

  @override
  State<PdfViewerView> createState() => _PdfViewerViewState();
}

class _PdfViewerViewState extends State<PdfViewerView> {
  int currentPage = 0;
  int totalPages = 0;
  bool isReady = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12131C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF202334),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.fileName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.titleMeduim.copyWith(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.white.withOpacity(0.08)),
        ),
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: widget.filePath,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: false,
            pageSnap: false,
            showScrollIndicators: true,
            fitPolicy: FitPolicy.WIDTH,
            backgroundColor: const Color(0xFF12131C),
            defaultPage: 0,
            onRender: (pages) {
              if (!mounted) return;

              setState(() {
                totalPages = pages ?? 0;
                isReady = true;
              });
            },
            onPageChanged: (page, total) {
              if (!mounted) return;

              setState(() {
                currentPage = page ?? 0;
                totalPages = total ?? totalPages;
              });
            },
            onError: (error) {
              if (!mounted) return;

              setState(() {
                errorMessage = error.toString();
              });
            },
            onPageError: (page, error) {
              debugPrint('Error loading page $page: ${error.toString()}');
            },
          ),
          if (!isReady && errorMessage == null)
            const Center(child: CircularProgressIndicator(color: Colors.white)),
          if (errorMessage != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Failed to open the PDF.\n$errorMessage',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          if (isReady && totalPages > 0)
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.65),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Page ${currentPage + 1} of $totalPages',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
