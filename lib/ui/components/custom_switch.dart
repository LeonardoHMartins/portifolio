import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final void Function() onChanged;

  const CustomSwitch({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onChanged,
      child: SizedBox(
        width: 45,
        height: 20,
        child: Stack(
          children: [
            Container(
              width: 43,
              height: 18,
              margin: const EdgeInsets.only(top: 1),
              decoration: BoxDecoration(
                color: AppColors.green_700.withOpacity(0.3),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            AnimatedContainer(
              duration: 200.ms,
              margin: EdgeInsets.only(
                left: widget.value ? 23 : 3,
                top: widget.value ? 0 : 2,
              ),
              width: widget.value ? 20 : 16,
              height: widget.value ? 20 : 16,
              decoration: BoxDecoration(
                color: widget.value ? AppColors.green_700 : AppColors.white,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Center(
                child: widget.value ? const Icon(Icons.check, color: AppColors.white, size: 20) : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
