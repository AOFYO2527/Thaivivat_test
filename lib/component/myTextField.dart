import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final isPassword;
  final prefix;
  final suffix;
  final inputType;
  final inputFormat;
  final maxLength;
  final isReadOnly;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword,
    this.prefix,
    this.suffix,
    this.inputType,
    this.inputFormat,
    this.maxLength,
    this.isReadOnly,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool read = false;
  bool isVisible = false;

  void _handleTapInputOutside(PointerDownEvent e) {
    // widget.options.onTextFieldTap!();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isReadOnly != null && widget.isReadOnly != false) {
      setState(() {
        read = true;
      });
    }
    if (widget.isReadOnly == false) {
      setState(() {
        read = false;
      });
    }
    if (widget.isPassword == true) {}
    return Container(
      // height: widget.height ?? null,
      child: TextField(
        readOnly: read,
        // onTapOutside: (e) {
        //   FocusManager.instance.primaryFocus?.unfocus();
        // },
        controller: widget.controller,
        obscureText: isVisible,
        // onChanged: (value) {
        //   setState(() {
        //     widget.controller.text = value;
        //   });
        // },
        maxLength: widget.maxLength,
        keyboardType: widget.inputType,
        inputFormatters: widget.inputFormat,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: read ? Colors.transparent : Colors.black12),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: read
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          prefixIcon: widget.prefix,
          suffixIcon: widget.isPassword == true
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: isVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                )
              : widget.suffix,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.black26),
          filled: true,
          fillColor: read ? Colors.grey.shade200 : Colors.white,
        ),
      ),
    );
  }
}
