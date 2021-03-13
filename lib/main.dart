import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/provider/catergoryProvider.dart';

import 'package:quizz_app/provider/loginProvider.dart';
import 'package:quizz_app/provider/registrationProvider.dart';
import 'package:quizz_app/screens/dashboard.dart';
import 'package:quizz_app/screens/welcomescreen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
        Provider<CatergoryProvider>(
          create: (_) => CatergoryProvider(),
        ),
        Provider<RegistrationProvider>(
          create: (_) => RegistrationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.teal,
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          DashBoard.id: (context) => DashBoard()
        },
      ),
    );
  }
}
