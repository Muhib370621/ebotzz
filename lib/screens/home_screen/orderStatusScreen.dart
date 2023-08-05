import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

import 'orderStatusByIdScreen.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Status"),
        backgroundColor: Colors.black45,
      ),
      body: Obx(()=>Column(
        children: [

          SizedBox(height: 20.h,),
          CustomInputField(controller:controller ,label: "search item"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(child: CustomActionButton(buttonText: 'Delete',isLoading: false,isIcon: false,onTap: (){
                  productController.deleteOrderByIdResponse(controller.text);
                  productController.getOrderByIdResponse(controller.text);
                  if(productController.getOrderById["status"]=="trash"){
                    Get.snackbar("Successfully", "Deleted item Successfully!",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ));
                  }else{
                    Get.snackbar("Successfully", "Invalid Id !",
                        colorText: Colors.white,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                        ));

                  }

                },)),
                SizedBox(width: 10.w,),
                Expanded(child: CustomActionButton(buttonText: 'Search',isLoading: false,isIcon: false,onTap: (){
                  productController.getOrderByIdResponse(controller.text);
                  Get.to(OrderStatusByIdScreen());

                },)),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),

          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: productController.totalOrderStatusData.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 75.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              15,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Order ID",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text(productController
                                    .totalOrderStatusData[index]["id"]
                                    .toString()),
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
                                Text(productController
                                    .totalOrderStatusData[index]["status"]
                                    .toString()),
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
                                Text(productController
                                    .totalOrderStatusData[index]["date_created"]
                                    .toString().substring(0,10)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),)
    );
  }
}
