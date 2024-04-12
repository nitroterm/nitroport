import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nitroport/colortheme.dart';
import 'package:nitroport/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

ThemeData _buildTheme() {
  ThemeData theme = ThemeData(
    // This is the theme of your application.
    //
    // TRY THIS: Try running your application with "flutter run". You'll see
    // the application has a blue toolbar. Then, without quitting the app,
    // try changing the seedColor in the colorScheme below to Colors.green
    // and then invoke "hot reload" (save your changes or press the "hot
    // reload" button in a Flutter-supported IDE, or press "r" if you used
    // the command line to start the app).
    //
    // Notice that the counter didn't reset back to zero; the application
    // state is not lost during the reload. To reset the state, use hot
    // restart instead.
    //
    // This works for code too, not just values: Most code changes can be
    // tested with just a hot reload.
    colorScheme: nitrotermColorScheme(),
    useMaterial3: true,
  );

  return theme.copyWith(textTheme: GoogleFonts.ptSansTextTheme(theme.textTheme));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildTheme(),
      home: const LoginPage(title: 'Nitroterm'),
    );
  }
}
