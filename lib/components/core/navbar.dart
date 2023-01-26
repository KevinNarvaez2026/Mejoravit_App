import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

import '../../screens/Home.dart';

class NavBar extends StatefulWidget {
  const NavBar({key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
 
  @override
  void initState() {
    super.initState();
   
  }

  

  // const NavBar({key}) : super(key: key);
  final GlobalKey _NavKey = GlobalKey();

  // ignore: non_constant_identifier_names
  var PagesAll = [
    const HomePage()
  ];

  var myindex = 0;
  
final Color color = HexColor('#d8072d');

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.indigo.shade50,
        key: _NavKey,
        items: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
               Center(
                child: Icon((myindex == 0) ? Icons.home_outlined : Icons.home,
                    color: Colors.white),
              ),
               Center(
                child: Text(
                  ' Inicio',
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                ),
              ),
              // Text(' to add'),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Center(
                child: Icon(
                    (myindex == 1)
                        ? Ionicons.documents_outline
                        : Ionicons.documents,
                    color: Colors.white),
              ),
               Center(
                child: Text('Registros',
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.white)),
              ),
            ],
          ),
          // Wrap(
          //   crossAxisAlignment: WrapCrossAlignment.center,
          //   children: [
          //      Center(
          //       child: Icon(
          //           (myindex == 2)
          //               ? Ionicons.document_outline
          //               : Ionicons.document,
          //           color: Colors.white),
          //     ),
          //      Center(
          //       child: Text('RFC',
          //           style: GoogleFonts.lato(
          //               textStyle: Theme.of(context).textTheme.headline4,
          //               fontSize: 14,
          //               fontWeight: FontWeight.w700,
          //               fontStyle: FontStyle.italic,
          //               color: Colors.white)),
          //     ),
          //   ],
          // ),
          // Wrap(
          //   crossAxisAlignment: WrapCrossAlignment.center,
          //   children: [
          //      Center(
          //       child: Icon(
          //           (myindex == 3) ? Icons.monetization_on_outlined : Icons.monetization_on,
          //           color: Colors.white),
          //     ),
          //      Center(
          //       child: Text(' Corte ',
          //           style: GoogleFonts.lato(
          //               textStyle: Theme.of(context).textTheme.headlineMedium,
          //               fontSize: 14,
          //               fontWeight: FontWeight.w700,
          //               fontStyle: FontStyle.italic,
          //               color: Colors.white)),
          //     ),
          //   ],
          // ),
        
           
          // Wrap(
          //WordList(this._wordModal);
          //   crossAxisAlignment: WrapCrossAlignment.center,
          //   children: [
          //     Icon((myindex == 4 && logout())
          //         ? Icons.logout
          //         : Icons.logout_outlined),
          //     Text(' Cerrar '),
          //     Text('Sesion'),
          //   ],
          // ),
        ],
        buttonBackgroundColor: color,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        animationCurve: Curves.fastLinearToSlowEaseIn,
        color: Colors.black,
      ),
      body: PagesAll[myindex],
    );
  }

 
}
