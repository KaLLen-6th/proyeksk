import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeksk/firebase_options.dart';
import 'package:projeksk/providers/app_provider.dart';
import 'package:projeksk/themes/color.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(
            create: (context) => AppProvider()
        ..getNilaiSuhu()
        ..getNilaiKelembaban()
        ..getNilaiSoil()
        ..getStatusLed()
        ..getAutoMode()
        )],
      child: MaterialApp(
        title: 'MONITORING LIDAH MERTUA',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

