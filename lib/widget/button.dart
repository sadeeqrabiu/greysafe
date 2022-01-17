import 'package:firebasetest/utils/colors.dart';
import 'package:flutter/material.dart';


class ButtonPrimary extends StatefulWidget {
  ButtonPrimary(
      {this.height = 50,
        this.width = 150,
        required this.text,
        required this.onTap,
        this.buttonColor,
        Key? key})
      : super(key: key);

  double? width;
  double? height;
  String text;
  Color? buttonColor;
  Function() onTap;

  @override
  _ButtonPrimaryState createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color:
          (widget.buttonColor != null) ? widget.buttonColor : colorAccent,
        ),
        child: Center(
          child: Text(
            '${widget.text}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}