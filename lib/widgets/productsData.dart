import 'package:ebotzz/utils/imports.dart';

class ProductsData extends StatelessWidget {
 final String title;
  final String amount;
  const ProductsData({Key? key, required this.title, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color: Colors.grey,fontSize: 20.sp),),
          Text(amount,style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
