// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/trade_column.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/electronic-cat2.jpg',
      'assets/images/Boxes_Mockup.png',
      'assets/images/cover.png',
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                elevation: 10,
                margin: EdgeInsets.only(bottom: 10),
                shadowColor: Colors.grey,
                child: Column(
                  children: [
                    Image.asset("assets/images/car.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TradeColumn(
                          image: "assets/images/trade.svg",
                          name: "Trade",
                        ),
                        TradeColumn(
                          image: "assets/images/bid.svg",
                          name: "Bid",
                        ),
                        TradeColumn(
                          image: "assets/images/eye.svg",
                          name: "Watch",
                        ),
                        TradeColumn(
                          image: "assets/images/buy.svg",
                          name: "Buy",
                        ),
                        TradeColumn(
                          image: "assets/images/heart.svg",
                          name: "Add",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 9,
                    vertical: MediaQuery.of(context).size.height / 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PRODUCT OFFERED",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2018 Porshe 911 GT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$115,000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Text(
                      "Traded Product",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sea Ray 22'",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$85,000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Payout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$30,000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            "PRODUCT INFO",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            "PRODUCT TRADE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // CustomCarosal(imgList: imgList),
              // customHeading(heading: 'Latest Auctions'),
              // OrientationBuilder(
              //   builder: (BuildContext context, Orientation orientation) {
              //     return GridView.count(
              //         padding: EdgeInsets.symmetric(horizontal: 10.w),
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              //         mainAxisSpacing: 5,
              //         crossAxisSpacing: 5,
              //         children: <Widget>[
              //           Product(
              //             img: "assets/images/Boxes_Mockup.png",
              //             name: "Product Name",
              //             status: "Aution Ended",
              //           ),
              //           Product(
              //             img: "assets/images/Boxes_Mockup.png",
              //             name: "Product Name",
              //             status: "Aution Ended",
              //           ),
              //           Product(
              //             img: "assets/images/Boxes_Mockup.png",
              //             name: "Product Name",
              //             status: "Aution Ended",
              //           ),
              //           Product(
              //             img: "assets/images/Boxes_Mockup.png",
              //             name: "Product Name",
              //             status: "Aution Endesd",
              //           )
              //         ]);
              //   },
              // ),
              // customHeading(heading: 'Featured Products'),
              // ListView(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   children: [
              //     bannerProduct(
              //       name: 'Headphones',
              //       noofproducts: 20,
              //       img: 'assets/images/masonry-banner111-1-1024x466.jpg',
              //     ),
              //     bannerProduct(
              //         name: 'Chargers',
              //         noofproducts: 12,
              //         img: 'assets/images/masonry-banner444-1-1-1024x466.jpg'),
              //     bannerProduct(
              //       name: 'Headphones',
              //       noofproducts: 20,
              //       img: 'assets/images/masonry-banner111-1-1024x466.jpg',
              //     ),
              //     bannerProduct(
              //         name: 'Chargers',
              //         noofproducts: 12,
              //         img: 'assets/images/masonry-banner444-1-1-1024x466.jpg'),
              //   ],
              // ),
              // customHeading(heading: 'Latest News'),
              // ListView(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   children: [
              //     newsCard(
              //       img: 'assets/images/Boxes_Mockup.png',
              //       title: 'Lorem Ipsum is simply ',
              //       date: '12/12/2020',
              //     ),
              //     newsCard(
              //       img: 'assets/images/Boxes_Mockup.png',
              //       title: 'Lorem Ipsum is simply ',
              //       date: '12/12/2020',
              //     ),
              //   ],
              // ),
              // Container(
              //   height: 275,
              //   width: width,
              //   decoration: BoxDecoration(
              //     color: Colors.grey[300],
              //   ),
              //   child: Column(
              //     children: [
              //       customHeading(heading: 'Shop by Brand'),
              //       GridView.count(
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         scrollDirection: Axis.vertical,
              //         childAspectRatio: 2,
              //         crossAxisCount: 2,
              //         mainAxisSpacing: 5,
              //         crossAxisSpacing: 5,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child: InkWell(
              //                 child: assetImage(
              //               'assets/images/client2-s2-2-300x90.png',
              //               height: 50,
              //               width: 50,
              //             )),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child: InkWell(
              //                 child: assetImage(
              //               'assets/images/client2-s2-1-300x90.png',
              //               height: 50,
              //               width: 50,
              //             )),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child: InkWell(
              //                 child: assetImage(
              //               'assets/images/client2-s2-2-300x90.png',
              //               height: 50,
              //               width: 50,
              //             )),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child: InkWell(
              //                 child: assetImage(
              //               'assets/images/client2-s2-1-300x90.png',
              //               height: 50,
              //               width: 50,
              //             )),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
