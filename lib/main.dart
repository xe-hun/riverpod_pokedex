import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poki_dex/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'PokeDex',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
              useMaterial3: true,
              textTheme: GoogleFonts.quattrocentoSansTextTheme()),
          home: const HomePage()),
    );
  }
}
