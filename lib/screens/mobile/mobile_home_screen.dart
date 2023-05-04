import 'package:csc_picker/csc_picker.dart';
import 'package:e_registration_system/components/custom_course_value.dart';
import 'package:e_registration_system/components/custom_date_field.dart';
import 'package:e_registration_system/components/custom_text_field.dart';
import 'package:e_registration_system/components/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../components/custom_course_value.dart';
import '../../components/custom_date_field.dart';
import '../../components/custom_text_field.dart';
import '../../components/drop_down.dart';

List<String> genderList = ["----------", "Male", "Female"];

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

  String genderValue = genderList.first;

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
                        list: genderList,
                        value: genderValue,
                      ),
                      SizedBox(height: size.height * 0.02),
                      CustomDateField(
                          hint: "Birthday",
                          icon: const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.grey,
                          ),
                          textEditingController: dateController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Institution",
                          textEditingController: institutionController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Type of institution",
                          textEditingController: typeOfInstitutionController),
                      SizedBox(height: size.height * 0.02),
                      CSCPicker(
                        layout: Layout.vertical,
                        defaultCountry: CscCountry.Nigeria,
                        onCountryChanged: (country) {},
                        onStateChanged: (state) {},
                        onCityChanged: (city) {},
                      ),
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
                      SizedBox(height: size.height * 0.02),
                      CustomCourseField(),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
