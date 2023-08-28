import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';
import 'package:portfolio/core/common/extensions/context_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.backAction,
  });
  final String? title;
  final void Function()? backAction;

  @override
  Size get preferredSize => const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Row(
        children: [
          GestureDetector(
            onTap: () {
              Vibrate.feedback(FeedbackType.light);
              Modular.to.maybePop();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              color: Colors.transparent,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: AppColors.green_700.withOpacity(0.5),
                  ),
                  const Gap(10),
                  Text(
                    title?.toUpperCase() ?? 'VOLTAR',
                    style: TextStyle(color: AppColors.green_700.withOpacity(0.5)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      leadingWidth: context.widthPx,
    );
  }
}
