import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokercat/constant.dart';


import 'reusable_text.dart';
Random random = Random();
double size = 30.0;
int randomNumber = 0;
int diceRandomNumber = 1;

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final String? titleStr;
  final bool centerTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final bool automaticallyImplyLeading;

  const Appbar({
    Key? key,
    this.title,
    this.titleStr,
    this.actions,
    this.centerTitle = true,
    this.leading,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor??AppTheme.pcAppBarColor,
      // elevation: 20.0,
      automaticallyImplyLeading:automaticallyImplyLeading,
      leadingWidth:28,
      leading: leading,
      centerTitle: centerTitle,
      title: title ??
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x7f000000),
                  offset: Offset(0, 0),
                  blurRadius: 24,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: ReusableText(
              text: '$titleStr',
              fontSize: 15.0.sp,
            ),
          ),

          // Text(
          //   titleStr ?? '',
          //   style: const TextStyle(fontSize: 18,fontFamily: "NotoSansKR",fontWeight: FontWeight.w500,),
          // ),
      actions: actions,


    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);//kToolbarHeight 값은 material에서 제공하는 constant 값
}
