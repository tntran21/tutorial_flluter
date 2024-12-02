import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final ButtonStyles buttonStyles;
  // add props onPressed and title
  const MyButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.buttonStyles = const ButtonStyles()});

  @override
  State<MyButton> createState() => _MyButtonWidgetState();
}

class _MyButtonWidgetState extends State<MyButton> {
  void _clickEvent() {
    // Add your onPressed event here
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: widget.buttonStyles.toButtonStyle(),
      onPressed: _clickEvent,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(widget.title,
            style:
                TextStyle(fontSize: 16, color: widget.buttonStyles.textColor)),
      ),
    );
  }
}

class ButtonStyles {
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final EdgeInsetsGeometry padding;

  const ButtonStyles({
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.width = 200,
    this.height = 50,
    this.borderRadius = 10,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.padding = const EdgeInsets.all(10),
  });

  ButtonStyle toButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: padding,
      textStyle: TextStyle(
        fontSize: fontSize,
        color: textColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: borderColor, width: borderWidth),
      ),
    );
  }
}
