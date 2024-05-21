import 'package:dofy/constants/theme.dart';
import 'package:flutter/material.dart';

typedef OnSubmitted = void Function(String)?;

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final bool? isP;
  final TextInputType? kbType;
  final String hintText;
  final String? labelText;
  final void Function()? checkVisibility;
  final IconData? prefixIcon;
  final Color? iconColor;
  final Widget? suffixIcon;
  final OnSubmitted? submit;

  const CustomTextField({
    super.key,
    required this.controller,
    this.icon,
    required this.hintText,
    required this.labelText,
    this.checkVisibility,
    this.submit,
    this.isP,
    required this.kbType,
    this.suffixIcon,
    this.prefixIcon,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          enableSuggestions: (kbType != TextInputType.emailAddress ||
                  isP != null)
              ? false
              : true,
          autocorrect: false,
          obscureText: isP != null ? true : false,
          onSubmitted: submit,
          keyboardType: kbType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white),
            ),
            fillColor: Colors.grey.shade100,
            filled: true,
            icon: (prefixIcon != null)
                ? null
                : Icon(
                    icon,
                    color: AppTheme.iconColor,
                  ),
            hintText: hintText,
            labelText: labelText,
            prefixIcon: Icon(
              prefixIcon,
              color: (iconColor != null ) ? iconColor : AppTheme.iconColor,
            ),
            suffixIcon: (isP != null && isP != false) ? suffixIcon : null,
          ),
        ),
      ),
    );
  }
}
