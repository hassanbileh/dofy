import 'package:dofy/constants/routes.dart';
import 'package:dofy/constants/theme.dart';
import 'package:dofy/states/cubits/cubits.dart';
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
        confirm: () {},
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
