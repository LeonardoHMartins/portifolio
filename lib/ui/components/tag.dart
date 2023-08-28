import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, this.icon, required this.text, this.color});

  final IconData? icon;
  final String text;
  final Color? color;

  List<Widget> get ic {
    if (icon == null) return [];
    return [Icon(icon, color: AppColors.white.withOpacity(0.4), size: 20), const Gap(10)];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.brown_400,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...ic,
          Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
