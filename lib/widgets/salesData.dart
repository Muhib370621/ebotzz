import 'package:ebotzz/utils/imports.dart';

class SalesData extends StatelessWidget {

  final String title;
  var amount;
  double textSize;
  SalesData({Key? key, required this.title,required this.amount,this.textSize=24.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(child: Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:textSize),),
        SizedBox(height: 10.h,),
        Text(amount.toString(),style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:textSize))
      ],
    ),);
  }
}
