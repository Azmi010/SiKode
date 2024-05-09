import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? label;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Color.fromRGBO(169, 169, 169, 1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintText: widget.hintText,
        labelText: widget.label,
        hintStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color.fromRGBO(1, 193, 139, 1),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        labelStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color.fromRGBO(1, 193, 139, 1),
          fontSize: 16,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
      obscureText: widget.obscureText ? _obscureText : false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
    );
  }
}
