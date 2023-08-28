import 'package:flutter/material.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';
import 'package:portfolio/core/common/extensions/widget_extension.dart';
import 'package:gap/gap.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({super.key, this.selected, this.onTap, this.label, this.optional = false});
  final String? label;
  final Widget? selected;
  final bool optional;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var newChild = selected ??
        const Text(
          'Selecione',
        );
    if (newChild is Text) {
      newChild = Text(newChild.data!, style: const TextStyle(fontSize: 18)).expanded();
    }

    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            const Gap(10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(
                      color: AppColors.green_700,
                    ),
                  ),
                  if (optional)
                    TextSpan(
                      text: ' (opcional)',
                      style: TextStyle(
                        color: AppColors.green_700.withOpacity(0.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.green_700.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
              width: double.infinity,
              child: Row(
                children: [newChild, const Icon(Icons.arrow_drop_down)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
