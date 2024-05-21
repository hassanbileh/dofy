import 'package:dofy/constants/theme.dart';
import 'package:flutter/material.dart';

class Explaination extends StatelessWidget {
  const Explaination({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });
  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppTheme.formIconColor,
          size: 30,
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5.0,),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Divider(),
            ],
          ),
        )
      ],
    );
  }
}
