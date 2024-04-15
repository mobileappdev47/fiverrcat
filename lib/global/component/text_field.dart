// Copyright 2021 The FlutX Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../imports.dart';


enum PcTextFieldType {emailwithouticon, email, password, name, address, mobileNumber,subject,content}
//여기서 텍스트필드 항목 추가 가능
enum PcTextFieldStyle {
  underlined,
  outlined,
}

class PcTextField extends StatefulWidget {

  final PcTextFieldType textFieldType;
  final PcTextFieldStyle textFieldStyle;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Color? labelTextColor;
  final bool? autoFocusedBorder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Color? cursorColor;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final EdgeInsetsGeometry? contentPadding;
  final bool? filled;
  final Color? fillColor;
  final bool? autoIcon;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final InputDecoration? decoration;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  late InputBorder? border;
  final bool enableHint;
  final Color? textColor;
  final String? errorText;
  final bool? textEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextStyle? labelStyle;
  final int? maxLines;

  PcTextField(
      {super.key, this.controller,
        this.onChanged,
        this.cursorColor,
        this.labelText,
        this.hintText,
        this.hintStyle,
        this.floatingLabelBehavior,
        this.contentPadding,
        this.prefixIcon,
        this.prefixIconColor,
        this.filled,
        this.fillColor,
        this.textFieldType = PcTextFieldType.name,
        this.textFieldStyle = PcTextFieldStyle.outlined,
        this.enabledBorderColor,
        this.focusedBorderColor,
        this.labelTextColor,
        this.autoFocusedBorder,
        this.autoIcon,
        this.keyboardType,
        this.onTap,
        this.decoration,
        this.enabledBorder,
        this.focusedBorder,
        this.enableHint=true,
        this.border,
        this.textColor,
        this.errorText,
        this.textEnabled,
        this.inputFormatters,
        this.suffixIcon,
        this.suffixIconColor,
        this.obscureText,
        this.labelStyle,
        this.maxLines,

});

  @override
  _PcTextFieldState createState() => _PcTextFieldState();
}

class _PcTextFieldState extends State<PcTextField> {
  late String? labelText;
  late Color? fillColor;
  late bool? filled;
  late Widget? prefixIcon;
  late Color? prefixIconColor;
  late Color? enabledBorderColor;
  late Color? focusedBorderColor;
  late Color? labelTextColor,textColor;
  late Color? cursorColor;
  late bool autoFocusedBorder;
  late bool autoIcon;
  late TextInputType? keyboardType;
  late InputBorder? enabledBorder;
  late InputBorder? focusedBorder;
  late InputBorder? border;
  late Widget? suffixIcon;
  late Color? suffixIconColor;
  late bool showPassword;
  late bool? obscureText;
  late int? maxLines;

  @override
  void initState() {
    super.initState();
    showPassword = false;
    obscureText = widget.obscureText ?? widget.textFieldType == PcTextFieldType.password ? true : false;
  }



  @override
  Widget build(BuildContext context) {
    labelText = widget.labelText;
    fillColor = widget.fillColor;
    filled = widget.filled;
    fillColor = fillColor ??
        AppTheme.pcBlue1Alpha20;
    prefixIcon = widget.prefixIcon;
    enabledBorderColor = widget.enabledBorderColor;
    focusedBorderColor = widget.focusedBorderColor;
    labelTextColor = widget.labelTextColor;
    cursorColor = widget.cursorColor;
    prefixIconColor = widget.prefixIconColor;
    autoFocusedBorder = widget.autoFocusedBorder ?? true;
    autoIcon = widget.autoIcon ?? true;
    keyboardType = widget.keyboardType;
    enabledBorder = widget.enabledBorder;
    focusedBorder = widget.focusedBorder;
    border = widget.border;
    textColor = widget.textColor ?? labelTextColor;
    suffixIcon = widget.suffixIcon;
    suffixIconColor = widget.suffixIconColor;
    maxLines = widget.maxLines;

    // buildPasswordField();
    buildTextFieldStyle();
    buildTextFieldType();

    return TextField(
      style: PcTextStyle.b1(color: textColor),
      onTap: widget.onTap,
      cursorColor: cursorColor,//
      textAlign: TextAlign.start,
      decoration: widget.decoration ??
          InputDecoration(
            prefixIcon: prefixIcon,
            alignLabelWithHint: true,
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(16),//
            fillColor: fillColor,//
            filled: filled,//
            floatingLabelBehavior: widget.floatingLabelBehavior,//
            labelStyle:
            widget.labelStyle ?? PcTextStyle.b1(color: labelTextColor),
            labelText: labelText,//
            hintText: widget.enableHint? (widget.hintText ?? labelText) : null,//
            hintStyle:  widget.hintStyle ?? widget.labelStyle ??  PcTextStyle.b1(color: labelTextColor),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            border: border,
            errorText: widget.errorText,
            enabled: widget.textEnabled ?? true,
            suffixIcon: suffixIcon,


          ),

      controller: widget.controller,//
      key: widget.key,
      keyboardType: keyboardType,
      onChanged: widget.onChanged,//
      inputFormatters: widget.inputFormatters,
      obscureText: obscureText ?? false,
      maxLines: maxLines,
    );
  }

