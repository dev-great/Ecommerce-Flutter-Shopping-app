import 'package:flutter/material.dart';
import 'package:quicktel/screens/auth_screens/register_screen.dart';

class Welcome extends StatelessWidget {
  static String id = 'welcome';
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.3,
          child: ClipRRect(
            child: Image(
              height: MediaQuery.of(context).size.height,
              image: const AssetImage("assets/images/QslBgTkhVIQR 1.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.7,
          left: MediaQuery.of(context).size.height / 6.1,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(120)),
              color: const Color(0xFF083E88).withOpacity(0.7),
            ),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.3,
            color: const Color(0xFFFFA412).withOpacity(0.25)),
        Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 1.5,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 146, 102, 30),
                        Color(0xFF083E88)
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 30,
                          bottom: MediaQuery.of(context).size.height / 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Ti",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color(0xFFFFA412),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "mart",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.25,
                      child: const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 25,
                          bottom: MediaQuery.of(context).size.height / 25),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Register.id);
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFFFFA412),
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
