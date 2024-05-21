import 'package:flutter/material.dart';

typedef VoidCall = void Function();

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final IconData? icon;
  final Color? iconColor;
  final String? value;
  final String? content;
  final VoidCall function;
  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.margin,
    this.icon,
    this.value,
    required this.function,
    this.content,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10.0,
            ),
            if (icon != null) Icon(icon, color: (iconColor != null) ? iconColor : null,),
            const SizedBox(
              width: 10.0,
            ),
            Text((value != null) ? value! : content!),
          ],
        ),
      ),
    );
  }
}
