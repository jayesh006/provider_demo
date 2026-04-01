import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final obscureText;
  final VoidCallback sufixIconPress;
  final showSufixIcon;
  final sufixIcon;
  final text;
  final hintText;
  final ValueChanged<String>? onChange;
  const CustomTextField({
    super.key,
    this.obscureText = false,
    required this.sufixIconPress,
    this.showSufixIcon,
    this.sufixIcon,
    this.text,
    this.hintText,
    required this.onChange
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChange,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.greenAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: hintText,
        label: Text(text),
        suffixIcon: showSufixIcon ? IconButton(
          onPressed: sufixIconPress,
          icon: sufixIcon,
        ) : null,
      ),
    );
  }
}
