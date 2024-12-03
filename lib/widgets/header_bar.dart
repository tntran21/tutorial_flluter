import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final String? subtitle;
  final void Function()? onBackPress;
  final void Function()? onActionPress;

  const HeaderBar({
    super.key,
    required this.title,
    this.subtitle,
    this.onBackPress,
    this.onActionPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        // style block justify content center
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onBackPress,
            child: const Icon(Icons.supervised_user_circle_outlined),
          ),
          const SizedBox(width: 5),
          Text(title,
              style: GoogleFonts.pacifico(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
