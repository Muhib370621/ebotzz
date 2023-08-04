import 'package:ebotzz/controllers/signUpController.dart';
import 'package:ebotzz/widgets/customActionButton.dart';
import 'package:ebotzz/widgets/customInput.dart';

import '../../utils/imports.dart';

class SimpleSignupView extends StatelessWidget {
  const SimpleSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

    // TextEditingController controller1 = TextEditingController();
    // TextEditingController controller2 = TextEditingController();
    // TextEditingController controller3 = TextEditingController();
    // TextEditingController controller4 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            CustomInputField(
              controller: signUpController.nameController.value,
              label: "name",
            ),
            // SizedBox(height: 5,),
            CustomInputField(
              controller: signUpController.emailController.value,
              label: "email",
            ),
            CustomInputField(
                controller: signUpController.passwordController.value,
                label: "password"),
            const SizedBox(
              height: 10,
            ),
            CustomActionButton(
              buttonText: "Signup",
              isIcon: false,
              onTap: () {
                signUpController.signUp(
                  signUpController.nameController.value.text,
                  signUpController.emailController.value.text,
                  signUpController.passwordController.value.text,
                );
              }, isLoading: signUpController.isLoading.value,
            )
          ],
        );
      }),
    );
  }
}
