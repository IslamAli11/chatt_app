import 'package:flutter/material.dart';

class CustomTExtFormField extends StatelessWidget {
  const CustomTExtFormField(
      {super.key,
      required this.text,
      required this.prefixIcon,
      this.suffixIcon,
      this.reduis,
      this.obscure,
      this.onTap,
      this.validator,
      required this.validatorTExt});
  final String text;
  final String validatorTExt;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final double? reduis;
  final bool? obscure;
  final Function()? onTap;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      validator: (value) {
        if (value!.isEmpty) {
          return '$validatorTExt must n\'t be empty';
        } else {
          return null;
        }
      },
      obscureText: obscure ?? false,
      decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(prefixIcon),
          suffixIcon:suffixIcon??const SizedBox(),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(reduis??15),
            borderSide: const BorderSide(color: Colors.blue)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(reduis ?? 15),
              borderSide: const BorderSide(color: Colors.blue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(reduis ?? 15),
              borderSide: const BorderSide(color: Colors.blue)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(reduis ?? 15),
              borderSide: const BorderSide(color: Colors.red))),
    );
  }
}
