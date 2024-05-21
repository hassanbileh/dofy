import 'package:dofy/widgets/components/custom_textfield.dart';
import 'package:dofy/widgets/components/gradient_button.dart';
import 'package:flutter/material.dart';
import '../../constants/text_field.dart';

typedef OnSubmitted = void Function(String)?;
typedef OnPressed = void Function()?;

class LoginBody extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final OnSubmitted? onSubmitted;
  final OnPressed onPressed;
  final OnPressed forgotPassword;
  final OnPressed inscription;
  const LoginBody({
    super.key,
    required this.email,
    required this.password,
    required this.onSubmitted,
    required this.onPressed,
    required this.inscription,
    required this.forgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Email textField
          CustomTextField(
            controller: email,
            prefixIcon: Icons.email,
            hintText: "Entrer votre email ici",
            labelText: "Email",
            kbType: TextInputType.emailAddress,
          ),

          //Password textfield
          CustomTextField(
            controller: password,
            prefixIcon: Icons.key,
            hintText: "Entrer votre mot de passe",
            labelText: "Mot de passe",
            submit: onSubmitted,
            isP: true,
            kbType: TextInputType.visiblePassword,
          ),

          //Mot de passe oublié
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: forgotPassword,
                child: Text(
                  'mot de passe oublié ?',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),

          // connexion
          GradientButton(
            buttonText: loginButtonText,
            onPressed: onPressed,
            height: 60.0,
            width: 330.0,
          ),

          const SizedBox(
            height: 30,
          ),

          // Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('vous n\'avez pas un compte ?'),
              TextButton(
                onPressed: inscription,
                child: const Text(
                  registerButtonText,
                  style: TextStyle(color: Color.fromARGB(255, 74, 44, 156)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
