import 'package:coba_to_do_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  MainApp app = MainApp(); 
  runApp(
    app
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true, 
        unselectedWidgetColor: Colors.black
      ),
      home: HomePage()
    );
  }
}
