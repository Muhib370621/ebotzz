import 'package:ebotzz/services/mainScreenItems.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CustomInputField(controller: controller,label: "Search on ebotzz",),
              const CustomAppBar(),

              CustomInputField(controller: controller,label: "search your items here",suffixIcon: Icon(Icons.search),),
              const SizedBox(height: 20,),
              Row(
                children: const [
                  SizedBox(width: 24,),
                  Text("Your Recenly Viewd Items",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),

                ],
              ),
              const SizedBox(height: 10,),
              Row(

                children: [
                  const SizedBox(width: 20,),
                  Container(
                    color: Colors.white,
                    width: 160,
                    height: 250,
                    // color: Colors.pink,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 130,height: 140,child:Image(image: NetworkImage(MainScreenItems.recentlyViewdItems[0]["image"]!),fit: BoxFit.cover,)  ),
                        Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                        Text(MainScreenItems.recentlyViewdItems[0]["color"].toString()),
                        Text(MainScreenItems.recentlyViewdItems[0]["price"].toString(),style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(color: Colors.white,
                    width: 160,
                    height: 250,
                    // color: Colors.pink,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 120,height: 140,child:Image(image: NetworkImage(MainScreenItems.recentlyViewdItems[1]["image"]!),fit: BoxFit.cover,) ),
                        Text(MainScreenItems.recentlyViewdItems[1]["name"].toString()),
                        Text(MainScreenItems.recentlyViewdItems[1]["color"].toString()),
                        Text(MainScreenItems.recentlyViewdItems[1]["price"].toString(),style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Athletic shoes",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Recommended for you",style: TextStyle(color: Colors.grey),),
              ),
              const SizedBox(height: 10,),

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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        SizedBox(
                          height:150,
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjFDhQOorpTVrB-yDLq10ccJw1AEx1FhZgsQ&usqp=CAU"),fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(MainScreenItems.recentlyViewdItems[0]["name"].toString()),
                              Text(MainScreenItems.recentlyViewdItems[0]["color"].toString()),
                              Text(MainScreenItems.recentlyViewdItems[0]["price"].toString()),
                            ],
                          ),
                        )
                          ],
                        ),
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
                    Text("Hot Trades",style: TextStyle(fontSize: 24.sp),),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(child: Divider(thickness: 2,color: Colors.black,)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.handyman)),
                          Expanded(child: Divider(thickness: 2,color: Colors.black,)),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),



              Column(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      width: 500,
                      height: 200,
                      decoration: BoxDecoration(
                          color: index%2==0?Colors.orange:index%3==0?Colors.purple:Colors.red,
                      ),
                      child: Column(
                        children: [
                          Text("Electronics",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                          Text("Trade or Buy Electronics",style: TextStyle(color: Colors.white),),
                          SizedBox(height: 20,),
                          Container(
                            width: 200,
                            height: 100,
                            child: Image(image: NetworkImage("https://static.vecteezy.com/system/resources/previews/014/033/452/original/wireless-headphones-front-view-white-icon-on-a-transparent-background-3d-rendering-png.png"))
                            ,)
                        ],
                      ),
                    ),
                  );
                }),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
