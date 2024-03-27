import 'package:flutter/material.dart';

class CustomButtomPlusOrMinus extends StatelessWidget {
  CustomButtomPlusOrMinus(
      {super.key,
      required this.color,
      required this.icon,
      required this.function});
  final Color color;
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            function();
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
