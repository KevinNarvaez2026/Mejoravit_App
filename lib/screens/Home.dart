import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Modales/Modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color color = HexColor('#d8072d');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Center(
                    child: Text(
                      'USER',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // RotatedBox(
                  //   quarterTurns: 135,
                  //   child: Icon(
                  //     Icons.bar_chart_rounded,
                  //     color: Colors.redAccent,
                  //     size: 28,
                  //   ),
                  // )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 32),
                    Center(
                      child: Image.asset(
                        'assets/images/Mejoravit.png',
                        scale: 1.1,
                      ),
                    ),
                    // const SizedBox(height: 16),
                    // const Center(
                    //   child: Text(
                    //     'MEJORAVIT',
                    //     style: TextStyle(
                    //       fontSize: 32,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 48),
                    const Text(
                      'MENU',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _cardMenu(
                          onTap: () {
                            showdialog_Aler();
                            //                  Navigator.pushReplacement(context,
                            // MaterialPageRoute(builder: (BuildContext ctx) => const Modal_Actas()));
                          },
                          icon: 'assets/images/icons8-add-male-user-64.png',
                          title: 'Nuevo Prospecto'.toUpperCase(),
                        ),
                        // _cardMenu(
                        //   onTap: () {

                        //   },
                        //   icon: 'assets/images/icons8-petition-96.png',
                        //   title: 'Registros'.toUpperCase(),

                        // ),
                      ],
                    ),
                    // const SizedBox(height: 28),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     _cardMenu(
                    //       icon: 'assets/images/water.png',
                    //       title: 'WATER',
                    //     ),
                    //     _cardMenu(
                    //       icon: 'assets/images/entertainment.png',
                    //       title: 'ENTERTAINMENT',
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  final Color color_Modal = HexColor("#d8072d");
  // ignore: non_constant_identifier_names
  showdialog_Aler() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Center(
                child: Text(
                  'NUEVO Prospecto'.toUpperCase(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              backgroundColor: color_Modal,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return SizedBox(
                    height: height - 50,
                    width: width - 20,
                    child: const Modal_Actas(),
                  );
                },
              ),
            ));
  }

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.black,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
        ),
        width: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image.asset(icon),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            )
          ],
        ),
      ),
    );
  }
}
