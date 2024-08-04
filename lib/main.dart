import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/firebase_options.dart';
import 'package:hackathon/src/provider/cart_provider.dart';
import 'package:hackathon/src/views/category_screen.dart';
import 'package:hackathon/src/views/detail_screen.dart';
import 'package:hackathon/src/views/home_screen.dart';
import 'package:hackathon/src/views/login_screen.dart';
import 'package:hackathon/src/views/product_screen.dart';
import 'package:hackathon/src/views/signup_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),

      // SignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
