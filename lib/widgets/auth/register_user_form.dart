// ignore_for_file: must_be_immutable
import 'package:dofy/widgets/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dofy/widgets/components/gradient_button.dart';

typedef ConfirmCallBack = void Function();
typedef LittleCallBack = void Function();

class RegisterForm extends StatelessWidget {
  final IconData? icon;
  final ConfirmCallBack confirm;
  final ConfirmCallBack? littleButton;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final TextEditingController nom;
  final TextEditingController telephone;
  final String? buttonText;
  final String? littleTitle;
  final String? littleButtonText;

  const RegisterForm({
    super.key,
    this.icon,
    required this.email,
    required this.nom,
    required this.telephone,
    required this.password,
    required this.confirmPassword,
    required this.buttonText,
    required this.confirm,
    required this.littleTitle,
    required this.littleButton,
    required this.littleButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                //Welcome Title
                Text(
                  'WELCOME TO',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(
                  height: 5.0,
                ),
    
                //logo
                SizedBox(
                  height: 70,
                  width: 220,
                  child: Image.asset(
                    'assets/images/dofy-logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
    
                const SizedBox(
                  height: 10.0,
                ),
    
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Email textField
                      CustomTextField(
                        controller: email,
                        prefixIcon: Icons.email_rounded,
                        labelText: 'Email',
                        hintText: 'Entrer votre email',
                        kbType: TextInputType.emailAddress,
                      ),
    
                      // Nom textField
                      CustomTextField(
                        controller: nom,
                        prefixIcon: Icons.person_pin_rounded,
                        labelText: 'Nom',
                        hintText: 'Entrer votre nom',
                        kbType: TextInputType.name,
                      ),
    
                      // Telephone textField
                      CustomTextField(
                        controller: telephone,
                        prefixIcon: Icons.phone,
                        labelText: 'Telephone',
                        hintText: 'Entrer votre numero de telephone',
                        kbType: TextInputType.phone,
                      ),
    
                      //Password
                      CustomTextField(
                        controller: password,
                        prefixIcon: Icons.key,
                        labelText: 'Password',
                        hintText: 'Entrer votre mot de passe',
                        kbType: TextInputType.visiblePassword,
                        isP: true,
                      ),
    
                      //Confirm Password
                      CustomTextField(
                        controller: confirmPassword,
                        prefixIcon: Icons.key,
                        labelText: 'Confirmer',
                        hintText: 'Confirmer votre mot de passe',
                        kbType: TextInputType.visiblePassword,
                        isP: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
    
                      GradientButton(
                        buttonText: buttonText!,
                        onPressed: confirm,
                        height: 60.0,
                        width: 330.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(littleTitle!),
                          TextButton(
                            onPressed: littleButton!,
                            child: Text(
                              littleButtonText!,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 74, 44, 156)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
