import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quant_ai_toolkit_app/screens/splash_screen.dart';
import 'package:quant_ai_toolkit_app/providers/app_provider.dart';
import 'package:quant_ai_toolkit_app/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  runApp(
    const ProviderScope(
      child: QuantAIToolkitApp(),
    ),
  );
}

class QuantAIToolkitApp extends ConsumerWidget {
  const QuantAIToolkitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);
    
    return MaterialApp(
      title: 'Quant-AI-Toolkit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