  void buildTextFieldStyle() {
    switch (widget.textFieldStyle) {

      case PcTextFieldStyle.outlined:
        filled = filled ?? false;
        fillColor = fillColor ??
            AppTheme.pcBlue1Alpha20;//
        enabledBorder = enabledBorder ??
            OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                  Radius.circular(8)),
              borderSide: BorderSide(
                color: autoFocusedBorder ? Colors.transparent :  enabledBorderColor ??
                    AppTheme.pcBlue1
              ),
            );
      case PcTextFieldStyle.underlined:
        filled = filled ?? false;
        fillColor = fillColor ??
            AppTheme.pcBlue1Alpha20;//
        enabledBorder = enabledBorder ??
            OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                  Radius.circular(8)),
              borderSide: BorderSide(
                  color: autoFocusedBorder ? Colors.transparent :  enabledBorderColor ??
                      AppTheme.pcBlue1
              ),
            );

        focusedBorder = focusedBorder ??
            OutlineInputBorder(
              borderRadius:
              const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: focusedBorderColor ??
                    AppTheme.pcBlue1,
              ),
            );
        border = enabledBorder;
        break;
    }
  }

  void buildTextFieldType() {
    if (labelText == null) {
      switch (widget.textFieldType) {
        case PcTextFieldType.emailwithouticon:
          labelText = "Email";
          keyboardType = keyboardType ?? TextInputType.emailAddress;
          break;
        case PcTextFieldType.email:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                Icons.email_outlined,
                color: prefixIconColor,
              )
                  : null);
          labelText = "Email";
          keyboardType = keyboardType ?? TextInputType.emailAddress;
          break;
        case PcTextFieldType.password:
          maxLines = 1;
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                Icons.lock_outline,
                color: prefixIconColor,
              )
                  : null);
          labelText = "Password";
          keyboardType = keyboardType ?? TextInputType.text;
          obscureText = obscureText ?? true;
          break;
        case PcTextFieldType.name:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                Icons.person_outline,
                color: prefixIconColor,
              )
                  : null);
          labelText = "Name";
          keyboardType = keyboardType ?? TextInputType.text;
          break;
        case PcTextFieldType.address:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                Icons.location_on_outlined,
                color: prefixIconColor,
              )
                  : null);
          labelText = "Address";
          keyboardType = keyboardType ?? TextInputType.streetAddress;
          break;
        case PcTextFieldType.mobileNumber:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                Icons.phone_outlined,
                color: prefixIconColor,
              )
                  : null);
          labelText = "Mobile Number";
          keyboardType = keyboardType ?? TextInputType.phone;
          break;
        case PcTextFieldType.subject:
          labelText = "Subject";
          keyboardType = keyboardType ?? TextInputType.text;
          break;

          case PcTextFieldType.content:
          labelText = "Content";
          keyboardType = keyboardType ?? TextInputType.text;
          break;

        default:
          labelText = "Label";
          break;
      }
    }
  }
  void buildPasswordField() {
    if (widget.textFieldType == PcTextFieldType.password) {
      suffixIcon = autoIcon? InkWell(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
              obscureText = !obscureText!;
            });
          },
          child: (showPassword
              ? Icon(Icons.visibility_outlined, color: widget.suffixIconColor)
              : Icon(Icons.visibility_off_outlined, color: widget.suffixIconColor))) : widget.suffixIcon;
    }
  }
}
