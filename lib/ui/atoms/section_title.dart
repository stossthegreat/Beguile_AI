import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

class SectionTitle extends StatelessWidget {
  final String emoji;
  final String title;
  final EdgeInsetsGeometry? padding;

  const SectionTitle({
    super.key,
    required this.emoji,
    required this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(left: WFDims.spacingL),
      child: Row(
        children: [
          Text(emoji,
              style: const TextStyle(
                fontSize: 20, // Bigger emoji
                fontWeight: FontWeight.w600, // Thicker text
              )),
          const SizedBox(width: WFDims.spacingL),
          Text(title,
              style: WFTextStyles.sectionTitle.copyWith(
                fontSize: 18, // Bigger title
                fontWeight: FontWeight.w800, // Thicker text
                color: Colors.white, // White text for visibility
              )),
        ],
      ),
    );
  }
}
