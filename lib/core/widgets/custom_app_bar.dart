import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scanify_pdf/core/utils/styles.dart';
import 'package:scanify_pdf/core/widgets/custom_icon.dart';
import 'package:scanify_pdf/features/home/presentation/manager/home%20cubit/home_cubit.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: isSearching ? _buildSearchMode() : _buildNormalMode(),
    );
  }

  Widget _buildNormalMode() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.title, style: Styles.textStyle25),
        const Spacer(),
        CustomIcon(
          icon: Icons.search,
          onTap: () {
            setState(() => isSearching = true);
          },
        ),
        const SizedBox(width: 10),
        const CustomIcon(icon: Icons.settings),
      ],
    );
  }

  Widget _buildSearchMode() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: const InputDecoration(
              hintText: 'Search files...',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              border: InputBorder.none,
            ),
            onChanged: (value) {
              context.read<HomeCubit>().searchFiles(value);
            },
          ),
        ),
        CustomIcon(
          icon: Icons.close,
          onTap: () {
            setState(() => isSearching = false);
            context.read<HomeCubit>().searchFiles('');
          },
        ),
      ],
    );
  }
}
