// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/core/utils/app_extension.dart';

import '../utils/imports.dart';

class CartListView extends StatefulWidget {

  CartListView(
      {Key? key, required this.counterButton, required this.cartProduct})
      : super(key: key);

  final Widget Function(ProductModel product) counterButton;
  final List<ProductModel> cartProduct;

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  ProductController controller = Get.put(ProductController());
  double totalPrice=0.0;




  calculateTotalPrice(){
    for (var i=0; i<widget.cartProduct.length;i++){
      totalPrice += (widget.cartProduct[i].price*widget.cartProduct[i].quantity);
    }
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemCount: widget.cartProduct.length,
            itemBuilder: (_, index) {
              ProductModel products = widget.cartProduct[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.04),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                  border: Border.all(
                      color: Colors.grey.withOpacity(
                        0.5,
                      ),
                      width: 1.5.w),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 0.14.sh,
                          width: 0.25.sw,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              products.img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.verticalSpace,
                                Text(products.title.addOverFlow,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold)),
                                Text("\$${products.price.toString()}")
                              ],
                            ),
                            // Text(
                            //     "\$${productController.cartScreenItems[index].title.toString()}",
                            //     style: h2Style),
                            const SizedBox(height: 10),
                            // Text("Quantity:"),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // Container(
                            //   width: 30,
                            //   height: 30,
                            //   decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.grey.shade700),
                            //       borderRadius: BorderRadius.circular(5)),
                            //   child: Center(
                            //       child: Text(productController
                            //           .cartScreenItems[index].quantity
                            //           .toString())),
                            // )
                          ],
                        ),
                        // Spacer(),
                        widget.counterButton(products)
                      ],
                    )
                        // .fadeAnimation(0.4 * index),
                  ],
                ),
              );
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.redAccent.withOpacity(0.04),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(
              //           15,
              //         ),
              //       ),
              //     ),
              //     child: Column(
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Expanded(
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(15.0),
              //                 child: Image.network(
              //                   products.img,
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(width: 5),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(products.title.addOverFlow, style: h4Style),
              //                 const SizedBox(height: 5),
              //                 // Text(
              //                 //     "\$${productController.cartScreenItems[index].title.toString()}",
              //                 //     style: h2Style),
              //                 const SizedBox(height: 10),
              //                 Text("Quantity:"),
              //                 SizedBox(
              //                   height: 5,
              //                 ),
              //                 Container(
              //                   width: 30,
              //                   height: 30,
              //                   decoration: BoxDecoration(
              //                       border:
              //                           Border.all(color: Colors.grey.shade700),
              //                       borderRadius: BorderRadius.circular(5)),
              //                   child: Center(
              //                       child: Text(productController
              //                           .cartScreenItems[index].quantity
              //                           .toString())),
              //                 )
              //               ],
              //             ),
              //             // Spacer(),
              //             // counterButton(products)
              //           ],
              //         ).fadeAnimation(0.4 * index),
              //         Divider(
              //           color: Colors.redAccent.withOpacity(0.05),
              //           height: 30.h,
              //           thickness: 2.w,
              //         ),
              //         Padding(
              //           padding: EdgeInsets.all(8),
              //           child: Column(
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text("Item"),
              //                   Text("\$${products.price.toString()}")
              //                 ],
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [Text("Shipping"), Text("\$ 0")],
              //               ),
              //               Divider(
              //                 color: Colors.redAccent.withOpacity(0.05),
              //                 height: 40.h,
              //                 thickness: 2.w,
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     "Subtotal",
              //                     style: TextStyle(fontWeight: FontWeight.w900),
              //                   ),
              //                   Text(
              //                     "\$${products.price.toString()}",
              //                     style: TextStyle(fontWeight: FontWeight.w900),
              //                   )
              //                 ],
              //               ),
              //               20.verticalSpace,
              //               Text("Order Total Calculated at Checkout"),
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(padding: EdgeInsets.only(bottom: 7, top: 7));
            },
          ),
          30.verticalSpace,
          Text("Payment Details",style: h2Style,),
          10.verticalSpace,
          Container(
            padding: EdgeInsets.all(10),
            // height: 100.h,
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(
                0.02,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  15,
                ),
              ),
              border: Border.all(
                  color: Colors.grey.withOpacity(
                    0.5,
                  ),
                  width: 1.2.w),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "\$ ${totalPrice.toString()}",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "\$ 0",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "Master Card",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payout",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$ ${totalPrice.toString()}",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Payout",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$ 0",
                      style: TextStyle(
                        fontSize: 16.sp,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
