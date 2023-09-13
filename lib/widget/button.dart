import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback buttonTapped;

   const MyButton({Key? key,
    required this.color,
    required this.textColor,
    required this.text,
    required this.buttonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(
              child: Text(text,
              style: TextStyle(color: textColor,fontSize: 25,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
