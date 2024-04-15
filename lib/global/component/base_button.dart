import 'package:flutter/material.dart';

const double defaultBorderRadius = 3.0;

class StretchableButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double borderRadius;
  final double? buttonPadding;
  final Color? buttonColor, splashColor;
  final Color? buttonBorderColor;
  final List<Widget> children;
  final bool centered;

  const StretchableButton({super.key, 
    required this.buttonColor,
    required this.borderRadius,
    required this.children,
    this.splashColor,
    this.buttonBorderColor,
    this.onPressed,
    this.buttonPadding,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var contents = List<Widget>.from(children);

        if (constraints.minWidth == 0) {
          contents.add(const SizedBox.shrink());
        } else {
          if (centered) {
            contents.insert(0, const Spacer());
          }
          contents.add(const Spacer());
        }

        BorderSide bs;
        if (buttonBorderColor != null) {
          bs = BorderSide(
            color: buttonBorderColor!,
          );
        } else {
          bs = BorderSide.none;
        }

        return ButtonTheme(

          padding: EdgeInsets.all(buttonPadding??0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: bs,
          ),
          child: Container(

            child: TextButton(
              onPressed: onPressed,
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => buttonColor)),
              // color: buttonColor,
              // splashColor: splashColor,
              // 일시적 비활성화
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: contents,
              ),
            ),
          ),
        );
      },
    );
  }
}