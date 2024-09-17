import 'package:dofy/constants/routes.dart';
import 'package:dofy/constants/theme.dart';
import 'package:dofy/services/auth/auth_exceptions.dart';
import 'package:dofy/services/auth/auth_services.dart';
import 'package:dofy/services/cloud/storage/user_storage.dart';
import 'package:dofy/utilities/dialogs/error_dialog.dart';
import 'package:dofy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final FirebaseCloudUserStorage _firebaseCloudService;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _firebaseCloudService = FirebaseCloudUserStorage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void _submit() async {
    try {
      final email = _email.text.toLowerCase();
      final password = _password.text;
      await AuthService.firebase().logIn(
        email: email,
        password: password,
      );
      final user = AuthService.firebase().currentUser;
      if (user?.isEmailVerified ?? false) {
        // user email is verified
        await _firebaseCloudService.updateIsEmailVerified(email: email);
          Navigator.of(context)
              .pushNamedAndRemoveUntil(homePageView, (route) => false);
      } else {
         // user email is NOT verified
        await AuthService.firebase().sendEmailVerification();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(verifyEmailRoute, (route) => false);
      }
    } on UserNotFoundAuthException {
      await showErrorDialog(
        context,
        'Utilisateur introuvable',
      );
    } on WrongPasswordAuthException {
      await showErrorDialog(
        context,
        'Informations Incorrectes',
      );
    } on GenericAuthException {
      await showErrorDialog(
        context,
        'Erreur d\'authentification',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),

                  // Header
                  const HeaderLogin(),

                  //Body
                  LoginBody(
                    email: _email,
                    password: _password,
                    onSubmitted: (_) => _submit(),
                    onPressed: _submit,
                    inscription: () =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                      registerRoute,
                      (route) => false,
                    ),
                    forgotPassword: () => Navigator.of(context).pushNamed(resetPassordRoute),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
