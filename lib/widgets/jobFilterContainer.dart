import 'package:ebotzz/utils/imports.dart';

class JobFilterContainer extends StatelessWidget {
  final String label;
  const JobFilterContainer({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height:45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey
        )
      ),
      child: Center(
        child: Text(label),
      ),
    );
  }
}
