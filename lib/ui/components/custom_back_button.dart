import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.onPress, this.title});

  final void Function()? onPress;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ??
          () {
            Vibrate.feedback(FeedbackType.light);
            Navigator.pop(context);
          },
      child: Container(
        color: AppColors.white.withOpacity(0.2),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Gap(20),
            const Icon(Icons.arrow_back, color: AppColors.white, size: 13),
            const Gap(14),
            Text(
              title ?? 'VOLTAR',
              style: const TextStyle(color: AppColors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
