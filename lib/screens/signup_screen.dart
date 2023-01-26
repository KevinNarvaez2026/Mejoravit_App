import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/components/components.dart';
import 'package:flutter_auth_ui/components/under_part.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/screens/screens.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = HexColor.fromHex('#d8072d');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/klipartz.png",
                ),
                const PageTitleBar(title: ''),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // const SizedBox(
                        //   height: 15,
                        // ),

                        const SizedBox(
                          height: 20,
                        ),
                        // const Text(
                        //   "or use your email account",
                        //   style: TextStyle(
                        //       color: Colors.grey,
                        //       fontFamily: 'OpenSans',
                        //       fontSize: 13,
                        //       fontWeight: FontWeight.w600),
                        // ),
                        Form(
                          child: Column(
                            children: [
                              const RoundedInputField(
                                  hintText: "Nombre", icon: Icons.email),
                              const RoundedInputField(
                                  hintText: "Telefono", icon: Icons.person),
                              // const RoundedPasswordField(),
                              RoundedButton(text: 'Regitsrarse', press: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              // UnderPart(
                              //   title: "Already have an account?",
                              //   navigatorText: "Login here",
                              //   onTap: () {
                              //     Navigator.push(context,
                              //       MaterialPageRoute(builder: (context) => const LoginScreen())
                              //     );
                              //   },
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
