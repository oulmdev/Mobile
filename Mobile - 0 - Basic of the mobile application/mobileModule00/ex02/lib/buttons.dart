import 'package:flutter/material.dart';

class ButtonsGenerator extends StatefulWidget {
  final Color buttonColor;
  final Color splashColor;
  final Color textColor;
  final String buttonText;
  final double fontSize;
  final VoidCallback onPressed;

  const ButtonsGenerator({
    Key? key,
    required this.buttonColor,
    required this.splashColor,
    required this.buttonText,
    required this.fontSize,
    required this.onPressed,
    required this.textColor,
  }) : super(key: key);

  @override
  State<ButtonsGenerator> createState() => _ButtonsGeneratorState();
}

class _ButtonsGeneratorState extends State<ButtonsGenerator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.buttonText,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize,
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            backgroundColor: MaterialStateProperty.all(widget.buttonColor),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return widget.splashColor;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
