import 'package:ebotzz/utils/imports.dart';
class Pager extends StatelessWidget {
  const Pager({Key? key, required this.fillColor}) : super(key: key);
  final Color fillColor;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 8.h,
      width: 60.w,
      // width: 5.w,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
      ),
    );
  }
}