import 'package:flutter/material.dart';

import '../../core/common/constants/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  final bool value;
  final bool readOnly;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color checkedFillColor;
  final IconData checkedIcon;
  final Color uncheckedIconColor;
  final IconData uncheckedIcon;
  final double? borderWidth;
  final double? checkBoxSize;
  final bool shouldShowBorder;
  final Color? borderColor;
  final double? borderRadius;
  final double? splashRadius;
  final Color? splashColor;
  final String? tooltip;
  final MouseCursor? mouseCursors;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor = AppColors.green_700,
    this.checkedIcon = Icons.check,
    this.uncheckedIconColor = Colors.transparent,
    this.uncheckedIcon = Icons.close,
    this.borderWidth,
    this.checkBoxSize,
    this.shouldShowBorder = false,
    this.borderColor = Colors.black12,
    this.borderRadius,
    this.splashRadius,
    this.readOnly = false,
    this.splashColor,
    this.tooltip,
    this.mouseCursors,
  }) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(CustomCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;
    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Color fillColor;
    late Color iconColor;
    late IconData iconData;

    switch (_status) {
      case CheckStatus.checked:
        fillColor = widget.checkedFillColor;
        iconColor = widget.checkedIconColor;
        iconData = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        fillColor = AppColors.white;
        iconColor = widget.uncheckedIconColor;
        iconData = widget.uncheckedIcon;
        break;
    }

    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        border: Border.all(
          color: widget.shouldShowBorder ? (widget.borderColor ?? Colors.teal.withOpacity(0.6)) : (!widget.value ? (widget.borderColor ?? Colors.teal.withOpacity(0.6)) : Colors.transparent),
          width: 2.0,
        ),
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: widget.checkBoxSize ?? 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
      icon: _buildIcon(),
      onPressed: widget.readOnly ? () {} : () => widget.onChanged(!_checked),
      splashRadius: widget.splashRadius,
      splashColor: widget.splashColor,
      tooltip: widget.tooltip,
      mouseCursor: widget.mouseCursors ?? SystemMouseCursors.click,
    );
  }
}

enum CheckStatus { checked, unchecked }
