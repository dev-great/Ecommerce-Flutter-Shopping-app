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

const graphQLProducts = """
query getInventoriesAtRandom{
  getInventoriesAtRandom{
    inventoryId
    Images{
      smallImageOnlineURL
    }
    inventoryName
    
  }
  
}""";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Welcome.id,
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
