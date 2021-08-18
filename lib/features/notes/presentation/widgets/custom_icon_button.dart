import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.color,
  }) : super(key: key);

  
  final IconData icon;
  final onPressed;
  final tooltip;
  final color;
  final padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      onPressed: onPressed,
      color: color,
      padding:  EdgeInsets.only(top: padding),
      alignment: Alignment.topCenter,
    );
  }
}
