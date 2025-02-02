import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;

  const CustomPasswordTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
  });

  @override
  CustomPasswordTextFieldState createState() => CustomPasswordTextFieldState();
}

class CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Container(
          height: 50,
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: widget.hintText,
              
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
      ],
    );
  }
}
