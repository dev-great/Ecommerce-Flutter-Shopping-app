import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quicktel/screens/home.dart';
import 'package:quicktel/screens/auth_screens/login_screen.dart';
import 'package:quicktel/screens/nav_screens/cart.dart';
import 'package:quicktel/screens/nav_screens/message.dart';
import 'package:quicktel/screens/nav_screens/product_screen.dart';
import 'package:quicktel/screens/nav_screens/profile.dart';
import 'package:quicktel/screens/nav_screens/shop.dart';
import 'package:quicktel/screens/auth_screens/register_screen.dart';
import 'package:quicktel/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: user != null ? Home.id : Welcome.id,
      routes: {
        Welcome.id: (context) => const Welcome(),
        Register.id: (context) => const Register(),
        Login.id: (context) => const Login(),
        Home.id: (context) => const Home(),
        Cart.id: (context) => const Cart(),
        Shop.id: (context) => const Shop(),
        Profile.id: (context) => const Profile(),
        Message.id: (context) => const Message(),
        Product.id: (context) => const Product(),
      },
    );
  }
}
