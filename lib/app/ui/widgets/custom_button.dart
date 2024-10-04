import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? borderColor;
  final String text;
  final Color? textColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? iconColor;
  final bool? isLoading;
  final Color? backgroundColor;

  const CustomButton({
    required this.onPressed,
    required this.text,
    this.borderColor,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.iconColor,
    this.isLoading,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.0,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFFF6741C),
          shape: RoundedRectangleBorder(
            side: borderColor != null
                ? BorderSide(width: 1.0, color: borderColor!)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (prefixIcon != null)
                ? Container(
                    margin: EdgeInsets.only(
                      left: (prefixIcon != null) ? 12 : 0,
                    ),
                    child: Icon(
                      prefixIcon,
                      color: iconColor ?? Colors.white,
                    ),
                  )
                : Container(),
            (isLoading == true)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(
                      left: (prefixIcon != null) ? 24 : 0,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
            if (suffixIcon != null)
              Icon(
                suffixIcon,
                size: 24.0,
                color: iconColor ?? Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
