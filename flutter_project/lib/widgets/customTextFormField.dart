import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    this.hintText,
    this.icon,

    required this.isRequired,
    required this.controller,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String? hintText;

  final bool isRequired;
  final IconData? icon;
  bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Stack(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFC3CBF0),
                  Color(0xFF9DAAE8),
                  Color(0xFFBCC5EE),
                  Color(0xFF93ABD9),
                ],
              ),
            ),
          ),
          TextFormField(
            controller: widget.controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              prefixIcon: Icon(widget.icon, color: Color(0xff527DBC)),
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Color(0xff708FCB)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              suffixIcon:
                  widget.isPassword
                      ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(
                          color: Color(0xff527DBC),

                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                      )
                      : null,
            ),
            validator: (data) {
              if (widget.isRequired && (data == null || data.isEmpty)) {
                return 'This field is required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
