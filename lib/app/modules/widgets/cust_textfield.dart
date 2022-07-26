import 'package:flutter/material.dart';

class CusTextField extends StatelessWidget {
  CusTextField({
    Key? key,
    this.controller,
    this.data,
    required this.hintext,
    this.isObsecure = false,
    this.TextInputType,
    this.max,
  }) : super(key: key);
  final TextEditingController? controller;
  final IconData? data;
  final String hintext;
  final bool isObsecure;
  bool enabled = true;
  final TextInputType;
  final int? max;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        maxLength: max,
        keyboardType: TextInputType,
        enabled: enabled,
        controller: controller,
        obscureText: isObsecure,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              data,
              color: Colors.cyan,
            ),
            focusColor: Theme.of(context).primaryColor,
            hintText: hintext),
      ),
    );
  }
}
