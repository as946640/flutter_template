import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final onPressed;

  final onLongPress;

  final String text;

  final icon;

  final shadowColor;

  final double elevation;

  final String shape;

  final borderColor;

  final Color? bgc;

  final bool disabled;

  const Button({
    Key? key,
    required this.onPressed,
    required this.text,
    this.onLongPress,
    this.icon,
    this.shadowColor,
    this.borderColor,
    this.elevation = 0.0,
    this.shape = 'square',
    this.bgc,
    this.disabled = false,
  }) : super(key: key);

  Widget _buildChild() {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(
            width: 4,
          ),
          Flexible(
            child: Text(text),
          )
        ],
      );
    } else {
      return Text(text);
    }
  }

  _backgroundColor() {
    if (bgc != null) {
      return MaterialStateProperty.all(bgc);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        onLongPress: onLongPress ?? null,
        child: _buildChild(),
        style: ButtonStyle(
          backgroundColor: _backgroundColor(),
          shadowColor: MaterialStateProperty.all(shadowColor),
          elevation: MaterialStateProperty.all(elevation),
          side: borderColor != null
              ? MaterialStateProperty.all(
                  BorderSide(
                    width: 1,
                    color: borderColor,
                  ),
                )
              : null,
          shape: shape == 'circle'
              ? MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
