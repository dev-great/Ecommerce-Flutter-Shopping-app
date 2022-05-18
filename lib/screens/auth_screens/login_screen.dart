import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quicktel/components/auth_snippets/auth_btn.dart';
import 'package:quicktel/components/auth_snippets/facebook_btn.dart';
import 'package:quicktel/components/auth_snippets/google_btn.dart';
import 'package:quicktel/components/const.dart';
import 'package:quicktel/screens/home.dart';
import 'package:quicktel/screens/auth_screens/register_screen.dart';
import 'package:quicktel/state/auth.dart';
import 'package:quicktel/state/validator.dart';

class Login extends StatefulWidget {
  static String id = 'login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: bgcl,
        appBar: AppBar(
          backgroundColor: bgcl,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: blackcl)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 34,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 10, right: 15),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 64,
                          color: lightcl,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: blackcl,
                                    labelText: "Email",
                                    suffixIcon:
                                        _emailTextController.text.isEmpty
                                            ? null
                                            : const FaIcon(
                                                FontAwesomeIcons.check,
                                                color: Colors.green,
                                              ),
                                    labelStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontFamily: "Poppins",
                                    )),
                                controller: _emailTextController,
                                focusNode: _focusEmail,
                                validator: (value) {
                                  Validator.validateEmail(
                                    email: value,
                                  );
                                  return null;
                                }),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 64,
                          color: lightcl,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
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
                                    fontFamily: "Poppins",
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
                              Navigator.pushNamed(context, Register.id);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 8, right: 5),
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        color: blackcl,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.red,
                                  size: 18,
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
                              _focusEmail.unfocus();
                              _focusPassword.unfocus();

                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _isProcessing = true;
                                });
                                if (_emailTextController.text.isEmpty ||
                                    _passwordTextController.text.isEmpty) {
                                  setState(() {
                                    _isProcessing = false;
                                  });
                                }

                                User? user =
                                    await FireAuth.signInUsingEmailPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text,
                                );

                                setState(() {
                                  _isProcessing = false;
                                });

                                if (user != null) {
                                  Navigator.pushNamed(context, Home.id);
                                }
                              }
                            },
                            child: AuthBtn(
                                isProcessing: _isProcessing, title: 'Login'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 6.5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Or login with social account",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Poppins",
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  GoogleBtn(),
                                  SizedBox(width: 20),
                                  FacebookBtn(),
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
