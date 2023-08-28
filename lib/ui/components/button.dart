import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';
import 'package:portfolio/core/common/errors/failures.dart';
import 'package:portfolio/core/common/extensions/color_extension.dart';
import 'package:portfolio/ui/components/loader.dart';
import 'package:portfolio/ui/dialogs/toasting.dart';

// Custom buttons are created by extending the MaterialButton class
class Button extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  final bool autofocus;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final bool secondary;
  final bool disabled;
  final Size? size;
  final Color? color;

  // The constructor made all Primary Custom Button
  Button.primary({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.size,
    this.color,
    this.disabled = false,
  })  : secondary = false,
        style = ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: (disabled ? AppColors.brown_100 : color ?? AppColors.brown_400).toMaterialStateProperty(),
          foregroundColor: Colors.white.toMaterialStateProperty(),
          textStyle: MaterialStateProperty.all<TextStyle?>(
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          ),
        );

  // The constructor made all Secondary Custom Button
  Button.secondary({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.size,
    this.color,
    this.disabled = false,
  })  : secondary = false,
        style = ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(
                color: disabled ? AppColors.grey_100 : AppColors.brown_400.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),
          overlayColor: AppColors.brown_400.withOpacity(0.3).toMaterialStateProperty(),
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: Colors.white.toMaterialStateProperty(),
          foregroundColor: (disabled ? AppColors.grey_100 : AppColors.brown_800).toMaterialStateProperty(),
          textStyle: MaterialStateProperty.all<TextStyle?>(
            const TextStyle(
              color: AppColors.brown_800,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          ),
        );

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  late Future<void> Function() action;

  @override
  void initState() {
    action = () async {
      if (!mounted) return;
      try {
        if (widget.onPressed == null) return;

        isLoading = true;
        if (!mounted) return;
        setState(() {});

        Vibrate.feedback(FeedbackType.light);
        await widget.onPressed!();

        isLoading = false;
        if (!mounted) return;
        setState(() {});
      } catch (err) {
        if (!mounted) return;
        if (err is TypeError) {
          Toasting.error(context, title: 'Erro: $err', stackTrace: err.stackTrace);
          return;
        }
        if (err is Failure) {
          Toasting.error(context, title: 'Erro: $err', stackTrace: err.stackTrace);
          return;
        }
        if (err is Exception) {
          Toasting.error(context, title: 'Erro: $err');
          return;
        }
        Toasting.error(context, title: 'Erro: $err');
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var newChild = widget.child;
    if (widget.child is Text) {
      Text text = widget.child as Text;
      newChild = Text(text.data!.toUpperCase(), style: text.style);
    }

    return FilledButton(
      onPressed: !widget.disabled ? action : null,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      onLongPress: () {
        if (widget.onLongPress != null) {
          Vibrate.feedback(FeedbackType.light);
          widget.onLongPress!();
        }
      },
      style: widget.style?.copyWith(
        fixedSize: widget.size != null ? MaterialStateProperty.all<Size>(widget.size!) : null,
      ),
      child: isLoading ? const Loader(size: 16, inverted: true) : newChild,
    );
  }
}
