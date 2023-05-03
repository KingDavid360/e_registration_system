import 'package:e_registration_system/constants/custom_text_field.dart';
import 'package:e_registration_system/constants/drop_down.dart';
import 'package:flutter/material.dart';

List<String> list = ["----------", "Male", "Female"];

class MobileHomeScreen extends StatelessWidget {
  MobileHomeScreen({Key? key}) : super(key: key);

  TextEditingController staffIdController = TextEditingController();
  TextEditingController NINController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController otherNamesController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController institutionController = TextEditingController();
  TextEditingController typeOfInstitutionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gradeLevelController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  String dropDownValue = list.first;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Image.asset(
                height: size.height * 0.15,
                width: size.width * 075,
                "images/coat_of_arm.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.03),
                      CustomTextFormField(
                          hint: "Staff Id",
                          textEditingController: staffIdController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "NIN ", textEditingController: NINController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "First name",
                          textEditingController: firstNameController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Last name",
                          textEditingController: lastNameController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Other names",
                          textEditingController: otherNamesController),
                      SizedBox(height: size.height * 0.02),
                      CustomDropDown(
                        type: "Gender:",
                        list: list,
                        value: dropDownValue,
                      ),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Institution",
                          textEditingController: institutionController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Type of institution",
                          textEditingController: typeOfInstitutionController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Address",
                          textEditingController: addressController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Grade level",
                          textEditingController: gradeLevelController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Email",
                          textEditingController: emailController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Phone number",
                          textEditingController: phoneNumberController),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
