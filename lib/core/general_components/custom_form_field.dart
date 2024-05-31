
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


typedef MyValidator = String? Function(String?);
typedef OnChange = void Function(String?);
typedef OnTap = void Function();

class CustomFormField extends StatelessWidget {
 final String hintText;
 final MyValidator validator;
 final OnChange? onChange;
 final bool focus;
 final OnTap? onTab;
 final TextEditingController controller;
 final TextInputType keyboardType;
 final IconButton? suffix;
 final Widget? prefix;
 final bool isPassword;
 final FocusNode? passwordFocusNode;
  const CustomFormField(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller,
      this.prefix,
      this.keyboardType = TextInputType.text,
      this.suffix,
      this.isPassword = false,
      this.passwordFocusNode,
        this.onChange,
        this.onTab,
        this.focus = false
      });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: focus,
      controller: controller,
      onTap: onTab,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword,
      focusNode: passwordFocusNode,
      onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xffD6D6D6)
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
          ),

        )
    );
  }
}
