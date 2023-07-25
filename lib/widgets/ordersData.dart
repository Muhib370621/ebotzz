import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class OrdersData extends StatelessWidget {
  var dataMap;
   OrdersData({Key? key,required this.dataMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Total"),
                  Divider(),
                  Text("Total"),
                  Divider(),
                  Text("Total"),
                  Divider(),
                  Text("Total"),
                  Divider(),
                  Text("Total"),
                  Divider(),
                  Text("Total"),
                  Divider(),
                  Text("Total"),
                ],
              ),
              Column(
                children: const [
                  Text("16"),
                  Divider(),
                  Text("1"),
                  Divider(),
                  Text("16"),
                  Divider(),
                  Text("0"),
                  Divider(),
                  Text("12"),
                  Divider(),
                  Text("2"),
                  Divider(),
                  Text("0"),
                ],
              ),
            ],
          ),
        ),

        Expanded(
          child: PieChart(
            // chartRadius: 200,
            dataMap: dataMap,
            legendOptions: LegendOptions(
                showLegends: false
            ),
            chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true),
          ),
        )
      ],
    )
    ;
  }
}
