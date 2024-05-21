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
          color: Colors.grey[600],
          size: 30,
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.8,
          margin: const EdgeInsets.only(left: 15.0, right: 10.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
