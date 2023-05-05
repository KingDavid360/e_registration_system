import 'package:csc_picker/csc_picker.dart';
import 'package:e_registration_system/components/custom_button.dart';
import 'package:e_registration_system/components/custom_course_value.dart';
import 'package:e_registration_system/components/custom_date_field.dart';
import 'package:e_registration_system/components/custom_text_field.dart';
import 'package:e_registration_system/components/drop_down.dart';
import 'package:e_registration_system/screens/mobile/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MobileHomeScreen extends StatefulWidget {
  MobileHomeScreen({Key? key}) : super(key: key);

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
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
  TextEditingController dateController = TextEditingController();

  late String selectedCountry;
  late String selectedState;
  late String selectedCity;

  String genderValue = "";

  bool stateState = false;
  bool cityState = false;

  String course = " Flutter";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                          validatorText: "Staff id",
                          textEditingController: staffIdController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "NIN ",
                          validatorText: "NIN",
                          textEditingController: NINController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "First name",
                          validatorText: "First name",
                          textEditingController: firstNameController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Last name",
                          validatorText: "Last name",
                          textEditingController: lastNameController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Other names",
                          validatorText: "Other names",
                          textEditingController: otherNamesController),
                      SizedBox(height: size.height * 0.02),
                      CustomDropDown(selectedValue: genderValue),
                      SizedBox(height: size.height * 0.02),
                      CustomDateField(
                          hint: "Birthday",
                          validatorText:
                              "Enter a birthday in YYYY-MM-DD format",
                          icon: const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.grey,
                          ),
                          textEditingController: dateController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Institution",
                          validatorText: "Institution",
                          textEditingController: institutionController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Type of institution",
                          validatorText: "Type of institution",
                          textEditingController: typeOfInstitutionController),
                      SizedBox(height: size.height * 0.02),
                      const Text(
                        "*required",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      CSCPicker(
                        defaultCountry: CscCountry.Nigeria,
                        onCountryChanged: (country) {
                          setState(() {
                            selectedCountry = country;
                          });
                        },
                        onStateChanged: (state) {
                          if (state != null) {
                            setState(() {
                              selectedState = state!;
                            });
                          }
                        },
                        onCityChanged: (city) {
                          if (city != null) {
                            setState(() {
                              selectedCity = city!;
                            });
                          }
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Address",
                          validatorText: "Address",
                          textEditingController: addressController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Grade level",
                          validatorText: "Grade level",
                          textEditingController: gradeLevelController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Email",
                          validatorText: "Email",
                          textEditingController: emailController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Phone number",
                          validatorText: "Phone number",
                          textEditingController: phoneNumberController),
                      SizedBox(height: size.height * 0.02),
                      CustomCourseField(course: course),
                      SizedBox(height: size.height * 0.04),
                      InkWell(
                          onTap: () {
                            if ((formKey.currentState!.validate()) &&
                                (selectedCountry.isNotEmpty &&
                                    selectedState.isNotEmpty &&
                                    selectedCity.isNotEmpty &&
                                    genderValue.isNotEmpty) &&
                                (genderValue.isNotEmpty)) {
                              setState(() {});
                              Get.to(ConfirmationScreen());
                            }
                          },
                          child: CustomButton(text: "Next"))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
