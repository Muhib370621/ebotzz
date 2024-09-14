import '../utils/imports.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.buttonWidth,
    this.buttonHeight,
    this.radius,
  }) : super(key: key);
  final String text;
  final VoidCallback? onTap;
  final double? buttonWidth, buttonHeight, radius;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: buttonWidth ?? width,
        height: buttonHeight ?? 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 20.r),
          color: blackColor,
        ),
        child: Center(
          child: Text(
            text,
            style: Get.textTheme.bodySmall!
                .copyWith(color: whiteColor, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
