import 'package:connecten/provider/sign_in_provider.dart';
import 'package:connecten/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // Initialize the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
      ],
      child: MaterialApp(
        title: 'ConnecTen',
        theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        )),
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }

  LandingPage() => SplashScreen();
}
