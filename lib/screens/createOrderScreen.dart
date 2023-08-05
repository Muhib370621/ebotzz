import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

import '../utils/imports.dart';

class CreateOrderScreen extends StatelessWidget {
  var product;
   CreateOrderScreen({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());

    TextEditingController paymentMethodController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController address1Controller= TextEditingController();
    TextEditingController address2Controller = TextEditingController();
    TextEditingController countryController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController postcodeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    TextEditingController shippingFirstNameController= TextEditingController();
    TextEditingController shippingLastNameController= TextEditingController();
    TextEditingController shippingaddress1Controller= TextEditingController();
    TextEditingController shippingaddress2Controller = TextEditingController();
    TextEditingController shippingcountryController = TextEditingController();
    TextEditingController shippingstateController = TextEditingController();
    TextEditingController shippingcityController = TextEditingController();
    TextEditingController shippingpostcodeController = TextEditingController();
    TextEditingController shippingemailController = TextEditingController();
    TextEditingController shippingphoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black45,
      title: Text("Create Order"),
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h,),

              CustomInputField(controller: paymentMethodController,label: "enter peyment method",),

              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade800
                    )
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.black

                          ),
                          child: const Center(child: Text("Enter billing details",style: TextStyle(color: Colors.white),))),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: firstNameController,label: "First name",)),
                          Expanded(child: CustomInputField(controller: lastNameController,label: "Last name",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: address1Controller,label: "Address1",)),
                          Expanded(child: CustomInputField(controller: address2Controller,label: "Address2",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: countryController,label: "Country",)),
                          Expanded(child: CustomInputField(controller: stateController,label: "state",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: cityController,label: "city",)),
                          Expanded(child: CustomInputField(controller: postcodeController,label: "postcode",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: emailController,label: "email",)),
                          Expanded(child: CustomInputField(controller: phoneController,label: "phone",)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.black
                          ),
                          child: const Center(child: Text("Enter shipping details",style: TextStyle(color: Colors.white),))),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: shippingFirstNameController,label: "First name",)),
                          Expanded(child: CustomInputField(controller: shippingLastNameController,label: "Last name",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: shippingaddress1Controller,label: "Address1",)),
                          Expanded(child: CustomInputField(controller: shippingaddress2Controller,label: "Address2",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: shippingcountryController,label: "Country",)),
                          Expanded(child: CustomInputField(controller: shippingstateController,label: "state",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),
                      Row(
                        children: [
                          Expanded(child: CustomInputField(controller: shippingcityController,label: "city",)),
                          Expanded(child: CustomInputField(controller: shippingpostcodeController,label: "postcode",)),
                        ],
                      ),
                      SizedBox(height: 20.h,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h,),

              CustomActionButton(buttonText: 'Submit',isIcon: false, isLoading: false,onTap: (){
                // setting billing
               var billing =  productController.setBilling(firstNameController.text, lastNameController.text, address1Controller.text, address2Controller.text, cityController.text, stateController.text,
                    postcodeController.text, countryController.text, emailController.text, phoneController.text);

                // setting shipping
                var shipping = productController.setShipping(shippingFirstNameController.text, shippingLastNameController.text, shippingaddress1Controller.text,
                    shippingaddress2Controller.text, shippingcityController.text, shippingstateController.text, shippingpostcodeController.text, shippingcountryController.text);

                // creating order
                 productController.createOrder(paymentMethodController.text, paymentMethodController.text, true, billing, shipping);

               print(productController.getResultCreate!.status.toString());


              },),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
