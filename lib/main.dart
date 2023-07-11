import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginmapa/database/helpers.dart';
import 'package:loginmapa/router/router.dart';
import 'package:loginmapa/screens/home_screen.dart';
import 'package:loginmapa/screens/mapa_screen.dart';



void main() async  {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
await IsarHelper.instance.int();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
   
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );
  }
}
