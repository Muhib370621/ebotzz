import 'package:ebotzz/controllers/signUpController.dart';
import 'package:ebotzz/services/mainScreenItems.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final SignUpController signUpController = Get.put(SignUpController());
    final ProductController productController = Get.put(ProductController());

    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    TextEditingController controller4 = TextEditingController();
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: productController.isLoading.value == true
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.red,
                  ))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomInputField(controller: controller,label: "Search on ebotzz",),
                      const CustomAppBar(),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomInputField(
                              controller: controller,
                              label: "search your items here",
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade800),
                                borderRadius: BorderRadius.circular(15)),
                            child: InkWell(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "Categories",
                                    content: SizedBox(
                                      height: 480.h,
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: productController
                                            .totalCategoryData.length,
                                        itemBuilder: (context, index) {
                                          return SingleChildScrollView(
                                            physics: BouncingScrollPhysics(),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  height: 45.h,
                                                  width: 290.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                        15,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(productController
                                                          .totalCategoryData[
                                                      index]["name"]),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: const Center(
                                  child: Text("Categories"),
                                )),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 24,
                          ),
                          Text(
                            "Your Recenly Viewd Items",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            child: Container(
                              color: Colors.white,
                              width: 160,
                              height: 250,
                              // color: Colors.pink,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 130,
                                      height: 140,
                                      child: Image(
                                        image: NetworkImage(productController
                                            .totalData[0]["images"][0]["src"]),
                                        fit: BoxFit.cover,
                                      )),
                                  Text(productController.totalData[0]["name"]
                                      .toString()),
                                  // Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                                  Text(MainScreenItems.recentlyViewdItems[0]
                                          ["type"]
                                      .toString()),
                                  Text(
                                    "${productController.totalData[0]["price"]} USD",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.to(DashboardProductDetailScreen(
                                  products: ProductModel(
                                id: productController.totalData[0]["id"],
                                title: productController.totalData[0]["name"],
                                description: productController.totalData[0]
                                    ["description"],
                                price: double.parse(
                                    productController.totalData[0]["price"]),
                                quantity: 1,
                                img: productController.totalData[0]["images"][0]
                                    ["src"],
                              )));
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.white,
                            width: 160,
                            height: 250,
                            // color: Colors.pink,
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 120,
                                      height: 140,
                                      child: Image.network(
                                        productController.totalData[1]["images"]
                                            [0]["src"],
                                        fit: BoxFit.cover,
                                      )),
                                  Text(productController.totalData[1]["name"]
                                      .toString()),
                                  Text(productController.totalData[1]["type"]
                                      .toString()),
                                  Text(
                                    productController.totalData[1]["price"]
                                            .toString() +
                                        " USD",
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              onTap: () {

                                Get.to(DashboardProductDetailScreen(
                                    products: ProductModel(
                                      id: productController.totalData[1]["id"],
                                      title: productController.totalData[1]["name"],
                                      description: productController.totalData[0]
                                      ["description"],
                                      price:
                                      double.parse(productController.totalData[1]["price"]),
                                      quantity: 1,
                                      img: productController.totalData[1]["images"]
                                      [0]["src"],
                                    )));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Hot Deals",
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Recommended for you",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(10, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                child: Container(
                                  width: 200,
                                  height: 290,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image(
                                            image: NetworkImage(
                                                productController
                                                        .totalData[3]
                                                    ["images"][0]["src"]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productController
                                                  .totalData[index + 2]["name"]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                productController
                                                    .totalData[index + 2]
                                                        ["type"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.grey.shade800,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "price : ${productController.totalData[index + 2]["price"]}" +
                                                    " USD ",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: Colors.grey.shade800,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Get.to(DashboardProductDetailScreen(
                                      products: ProductModel(
                                    id: productController.totalData[index + 2]
                                        ["id"],
                                    title: productController
                                        .totalData[index + 2]["name"],
                                    description: productController
                                        .totalData[index + 2]["description"],
                                    price: double.parse(productController
                                        .totalData[index + 2]["price"]),
                                    quantity: 1,
                                    img: productController.totalData[index + 2]
                                        ["images"][0]["src"],
                                  )));
                                },
                              ),
                            );
                          }),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        color: Colors.grey.shade300,
                        height: 170,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hot Trades",
                              style: TextStyle(fontSize: 24.sp),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.handyman)),
                                  Expanded(
                                      child: Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 10),
                            itemCount: 10,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: SizedBox(
                                      width: 150,
                                      child: Image.network(productController
                                              .totalData[index+37]["images"]
                                          [0]["src"]),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(DashboardProductDetailScreen(
                                        products: ProductModel(
                                      id: productController
                                          .totalData[index + 37]["id"],
                                      title: productController
                                          .totalData[index + 37]["type"],
                                      description: productController
                                          .totalData[index + 37]["name"],
                                      price: double.parse(productController
                                          .totalData[index + 37]["price"]),
                                      quantity: 1,
                                      img: productController
                                              .totalData[index + 37]["images"]
                                          [0]["src"],
                                    )));
                                  },
                                ),
                              );
                            }),
                      ),

                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Daily Deals",
                            style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(10, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: InkWell(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 200,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image.network(
                                              productController.totalData[index+40]
                                                  ["images"][0]["src"]),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              productController
                                                  .totalData[index + 40]["name"]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                productController
                                                    .totalData[index + 40]
                                                        ["type"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.grey.shade800,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "price : ${productController.totalData[index + 40]["price"]}" +
                                                    " USD ",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: Colors.grey.shade800,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    print(index);
                                    Get.to(DashboardProductDetailScreen(
                                        products: ProductModel(
                                      id: productController
                                          .totalData[index + 40]["id"],
                                      title: productController
                                          .totalData[index + 40]["name"],
                                      description: productController
                                          .totalData[index + 40]["description"],
                                      price: double.parse(productController
                                          .totalData[index + 40]["price"]),
                                      quantity: 1,
                                      img: productController
                                              .totalData[index + 40]["images"]
                                          [0]["src"],
                                    )));
                                  },
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "Explore Now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        children: List.generate(4, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Container(
                              width: 500,
                              height: 200,
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Colors.orange
                                    : index % 3 == 0
                                        ? Colors.purple
                                        : Colors.red,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Electronics",
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Trade or Buy Electronics",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 200,
                                    height: 100,
                                    child: Image(
                                        image: NetworkImage(
                                            "https://static.vecteezy.com/system/resources/previews/014/033/452/original/wireless-headphones-front-view-white-icon-on-a-transparent-background-3d-rendering-png.png")),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),

                      SizedBox(
                        height: 50.h,
                      ),
                      Column(
                        children: [
                          Text("Need help? Contact us "),
                          SizedBox(
                            height: 300.h,
                            width: 500.h,
                            child: Image.asset("assets/images/us.png"),
                          ),
                          Container(
                            width: 400.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                CustomInputField(
                                  controller: controller2,
                                  label: "First name",
                                ),
                                CustomInputField(
                                  controller: controller3,
                                  label: "Last name",
                                ),
                                CustomInputField(
                                  controller: controller4,
                                  label: "Email aAddress",
                                ),
                                CustomInputField(
                                  controller: controller4,
                                  label: "Your Message",
                                ),
                                CustomActionButton(
                                  buttonText: "Submit",
                                  isIcon: false,
                                  onTap: () {
                                    Get.snackbar("Successfully",
                                        "Successfully Submitted",
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        icon: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ));
                                  },
                                  isLoading: false,
                                )
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
