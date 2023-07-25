// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ebotzz/utils/imports.dart';

// ignore: must_be_immutable
class Product extends StatelessWidget {
  String img = "assets/images/Boxes_Mockup.png";
  String name = "Product Name";
  String status = "Aution Ended";
  Product({required this.img, required this.name, required this.status});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 1.r,
              spreadRadius: 1.r,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 5.h,
            right: 10.w,
            left: 15.w,
            bottom: 10.h,
          ),
          child: Column(
            children: [
              Image.asset(
                img.toString(),
                height: 70.h,
                width: 120.w,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                name.toString(),
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monsterrat'),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                status.toString(),
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Monsterrat'),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 15.r,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 30.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Monsterrat',
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
