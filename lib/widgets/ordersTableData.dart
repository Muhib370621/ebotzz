import 'package:flutter/material.dart';

class OrdersTableData extends StatelessWidget {
  final String label;
  final String data;
  const OrdersTableData({Key? key, required this.label, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label,style: TextStyle(fontSize: 20,color: Colors.grey),),
        Text(data,style: TextStyle(fontSize: 20,color: Colors.grey),)

      ],
    );
  }
}
