// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:ebotzz/utils/imports.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.r,
                      blurRadius: 2.r,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(Icons.menu)),
                    SizedBox(width: 10.w),
                    Container(
                      width: width * 0.7.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25.sp,
                    ),
                    SizedBox(
                      width: width * 0.05.w,
                    ),
                  ],
                ),
              ),
              customHeading(heading: 'Search Results'),
              Container(
                height: height - 80.h,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Product(
                          img: 'assets/images/Boxes_Mockup.png',
                          name: 'Product',
                          status: '\$20');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
