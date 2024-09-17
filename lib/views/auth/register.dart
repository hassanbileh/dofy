import 'package:dofy/constants/routes.dart';
import 'package:dofy/constants/theme.dart';
import 'package:dofy/services/auth/auth_exceptions.dart';
import 'package:dofy/services/auth/auth_services.dart';
import 'package:dofy/states/cubits/cubits.dart';
import 'package:dofy/utilities/dialogs/error_dialog.dart';
import 'package:dofy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _nom;
  late final TextEditingController _telephone;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _nom = TextEditingController();
    _telephone = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _nom.dispose();
    _telephone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void _viewPassword(BuildContext context) {
    context.read<VisibilityCubit>().setVisibility();
  }

  void _pwdConfirmation() {
    final pwd = _password.text.trim();
    final cnf = _confirmPassword.text.trim();
    (pwd == cnf) ? _submitData() : throw InvalidPasswordConfirmation();
  }

  void _submitData() async {
    try {
      final email = _email.text.trim().toLowerCase();
      final password = _password.text.trim();
      final confirmPassword = _confirmPassword.text.trim();
      final nom = _nom.text.trim();
      final telephone = int.parse(_telephone.text.trim());
      if (email.isEmpty ||
          password.isEmpty ||
          nom.isEmpty ||
          confirmPassword.isEmpty) {
        await showErrorDialog(context, 'Make sure you filled all requirements');
      } else {
        await AuthService.firebase().createClient(
          email: email,
          nom: nom,
          password: password,
          telephone: telephone,
        );
        await AuthService.firebase().sendEmailVerification();
        Navigator.of(context)
            .pushNamedAndRemoveUntil(verifyEmailRoute, (route) => false);
      }
    } on EmailAlreadyInUseAuthException {
      await showErrorDialog(
        context,
        'Email already in use',
      );
    } on InvalidEmailAuthException {
      await showErrorDialog(
        context,
        'Invalid email',
      );
    } on GenericAuthException {
      await showErrorDialog(
        context,
        'Make sure all fields are provided',
      );
    } on UserNotLoggedInAuthException {
      await showErrorDialog(
        context,
        'failed to resgister',
      );
    } on FormatException {
      await showErrorDialog(
        context,
        'Make sure all fields are provided',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: RegisterForm(
        icon: Icons.travel_explore,
        email: _email,
        nom: _nom,
        telephone: _telephone,
        password: _password,
        confirmPassword: _confirmPassword,
        buttonText: 'S\'inscrire',
        confirm: _pwdConfirmation,
        littleTitle: 'Vous avez un compte ?',
        littleButton: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(loginRoute, (route) => false);
        },
        littleButtonText: 'Se connecter',
      ),
    );
  }
}
