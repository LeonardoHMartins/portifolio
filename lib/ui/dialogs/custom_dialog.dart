import 'package:flutter/material.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';
import 'package:portfolio/core/common/extensions/context_extension.dart';
import 'package:portfolio/core/common/utils/custom_dialog_utils.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    this.showBackButton = true,
    this.onBack,
    this.backText,
    required this.child,
    this.bottom,
    this.top,
    this.topSize = 30,
    this.bottomSize = 30,
    this.dimissAction,
  });

  final bool showBackButton;
  final String? backText;
  final Function()? onBack;
  final Widget child;
  final Widget? bottom;
  final double bottomSize;
  final Widget? top;
  final double topSize;
  final Function()? dimissAction;

  @override
  State<CustomDialog> createState() => _CustomDialogState();

  Future<T?> show<T>(BuildContext context) {
    return showCustomDialog<T>(context, child: this);
  }
}

class _CustomDialogState extends State<CustomDialog> {
  Widget _content(BuildContext context) => SafeArea(
        child: Container(
          height: context.heightPx,
          width: context.widthPx,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.showBackButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      color: AppColors.green_100.withOpacity(0.2),
                      child: InkWell(
                        onTap: widget.onBack ??
                            () {
                              Vibrate.feedback(FeedbackType.light);
                              Navigator.pop(context);
                            },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Gap(20),
                              const Icon(
                                Icons.arrow_back,
                                color: AppColors.white,
                              ),
                              const Gap(10),
                              Text(
                                widget.backText ?? 'VOLTAR',
                                style: const TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: AppColors.red_400.withOpacity(0.2),
                      child: InkWell(
                        onTap: () {
                          Vibrate.feedback(FeedbackType.light);
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Flexible(
                child: Container(
                  color: AppColors.background,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.top != null) ...[
                        Container(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            left: 30,
                            right: 30,
                            top: 20,
                          ),
                          child: widget.top!,
                        ),
                      ],
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            color: AppColors.background,
                            constraints: BoxConstraints(
                              maxHeight: (context.heightPx * 0.9) - (widget.bottom != null ? widget.bottomSize : 0) - (widget.top != null ? widget.topSize : 0),
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: widget.child,
                            ),
                          ),
                        ),
                      ),
                      if (widget.bottom != null)
                        Container(
                          padding: const EdgeInsets.only(
                            bottom: 20,
                            left: 30,
                            right: 30,
                            top: 10,
                          ),
                          color: AppColors.background,
                          child: widget.bottom!,
                        ),
                    ],
                  ),
                ),
              ),
              Gap(MediaQuery.viewInsetsOf(context).bottom),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }
}
