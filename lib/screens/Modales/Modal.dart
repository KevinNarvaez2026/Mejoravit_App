import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:convert';

import '../../components/core/Progressbar.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/rounded_input_field.dart';

enum ViewDialogsAction { yes, no }

class Modal_Actas extends StatefulWidget {
  const Modal_Actas({key}) : super(key: key);
  @override
  _Modal_ActasState createState() => _Modal_ActasState();
}
// Puedes pasar cualquier objeto al parámetro `arguments`. En este ejemplo, crea una
// clase que contiene ambos, un título y un mensaje personalizable.

class _Modal_ActasState extends State<Modal_Actas> {
  late String title;
  TextEditingController ActoController = TextEditingController();
  TextEditingController curpController = TextEditingController();
  TextEditingController etadoController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  var _latitude = "";
  var _longitud = "";

  _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _latitude = position.latitude.toString();
      _longitud = position.longitude.toString();
    });

    print(_latitude);
    print(_longitud);
    // Put_GPS(_latitude, _longitud);
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;
    try {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          out();
          return Future.error(out());
        }
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print(e.toString());
      out();
    }
    return await Geolocator.getCurrentPosition();
  }

  out() async {
    const snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: Text(
        "Debe otorgar todos los permisos",
        style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //_speak("Debe otrogar todos los permisos");
    await Future.delayed(Duration(seconds: 4));
    exit(0);
  }

  bool tappedYes = false;
  String Token = "";

  bool isApiCallProcess = false;

//11606600011964010480

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _provinceContainers(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      key: Key(isApiCallProcess.toString()),
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }

  final Color color = HexColor('#D61C4E');
  final Color color_Modal = HexColor("#d8072d");
  @override
  Widget _provinceContainers(BuildContext context) {
    var crupestado;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.indigo.shade50,
      // set it to false
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: Colors.indigo.shade50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Form(
                          child: Column(
                            children: [
                              const RoundedInputField(
                                  hintText: "Nombre", icon: Icons.person),

                              const Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      maxLines: 8, //or null
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Comentarios"),
                                    ),
                                  )),
                              //open button ----------------
                              ElevatedButton(
                                  onPressed: () {
                                    openImages();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text("Seleccionar Fotos")),
                              const SizedBox(
                                height: 20,
                              ),
                              //open button ----------------
                              ElevatedButton(
                                  onPressed: () {
                                    // openImages();
                                    _getCurrentLocation();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text("Generar Ubicacion")),

//                                  if (_latitude != "" && _longitud != "")
// TextFormField(
//                                   controller: etadoController,
//                                   decoration: const InputDecoration(
//                                       hintText: '',

//                                       contentPadding: EdgeInsets.all(20),
//                                       fillColor: Colors.green,
//                                       filled: true,
//                                       hintStyle:
//                                           TextStyle(color: Colors.white)),

//                                   readOnly: true,

//                                   // obscureText: true,
//                                 ),
                              imagefiles != null
                                  ? Wrap(
                                      children: imagefiles!.map((imageone) {
                                        return Card(
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child:
                                                Image.file(File(imageone.path)),
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  : Container(),
                              //  switchListTile(),

                              RoundedButton(text: 'Registrar', press: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     '' + user.toString(),
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontFamily: 'RobotoMono',
      //       fontWeight: FontWeight.w800,
      //       color: Colors.white,
      //     ),
      //   ),
      //   elevation: 0,
      //   brightness: Brightness.light,
      //   backgroundColor: color,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       size: 20,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
    );
  }

  int entidadValue = 0;
  var entidad;
  late String bdEstado;

  var nose;
  onChangeCurp(String curp) {
    if (curp.length == 18) {
      curpController.text = curp;

      var res = curp[11] + curp[12];
      //  print(res.toString().toUpperCase());
      //  print(entidad);
      switch (res.toString().toUpperCase()) {
        case 'AS':
          {
            entidadValue = 1;
            entidad = 'AGUASCALIENTES';
            bdEstado = 'n0';
            nose = "1";
            break;
          }
        case 'BC':
          {
            entidadValue = 2;
            entidad = 'BAJA CALIFORNIA';
            bdEstado = 'n1';
            nose = "2";
            break;
          }
        case 'BS':
          {
            entidadValue = 3;
            entidad = 'BAJA CALIFORNIA SUR';
            bdEstado = 'n2';
            nose = "3";
            break;
          }
        case 'CC':
          {
            entidadValue = 4;
            entidad = 'CAMPECHE';
            bdEstado = 'n3';
            nose = "4";

            break;
          }
        case "CS":
          {
            entidadValue = 7;
            entidad = 'CHIAPAS';
            bdEstado = 'n4';
            nose = "5";
            // print(entidadValue);
            break;
          }
        case 'CH':
          {
            entidadValue = 8;
            entidad = 'CHIHUAHUA';
            bdEstado = 'n5';
            nose = "6";
            break;
          }
        case 'DF':
          {
            entidadValue = 9;
            entidad = 'DISTRITO FEDERAL';
            bdEstado = 'n6';
            nose = "7";
            break;
          }
        case 'CL':
          {
            entidadValue = 5;
            entidad = 'COAHUILA DE ZARAGOZA';
            bdEstado = 'n7';
            nose = "8";
            break;
          }
        case 'CM':
          {
            entidadValue = 6;
            entidad = 'COLIMA';
            bdEstado = 'n8';
            nose = "9";
            break;
          }
        case 'DG':
          {
            entidadValue = 10;
            entidad = 'DURANGO';
            bdEstado = 'n9';
            nose = "10";
            break;
          }
        case 'GT':
          {
            entidadValue = 11;
            entidad = 'GUANAJUATO';
            bdEstado = 'n10';
            nose = "11";
            break;
          }
        case 'GR':
          {
            entidadValue = 12;
            entidad = 'GUERRERO';
            bdEstado = 'n11';
            nose = "12";
            break;
          }
        case 'HG':
          {
            entidadValue = 13;
            entidad = 'HIDALGO';
            bdEstado = 'n12';
            nose = "13";
            break;
          }
        case 'JC':
          {
            entidadValue = 14;
            entidad = 'JALISCO';
            bdEstado = 'n13';
            nose = "14";
            break;
          }
        case 'MC':
          {
            entidadValue = 15;
            entidad = 'MEXICO';
            bdEstado = 'n14';
            nose = "15";
            break;
          }
        case 'MN':
          {
            entidadValue = 16;
            entidad = 'MICHOACAN';
            bdEstado = 'n15';
            nose = "16";
            break;
          }
        case 'MS':
          {
            entidadValue = 17;
            entidad = 'MORELOS';
            bdEstado = 'n16';
            nose = "17";
            break;
          }
        case 'NT':
          {
            entidadValue = 18;
            entidad = 'NAYARIT';
            bdEstado = 'n17';
            nose = "18";
            break;
          }
        case 'NL':
          {
            entidadValue = 19;
            entidad = 'NUEVO LEON';
            bdEstado = 'n18';
            nose = "19";
            break;
          }
        case 'OC':
          {
            entidadValue = 20;
            entidad = 'OAXACA';
            bdEstado = 'n19';
            nose = "20";
            break;
          }
        case 'PL':
          {
            entidadValue = 21;
            entidad = 'PUEBLA';
            bdEstado = 'n20';
            nose = "21";
            break;
          }
        case 'QT':
          {
            entidadValue = 22;
            entidad = 'QUERETARO';
            bdEstado = 'n21';
            nose = "22";
            break;
          }
        case 'QR':
          {
            entidadValue = 23;
            entidad = 'QUINTANA ROO';
            bdEstado = 'n22';
            nose = "23";
            break;
          }
        case 'SP':
          {
            entidadValue = 24;
            entidad = 'SAN LUIS POTOSI';
            bdEstado = 'n23';
            nose = "24";
            break;
          }
        case 'SL':
          {
            entidadValue = 25;
            entidad = 'SINALOA';
            bdEstado = 'n24';
            nose = "25";
            break;
          }
        case 'SR':
          {
            entidadValue = 26;
            entidad = 'SONORA';
            bdEstado = 'n25';
            nose = "26";
            break;
          }
        case 'TC':
          {
            entidadValue = 27;
            entidad = 'TABASCO';
            bdEstado = 'n26';
            nose = "27";
            break;
          }

        case 'TS':
          {
            entidadValue = 28;
            entidad = 'Entidad no disponible';
            bdEstado = 'n27';
            nose = "28";
            break;
          }
        case 'TL':
          {
            entidadValue = 29;
            entidad = 'TLAXCALA';
            bdEstado = 'n28';
            nose = "29";
            break;
          }
        case 'VZ':
          {
            entidadValue = 30;
            entidad = 'VERACRUZ';
            bdEstado = 'n29';
            nose = "30";
            break;
          }
        case 'YN':
          {
            entidadValue = 31;
            entidad = 'YUCATAN';
            bdEstado = 'n30';
            nose = "31";
            break;
          }
        case 'ZS':
          {
            entidadValue = 32;
            entidad = 'ZACATECAS';
            bdEstado = 'n31';
            nose = "32";
            break;
          }
        default:
          {
            entidadValue = 39;
            entidad = 'NACIDO EN EL EXTRANJERO';
            bdEstado = 'n32';
            nose = "33";
            break;
          }
      }
    } else {
      setState(() {
        entidad = 'Entidad de registro';
      });
    }
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
