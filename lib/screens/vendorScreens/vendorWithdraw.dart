import 'package:ebotzz/core/utils/appColors.dart';
import 'package:ebotzz/utils/imports.dart';

class VendorWithdraw extends StatelessWidget {
  const VendorWithdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vendorAppBarColor,
        title: Text("VendorWithdraw"),
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h,),
          Text("Payment Details",style: TextStyle(fontSize: 24.sp,color: Colors.black),),
          SizedBox(height: 30.h,),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade600
                )
              ),
              child: Column(
                children: [
                  Container(
                    width: 350.w,
                    height: 35.h,
                    color: Colors.grey.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Balance",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp)),
                    ),
                  ),
                  Container(
                    width: 350.w,
                    height: 100.h,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: RichText(
                                text:  TextSpan(
                                    text: 'Your account balance is ',
                                    style: TextStyle(
                                        color: Colors.grey.shade600, fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(text: '432,124 USD',
                                          style: TextStyle(
                                              color: Colors.blueAccent, fontSize: 18),
                                      )
                                    ]
                                ),
                              ),
                            )
                        ),
                        Container(
                          width: 120.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.pink
                            )
                          ),
                          child: Center(child: Text("Withdraw",style: TextStyle(color: Colors.white),),),
                          
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.shade600
                  )
              ),
              child: Column(
                children: [
                  Container(
                    width: 350.w,
                    height: 35.h,
                    color: Colors.grey.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Payment details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp)),
                    ),
                  ),
                  Container(
                    width: 350.w,
                    height: 100.h,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                        Center(child: Text("You Dont have any payment yet")),
                        SizedBox(height: 10.h,),
                        Container(
                          width: 120.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.pink
                              )
                          ),
                          child: Center(child: Text("Withdraw",style: TextStyle(color: Colors.white),),),

                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.shade600
                  )
              ),
              child: Column(
                children: [
                  Container(
                    width: 350.w,
                    height: 35.h,
                    color: Colors.grey.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Payment methods",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.sp),),
                    ),
                  ),
                  Container(
                    width: 350.w,
                    height: 100.h,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 10.h,),
                        Text("Setup Payment Setup"),
                        SizedBox(height: 10.h,),
                        SizedBox(height: 10.h,),
                        Container(
                          width: 120.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.pink
                              )
                          ),
                          child: Center(child: Text("Select payment",style: TextStyle(color: Colors.white),),),

                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
