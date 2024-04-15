import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokercat/constant.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final double? fontsize;
  final Gradient gradient;
  final bool isButtonSelected;
  final bool isButtonEnabled;
  final String selectedButtonLabel;
  final VoidCallback? onPressed;

  const MyElevatedButton({
    Key? key,
    required this.selectedButtonLabel,
    required this.onPressed,
    required this.isButtonSelected,
    this.isButtonEnabled = true,
    this.borderRadius,
    this.width,
    this.height,
    this.fontsize,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(12);

    return Padding(
      padding: const EdgeInsets.all(0.7),
      child: Container(
              width: width??43.w,
              height: height??25.h,
        decoration: BoxDecoration(
          gradient: isButtonSelected ? gradient : null,
          borderRadius: BorderRadius.circular(14),

          boxShadow: const [
            BoxShadow(
              color: AppTheme.pcShadowColor,
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),

              child: LayoutBuilder(

                builder: (context, constraints) {
                  return TextButton(

                    onPressed: onPressed,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      textStyle: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2.0,
                          );
                        }
                        return const TextStyle(

                        );
                      }),


                      backgroundColor: MaterialStateProperty.all(
                          isButtonSelected ? Colors.transparent : AppTheme.pcTransactionColor),
                      foregroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey[700];
                        }
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }
                        return Colors.white;
                      }),

                      shadowColor: MaterialStateProperty.all(Colors.transparent),

                    ),
                    child: FittedBox(
                      fit :BoxFit.scaleDown,
                      child: Text(

                        selectedButtonLabel,
                        style: TextStyle(
                          fontSize: fontsize??constraints.maxWidth/ 4,
                          fontFamily: "Quasimoda",
                          fontWeight: isButtonSelected ? FontWeight.w900 : FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
    );


  }
}