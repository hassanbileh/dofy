import 'package:dofy/constants/routes.dart';
import 'package:dofy/firebase_options.dart';
import 'package:dofy/services/auth/auth_services.dart';
import 'package:dofy/views/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: DefaultFirebaseOptions.currentPlatform.projectId,
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: Colors.deepPurple.shade400
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        verifyEmailRoute: (context) => const VerificationEmail(),
        homePageView: (context) => const HomePageView(),
        bookingPageView: (context) => const BookingPageView(),
        resetPassordRoute: (context) => const ForgetPasswordView(),
        ticketsResultsRoute: (context) => const TicketResults(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialise(),
      builder: (ctx, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('Error');
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            //? Verifier si le user est connecté
            if (user != null) {
              if (user.isEmailVerified) {
                return const HomePageView();
              } else{
                return const VerificationEmail();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
