import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoHome',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9F6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF244B3A),
          primary: const Color(0xFF244B3A),
          surface: const Color(0xFFF8F9F6),
        ),
        useMaterial3: true,
      ),
      home: const HomeDashboard(),
    );
  }
}
