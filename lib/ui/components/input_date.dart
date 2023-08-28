import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/core/common/constants/app_colors.dart';

class InputDate extends StatelessWidget {
  final Widget? label;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? formatter;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool showError;
  final Function(String?)? onChange;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;

  const InputDate(
    this.controller, {
    super.key,
    this.label,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.formatter,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    IconButton suffixIcon() {
      return IconButton(
        icon: const Icon(
          Icons.calendar_today,
          color: AppColors.green_700,
        ),
        onPressed: () {
          FocusScope.of(context).unfocus();
          showDatePicker(
            context: context,
            locale: const Locale('pt'),
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: AppColors.brown_400,
                  buttonTheme: const ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                  ),
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.brown_400,
                    secondary: AppColors.brown_400,
                  ),
                ),
                child: child ?? const SizedBox(),
              );
            },
          ).then((value) {
            if (value != null) {
              controller.text = DateFormat('dd/MM/yyyy').format(value);
            }
          });
        },
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) label!,
        TextFormField(
          key: key,
          controller: controller,
          autovalidateMode: autovalidateMode,
          validator: validation,
          inputFormatters: formatter,
          keyboardType: TextInputType.datetime,
          readOnly: readOnly,
          focusNode: focusNode,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.5),
            fontSize: 18,
          ),
          decoration: InputDecoration(
            // label: label,
            suffixIcon: suffixIcon(),
            prefixIcon: prefixIcon,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
