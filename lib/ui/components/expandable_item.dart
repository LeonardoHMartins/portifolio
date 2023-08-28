import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';
import 'package:portfolio/core/common/extensions/widget_extension.dart';
import 'package:portfolio/ui/components/shimed_box.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class ExpandableItem extends StatefulWidget {
  const ExpandableItem({
    super.key,
    this.child,
    required this.title,
    this.action,
    this.tag,
    this.longPress,
    this.initOpen = false,
  });

  final Widget? child;
  final String title;
  final String? tag;
  final void Function()? action;
  final void Function()? longPress;
  final bool initOpen;

  static Widget shimmer() {
    return const ShimmedBox(
      height: 50,
      width: double.infinity,
    );
  }

  @override
  State<ExpandableItem> createState() => _ExpandableItemState();
}

class _ExpandableItemState extends State<ExpandableItem> {
  bool expanded = false;

  @override
  void initState() {
    if (widget.initOpen) {
      expanded = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Vibrate.feedback(FeedbackType.light);
          setState(() => expanded = !expanded);
        },
        onLongPress: widget.longPress,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedSize(
          duration: 200.ms,
          curve: Curves.fastOutSlowIn,
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: expanded ? AppColors.green_200 : AppColors.green_700,
                      ),
                    ).expanded(),
                    if (widget.tag != null)
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        child: Text(widget.tag!),
                      ),
                    Icon(
                      expanded ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 22,
                      color: expanded ? AppColors.green_200 : AppColors.green_700,
                    ),
                  ],
                ),
                if (expanded)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: widget.child,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
