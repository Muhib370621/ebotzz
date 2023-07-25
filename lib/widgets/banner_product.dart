// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:ebotzz/utils/imports.dart';

class bannerProduct extends StatelessWidget {
  bannerProduct(
      {required this.img, required this.name, required this.noofproducts});
  String img;
  String name = "Product Name";
  int noofproducts = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: assetImage(img, fit: BoxFit.fill),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monsterrat'),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${noofproducts.toString()}  Products',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monsterrat'),
                ),
              ),
              InkWell(
                onTap: () {
                  //Get.toNamed('/productDetails');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('View More')),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
