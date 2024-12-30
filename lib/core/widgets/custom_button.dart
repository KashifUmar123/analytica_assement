import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.callback,
    this.width = double.infinity,
    this.textStyle,
    this.backgroundColor,
    this.height,
  });

  final String text;
  final VoidCallback callback;
  final double width;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor ?? Colors.blueAccent,
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
