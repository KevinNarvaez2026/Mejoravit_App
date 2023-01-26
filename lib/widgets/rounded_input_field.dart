import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({Key? key, this.hintText, this.icon = Icons.person})
      : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final Color color = HexColor.fromHex('#000000');
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: color,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: color,
            ),
            
            hintText: hintText,
            hintMaxLines: 8,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}
