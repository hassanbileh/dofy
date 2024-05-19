import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        //logo
        SizedBox(
          height: 90,
          width: 250,
          child: Image.asset(
            'assets/images/dofy-logo.png',
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(
          height: 25,
        ),
        //Welcome Title
        Text(
          'WELCOME BACK',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
        const SizedBox(
          height: 20.0,
        ),

      ],
    );
  }
}
