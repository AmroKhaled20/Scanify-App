import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanify_pdf/core/utils/app_spacing.dart';
import 'package:scanify_pdf/core/utils/size_extensions.dart';
import 'package:scanify_pdf/core/utils/styles.dart';
import 'package:scanify_pdf/features/home/presentation/manager/home cubit/home_cubit.dart';
import 'package:scanify_pdf/features/home/presentation/views/widgets/pdf_item_widget.dart';

class LowerSection extends StatelessWidget {
  const LowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.h * 0.64,
      decoration: const BoxDecoration(
        color: Color(0xFF202334),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Files',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppSpacing.s8),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is HomeSuccess) {
                    if (state.files.isEmpty) {
                      return const Center(
                        child: Text(
                          'No Files Added Yet',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: state.files.length,
                      itemBuilder: (context, index) {
                        final file = state.files[index];

                        return PdfItemWidget(pdfFile: file);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
