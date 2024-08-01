import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/setting-Screen.dart';
import 'provider/settings-Provider.dart';
import 'provider/theme-Provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SettingsProvider, ThemeProvider>(
      builder: (context, settingsProvider, themeProvider, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          home: const SettingPage(),
          locale: Locale(settingsProvider.selectedLanguage),
        );
      },
    );
  }
}
