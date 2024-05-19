import 'package:dofy/constants/routes.dart';
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

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    onSubmitted: (_) {},
                    onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                          homePageView, (route) => false),
                    inscription: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil(
                            registerRoute, (route) => false),
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
