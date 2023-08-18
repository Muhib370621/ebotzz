import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/dashboardHeading.dart';
import 'package:ebotzz/widgets/productsData.dart';
// import 'package:ebotzz/widgets/ordersData.dart';
import 'package:ebotzz/widgets/salesData.dart';

import '../../widgets/ordersData.dart';
import '../../widgets/vendorWidgets/vendorScreenDrawer.dart';
// import '../../widgets/vendorScreenDrawer.dart';




class VendorDashBoard extends StatelessWidget {
  var DataMap = {
    "60-70": 16.0,
    "70-80": 1.0,
    "80-90": 16.0,
    "90-100": 0.0,
    "100-110": 12.0,
    "110-120": 2.0,
  };

  VendorDashBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vendorAppBarColor,
        title: Text("Dashboard screen"),
      ),
      drawer: VendorScreenDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Overall Data",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  SalesData(title: "Net Sales", amount: "432,124"),
                  Divider(),
                  SalesData(title: "Earnings", amount: "132,532"),
                  Divider(),
                  SalesData(title: "Page View", amount: "7"),
                  Divider(),
                  SalesData(title: "Order", amount: "1"),
                  Divider(),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DashboardHeading(icon: Icons.shopping_cart_outlined, label: "Orders")
                  ),
                  SizedBox(height: 20.h,),
                  OrdersData(dataMap: DataMap,)
                ],
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    DashboardHeading(icon: Icons.switch_camera, label: "Products"),
                    SizedBox(height: 20.h,),
                    ProductsData(title: 'Total',amount:'2' ,),
                    Divider(),
                    ProductsData(title: 'Live',amount:'2' ,),
                    Divider(),
                    ProductsData(title: 'Offline',amount:'0' ,),
                    Divider(),
                    ProductsData(title: 'Pending Review',amount:'0' ,),
                    Divider(),
                  ],
                ),
              ),
              // DashboardHeading(icon: Icons.credit_card_rounded, label: "OverallSales"),
              // Container(child: CustomLineChart())
            ],
          ),
        ),
      ),
    );
  }
}
