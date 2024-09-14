import 'package:ebotzz/utils/imports.dart';
import 'package:ebotzz/widgets/bidDetail.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

class BidsScreen extends StatelessWidget {
  const BidsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    TextEditingController controller1 = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Bidding screen"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Container(
                width: 340,
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: 300,
                        child: Image.network(
                            controller.totalData[0]["images"][0]["src"])),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Starting bid is 3,000 USD",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.sp),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                  alignment:Alignment.centerLeft,child: const Text("Item Condition: New",style: TextStyle(color: Colors.grey,fontSize: 20),)),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text("Time left: ",style: TextStyle(color: Colors.grey,fontSize: 20),)),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                color: Colors.white,
                child: Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
                BidDetail(firstLabel: "2", secondLabel: "WEEKS"),
                BidDetail(firstLabel: "6", secondLabel: "DAYS"),
                BidDetail(firstLabel: "10", secondLabel: "HOURS"),
                BidDetail(firstLabel: "45", secondLabel: "MINUTES"),
                BidDetail(firstLabel: "0", secondLabel: "SECONDS"),
              ],),),
            ),
            SizedBox(height: 30.h,),
            Row(

              children: [
                SizedBox(width: 10.w,),
              Expanded(
                flex: 2,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(child: Text("3000 USD")),),

              ),
              SizedBox(width: 10.w,),
              Expanded(
                flex: 1,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color:Colors.black,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Icon(Icons.handyman,color: Colors.white,),),)

              ),
              Expanded(
                flex: 1,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    radius: 30,
                    child: Icon(Icons.remove_red_eye,color: Colors.grey,),
                  )

              ),

            ],),
            SizedBox(height: 30.h,),
            CustomInputField(controller:controller1,label: "send a message with this bid", ),
            SizedBox(height: 10.h,),
            CustomActionButton(buttonText: "Confirm", isLoading: false,isIcon: false,)
          ],
        ),
      ),
    );
  }
}
