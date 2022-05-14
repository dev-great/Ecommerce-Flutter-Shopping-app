import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quicktel/screens/auth_screens/login_screen.dart';
import 'package:quicktel/state/auth.dart';
import 'package:quicktel/state/validator.dart';

class Register extends StatefulWidget {
  static String id = 'register';
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE5E5E5),
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Sign up",
                      style: TextStyle(
                          fontFamily: "GTWalsheimPro",
                          fontSize: 34,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15, right: 15),
                  child: Form(
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        Container(
                          height: 64,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                  labelText: "Name",
                                  suffix: _nameTextController.text.isEmpty
                                      ? null
                                      : const FaIcon(
                                          FontAwesomeIcons.check,
                                          color: Colors.green,
                                        ),
                                  labelStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontFamily: "GTWalsheimPro",
                                  )),
                              controller: _nameTextController,
                              focusNode: _focusName,
                              validator: (value) => Validator.validateName(
                                name: value,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 64,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                  labelText: "Email",
                                  suffix: _emailTextController.text.isEmpty
                                      ? null
                                      : const FaIcon(
                                          FontAwesomeIcons.check,
                                          color: Colors.green,
                                        ),
                                  labelStyle: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontFamily: "GTWalsheimPro",
                                  )),
                              controller: _emailTextController,
                              focusNode: _focusEmail,
                              validator: (value) => Validator.validateEmail(
                                email: value,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 64,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your valied password",
                                  labelText: "Password*",
                                  labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontFamily: "GTWalsheimPro",
                                  )),
                              controller: _passwordTextController,
                              focusNode: _focusPassword,
                              obscureText: true,
                              validator: (value) => Validator.validatePassword(
                                password: value,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Login.id);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 8, right: 5),
                                  child: Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.red,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 25,
                              bottom: MediaQuery.of(context).size.height / 25),
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                _isProcessing = true;
                              });

                              if (_registerFormKey.currentState!.validate()) {
                                User? user =
                                    await FireAuth.registerUsingEmailPassword(
                                  name: _nameTextController.text,
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                );

                                setState(() {
                                  _isProcessing = false;
                                });

                                if (user != null) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                      ModalRoute.withName(Login.id));
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFFFA412),
                              ),
                              child: Center(
                                child: _isProcessing
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                        textAlign: TextAlign.center,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Or sign up with social account",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: ClipRRect(
                                        child: Image(
                                          height: 25,
                                          width: 25,
                                          image: AssetImage(
                                              "assets/icons/1534129544.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                    ),
                                    child: const Center(
                                      child: ClipRRect(
                                        child: Image(
                                          height: 25,
                                          width: 25,
                                          image: AssetImage(
                                              "assets/icons/facebook.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
