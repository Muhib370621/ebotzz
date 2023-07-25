
import 'package:flutter/material.dart';


class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    Key? key,
    required this.buttonText,
    this.onTap,
    this.isIcon,

  }) : super(key: key);
  final String buttonText;
  final void Function()? onTap;
  final bool? isIcon;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 50,
        padding: EdgeInsets.symmetric(
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(
                0.4,
              ),
              blurRadius: 5.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: const Offset(
                2.0, // Move to right 5  horizontally
                2.0, // Move to bottom 5 Vertically
              ),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: isIcon == false
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
