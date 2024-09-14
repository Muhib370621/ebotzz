import 'package:ebotzz/utils/imports.dart';

class OrderStatusByIdScreen extends StatelessWidget {
  const OrderStatusByIdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return Scaffold(appBar: AppBar(backgroundColor: Colors.black45,),
    body: Center(
      child: Container(
        width: double.infinity,
        height: 300.w,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Order ID",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(
                        productController.getOrderById["id"].toString()
                      )

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Status",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          productController.getOrderById["status"].toString()
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Created",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        productController.getOrderById["date_created"].toString()

                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Shipping tax",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(
                          productController.getOrderById["shipping_tax"].toString()
                      )

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prices include tax",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          productController.getOrderById["prices_include_tax"].toString()
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total tax",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          productController.getOrderById["total_tax"].toString()

                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ));
  }
}
