import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TextFormFieldPassword extends StatefulWidget {
  const TextFormFieldPassword({
    super.key,
    this.labelText,
    this.validator,
    required this.controller,
  });
  final String? labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  State<TextFormFieldPassword> createState() => _TExtFormFieldPasswordState();
}

class _TExtFormFieldPasswordState extends State<TextFormFieldPassword> {
  bool obscureText = true;
  IconData icon = Iconsax.eye_slash;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
              if (obscureText) {
                icon = Iconsax.eye_slash;
              } else {
                icon = Iconsax.eye;
              }
            });
          },
          icon: Icon(icon),
        ),
      ),
    );
  }
}
