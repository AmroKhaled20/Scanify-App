import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scanify_pdf/core/utils/styles.dart';
import 'package:scanify_pdf/core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: Styles.textStyle25),
          const Spacer(),
          CustomIcon(icon: FontAwesomeIcons.magnifyingGlass),
          const SizedBox(width: 10),
          CustomIcon(icon: FontAwesomeIcons.gear),
        ],
      ),
    );
  }
}
