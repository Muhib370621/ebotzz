import 'package:ebotzz/controllers/signUpController.dart';
import 'package:ebotzz/services/mainScreenItems.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    final ProductController productController = Get.put(ProductController());
    // final SignUpController signUpController = Get.put(SignUpController());

    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: productController.isLoading.value == true
                ? Center(child: CircularProgressIndicator(color: Colors.red,))
                :
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomInputField(controller: controller,label: "Search on ebotzz",),
                const CustomAppBar(),
                CustomInputField(controller: controller,
                  label: "search your items here",
                  suffixIcon: Icon(Icons.search),),
                const SizedBox(height: 20,),
                // ElevatedButton(onPressed: (){
                //   print(productController.totalData[0]['id']);
                // }, child: Container(height: 20,width: 90, color: Colors.black,)),
                // Text(productController.totalData.length.toString()),
                Row(
                  children: const [
                    SizedBox(width: 24,),
                    Text("Your Recenly Viewd Items", style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(

                  children: [
                    const SizedBox(width: 20,),
                    InkWell(
                      child: Container(
                        color: Colors.white,
                        width: 160,
                        height: 250,
                        // color: Colors.pink,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 130,
                                height: 140,
                                child: Image(image: NetworkImage(
                                    productController
                                        .totalData[0]["images"][0]["src"]),
                                  fit: BoxFit.cover,)),
                            Text(productController.totalData[0]["name"]
                                .toString()),
                            // Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                            Text(MainScreenItems.recentlyViewdItems[0]["type"]
                                .toString()),
                            Text(productController.totalData[0]["price"]
                                .toString() + " USD", style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(DashboardProductDetailScreen(products:
                        ProductModel(
                          id: productController.totalData[0]["id"],
                          title: productController.totalData[0]["name"],
                          description: productController
                              .totalData[0]["description"],
                          price: double.parse(
                              productController.totalData[0]["price"]),
                          quantity: 1,
                          img: productController
                              .totalData[0]["images"][0]["src"],
                        )
                        ));
                      },
                    ),
                    const SizedBox(width: 10,),
                    InkWell(
                      child: Container(color: Colors.white,
                        width: 160,
                        height: 250,
                        // color: Colors.pink,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 120,
                                height: 140,
                                child: Image.network(productController
                                    .totalData[1]["images"][0]["src"],
                                  fit: BoxFit.cover,)),
                            Text(productController.totalData[1]["name"]
                                .toString()),
                            Text(productController.totalData[1]["type"]
                                .toString()),
                            Text(productController.totalData[1]["price"]
                                .toString() + " USD", style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      onTap: () {
                        Get.to(DashboardProductDetailScreen(products:
                        ProductModel(
                          id: productController.totalData[1]["id"],
                          title: productController.totalData[1]["name"],
                          description: productController
                              .totalData[1]["description"],
                          price: double.parse(
                              productController.totalData[1]["price"]),
                          quantity: 1,
                          img: productController
                              .totalData[1]["images"][0]["src"],
                        )
                        ))
                        ;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Athletic shoes", style: TextStyle(
                      fontSize: 20.sp, fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Recommended for you",
                    style: TextStyle(color: Colors.grey),),
                ),
                const SizedBox(height: 10,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(10, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          child: Container(
                            width: 200,
                            height: 230,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(image: NetworkImage(
                                        productController
                                            .totalData[9]["images"][0]["src"]),
                                      fit: BoxFit.cover,),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                          productController.totalData[9]["name"]
                                              .toString()),
                                      Text(
                                          productController.totalData[9]["type"]
                                              .toString()),
                                      Text(productController
                                          .totalData[9]["price"].toString()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            Get.to(DashboardProductDetailScreen(products:
                            ProductModel(
                              id: productController.totalData[9]["id"],
                              title: productController.totalData[9]["name"],
                              description: productController
                                  .totalData[9]["description"],
                              price: double.parse(
                                  productController.totalData[9]["price"] +
                                      " USD"),
                              quantity: 1,
                              img: productController
                                  .totalData[9]["images"][0]["src"],
                            )
                            ));
                          },
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  color: Colors.grey.shade300,
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hot Trades", style: TextStyle(fontSize: 24.sp),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(child: Divider(
                              thickness: 2, color: Colors.black,)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.handyman)),
                            Expanded(child: Divider(
                              thickness: 2, color: Colors.black,)),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(15)),
                              child: SizedBox(
                                width: 150,
                                child: Image.network(productController
                                    .totalData[6]["images"][0]["src"]),

                              ),
                            ),
                            onTap: () {
                              Get.to(DashboardProductDetailScreen(products:
                              ProductModel(
                                id: 4,
                                title: "Apple Watch",
                                description: "This is blaah blaaah blaaah",
                                price: 250.0,
                                quantity: 1,
                                img: "assets/images/img.png",
                              )
                              ));
                            },
                          ),
                        );
                      }),
                ),

                SizedBox(height: 30.h,),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Daily Deals", style: TextStyle(fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),)),
                SizedBox(height: 10.h,),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(10, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 200,
                          height: 230,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(image: NetworkImage(
                                        "https://images.unsplash.com/photo-1606041011872-596597976b25?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXBwbGUlMjBpcGhvbmV8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                                      fit: BoxFit.cover,),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Iphone 14"),
                                      Text("blac/blue"),
                                      Text("2000 usd"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            onTap: () {
                              Get.to(DashboardProductDetailScreen(products:
                              ProductModel(
                                id: 4,
                                title: "Iphone",
                                description: "This is blaah blaaah blaaah",
                                price: 250.0,
                                quantity: 1,
                                img: "assets/images/iphone.jpg",
                              )

                              ));
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),


                SizedBox(height: 40.h,),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text("Explore Now", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.black),),
                ),
                SizedBox(height: 20.h,),
                Column(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Container(
                        width: 500,
                        height: 200,
                        decoration: BoxDecoration(
                          color: index % 2 == 0 ? Colors.orange : index % 3 == 0
                              ? Colors.purple
                              : Colors.red,
                        ),
                        child: Column(
                          children: [
                            Text("Electronics", style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),),
                            Text("Trade or Buy Electronics",
                              style: TextStyle(color: Colors.white),),
                            SizedBox(height: 20,),
                            Container(
                              width: 200,
                              height: 100,
                              child: Image(image: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/previews/014/033/452/original/wireless-headphones-front-view-white-icon-on-a-transparent-background-3d-rendering-png.png"))
                              ,)
                          ],
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(height: 50.h,),
                Column(
                  children: [
                    Text("Need help? Contact us "),
                    SizedBox(height: 300.h,
                      width: 500.h,
                      child: Image.asset("assets/images/us.png"),),

                    Container(
                      width: 400.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          CustomInputField(
                            controller: controller2, label: "First name",),
                          CustomInputField(
                            controller: controller3, label: "Last name",),
                          CustomInputField(
                            controller: controller4, label: "Email aAddress",),
                          CustomInputField(
                            controller: controller4, label: "Your Message",),
                          CustomActionButton(
                            buttonText: "Submit", isIcon: false, onTap: () {
                            Get.snackbar(
                                "Successfully", "Successfully Submitted",
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ));
                          }, isLoading: false,)

                        ],
                      ),

                    )
                  ],
                )


              ],
            ),
          ),
        );
      }),
    );
  }
}
