import 'package:dofy/constants/theme.dart';
import 'package:dofy/widgets/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late final TextEditingController _email;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  // void _resetPwd() async {
  //   try {
  //     await AuthService.firebase().resetPassword(email: _email.text);
  //     await showErrorDialog(
  //       context,
  //       'Verifier vos mails, nous vous avons envoyé un lien de réinitialisation',
  //     );
  //   } on UserNotFoundAuthException {
  //     await showErrorDialog(
  //       context,
  //       'Utilisateur introuvable',
  //     );
  //   } on EmailAlreadyInUseAuthException {
  //     await showErrorDialog(
  //       context,
  //       'Email dèjà utilisé',
  //     );
  //   } on GenericAuthException {
  //     await showErrorDialog(
  //       context,
  //       'Erreur, veuillez entrer un email.',
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     await showErrorDialog(
  //       context,
  //       e.message.toString(),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 50.0),
          child: Text(
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.titleTextColor,
            ),
            "Réinitialiser",
          ),
        ),
        shadowColor: Colors.lightBlue,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        height: 300,
        width: double.infinity,
        child: Card(
          color: AppTheme.cardColor,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.restart_alt_rounded,
                color: AppTheme.iconColor,
                size: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Entrer votre email ici, nous vous enverrons un lien pour réinitialiser votre mot de passe.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _email,
                prefixIcon: Icons.email,
                hintText: "Entrer votre email ici",
                labelText: "Email",
                kbType: TextInputType.emailAddress,
              ),
              TextButton(
                style: const ButtonStyle(
                  mouseCursor: WidgetStateMouseCursor.clickable,
                ),
                onPressed: () {},
                child: Text(
                  'Réinitialiser le mot de passe',
                  style: TextStyle(color: AppTheme.titleTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
