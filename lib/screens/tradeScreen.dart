import 'package:ebotzz/models/product.dart';
import 'package:ebotzz/screens/finializeTradeScreen.dart';
import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:flutter/material.dart';

class TradeScreen extends StatelessWidget {
  final ProductModel productOriginal;
  final ProductModel productOffered;
   TradeScreen({Key? key,required this.productOriginal,required this.productOffered}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black45,title: Text("Trading screen"),),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20.h,),
            Center(
              child: Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: Image.network(productOriginal.img),
                    ),
                    SizedBox(height: 15.h,),
                    Text(productOriginal.title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    SizedBox(height: 15.h,),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    //   child: Text(productOriginal.description.substring(0,20),style: TextStyle(fontSize: 18.sp),),
                    // ),
                    SizedBox(height: 15.h,),
                    Text(productOriginal.price.toString()+" USD ",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold)),

                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              width: 300,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.network(productOffered.img,fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 15.h,),
                  Text(productOffered.title,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                  SizedBox(height: 15.h,),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //   child: Text(productOriginal.description.substring(0,20),style: TextStyle(fontSize: 18.sp,),),
                  // ),
                  SizedBox(height: 15.h,),
                  Text(productOffered.price.toString()+" USD ",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 15.h,),
            Container(width: 300,height: 50,decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(20)),
            child: Center(child:(productOriginal.price - productOffered.price)>0 ? Text("Amount to pay is {${productOriginal.price - productOffered.price}} USD ",style: TextStyle(fontWeight: FontWeight.bold),) :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("The amount to be recieved is ",style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    (productOriginal.price - productOffered.price).toString().length==1?
                    (productOriginal.price - productOffered.price).toString()+" USD ":
                    (productOriginal.price - productOffered.price).toString().length==3?
                    (productOriginal.price - productOffered.price).toString().substring(1,3)+" USD ":
                    (productOriginal.price - productOffered.price).toString().substring(1,4)+" USD "
                )
              ],
            ))
            ),
            SizedBox(height: 15.h,),

            CustomActionButton(buttonText: "Proceed to checkout", isLoading: false,isIcon: false,onTap: (){
              var amountRemaining =  (productOriginal.price - productOffered.price);
              Get.to(FinalizeTradeScreen(amount: amountRemaining));
            },),
            SizedBox(height: 20.h,)

          ],
        ),
      ),
    );
  }
}
