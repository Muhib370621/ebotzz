import 'package:ebotzz/utils/imports.dart';

class DashboardHeading extends StatelessWidget {
  final IconData icon;
  final label;
  const DashboardHeading({Key? key, required this.icon,required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 60.h,
      // width: 400,
      color: Colors.black,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(
              icon,
              size: 24.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
