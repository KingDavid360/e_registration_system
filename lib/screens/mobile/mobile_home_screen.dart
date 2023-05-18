import 'package:csc_picker/csc_picker.dart';
import 'package:e_registration_system/api/repositories/client_repository.dart';
import 'package:e_registration_system/components/custom_button.dart';
import 'package:e_registration_system/components/custom_course_value.dart';
import 'package:e_registration_system/components/custom_date_field.dart';
import 'package:e_registration_system/components/custom_email_form_field.dart';
import 'package:e_registration_system/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:e_registration_system/screen_detector.dart';

import '../../api/model/course_model.dart';
import '../../components/drop_down.dart';

class MobileHomeScreen extends StatefulWidget {
  MobileHomeScreen({Key? key}) : super(key: key);

  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  final clientController = Get.put(ClientController());
  String courses = '';
  @override
  void initState() {
    super.initState();
    clientController.fetchCourse();
  }

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
  TextEditingController birthdayController = TextEditingController();

  String selectedGender = "";
  String selectedCourses = "";
  String countryError = "";

  String selectedCountry = "";
  String selectedState = "";
  String selectedCity = '';

  String genderValue = "";

  bool stateState = false;
  bool cityState = false;

  bool validatorState = true;
  bool countryValidatorState = true;
  bool courseValidatorState = true;
  bool genderStateValidator = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenDetector.isMobile(context)
                ? size.width * 0.03
                : screenDetector.isTablet(context)
                    ? size.width * 0.2
                    : screenDetector.isDesktop(context)
                        ? size.width * 0.2
                        : size.width * 0.2,
            vertical: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                      height: size.height * 0.15,
                      width: size.width * 0.5,
                      "images/egtc_logo.png"),
                ),
                Flexible(
                  child: Image.asset(
                      height: size.height * 0.15,
                      width: size.width * 0.375,
                      "images/coat_of_arm.png"),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              'Fill in your details correctly',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.08,
              ),
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
                      CustomDropDown(
                        labelText: "Gender",
                        options: const ["Male", "Female"],
                        onChanged: (option) {
                          setState(() {
                            selectedGender = option; // create this var
                          });
                        },
                        hintText: 'Select your gender',
                        fillColor: Colors.transparent,
                        elevation: 2,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 10, 15, 4),
                        hidesUnderline: true,
                        initialOption: genderValue,
                      ),
                      Text(
                        genderStateValidator == true ? "" : "select a course",
                        style: TextStyle(
                            fontSize: size.height * 0.0165,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                      SizedBox(height: size.height * 0.02),
                      CustomDateField(
                          hint: "Birthday",
                          validatorText:
                              "Enter a birthday in YYYY-MM-DD format",
                          icon: const Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xff034D29),
                          ),
                          textEditingController: birthdayController),
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
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color(0xff034D29),
                          width: 3.0,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CSCPicker(
                            flagState: CountryFlag.DISABLE,
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
                        ),
                      ),
                      Text(
                        countryValidatorState == true
                            ? ""
                            : "Fill in correctly (only available in Nigeria)",
                        style: TextStyle(
                            fontSize: size.height * 0.0165,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                      SizedBox(height: size.height * 0.0175),
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
                      CustomEmailForm(
                          hint: "Email",
                          validatorText: "Email",
                          textEditingController: emailController),
                      SizedBox(height: size.height * 0.02),
                      CustomTextFormField(
                          hint: "Phone number",
                          validatorText: "Phone number",
                          textEditingController: phoneNumberController),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "*required",
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(height: size.height * 0.005),
                      CustomDropDown(
                        labelText: "Courses",
                        options: clientController.courses,
                        onChanged: (option) {
                          setState(() {
                            selectedCourses = option; // create this var
                          });
                        },
                        hintText: 'Select a course',
                        fillColor: Colors.transparent,
                        elevation: 2,
                        margin: EdgeInsetsDirectional.fromSTEB(12, 10, 15, 4),
                        hidesUnderline: true,
                        initialOption: selectedCourses,
                      ),
                      Text(
                        courseValidatorState == true ? "" : "select a course",
                        style: TextStyle(
                            fontSize: size.height * 0.0165,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                      SizedBox(height: size.height * 0.03),
                      InkWell(
                          onTap: () {
                            print(validatorState);
                            if ((formKey.currentState!.validate()) &&
                                (selectedCountry.isNotEmpty &&
                                    (selectedState.isNotEmpty &&
                                        selectedState.trim() !=
                                            "State".trim()) &&
                                    (selectedCity.isNotEmpty &&
                                        selectedCity.trim() != "City".trim()) &&
                                    selectedGender.isNotEmpty) &&
                                (selectedCourses.isNotEmpty) &&
                                (selectedCountry.trim() == "Nigeria".trim())) {
                              Get.toNamed(
                                '/confirmation',
                                arguments: [
                                  {"staffId": staffIdController.text},
                                  {"NIN": NINController.text},
                                  {"firstName": firstNameController.text},
                                  {"lastName": lastNameController.text},
                                  {"otherName": otherNamesController.text},
                                  {"gender": selectedGender},
                                  {
                                    "birthday": birthdayController.text
                                        .replaceAll(' ', '')
                                  },
                                  {"country": selectedCountry},
                                  {"state": selectedState},
                                  {"city": selectedCity},
                                  {"address": addressController.text},
                                  {"email": emailController.text},
                                  {"institution": institutionController.text},
                                  {
                                    "typeOfInstitution":
                                        typeOfInstitutionController.text
                                  },
                                  {"gradeLevel": gradeLevelController.text},
                                  {"phoneNumber": phoneNumberController.text},
                                  {"course": selectedCourses},
                                ],
                              );
                            } else {
                              if ((selectedCountry.isEmpty) ||
                                  (selectedState.isEmpty) ||
                                  (selectedCity.isEmpty)) {
                                setState(() {
                                  countryValidatorState = false;
                                  print("Country: $countryValidatorState");
                                  print(selectedState);
                                });
                              }
                              if (selectedCourses.isEmpty) {
                                setState(() {
                                  courseValidatorState = false;
                                });
                              }
                              if (selectedGender.isEmpty) {
                                setState(() {
                                  genderStateValidator = false;
                                });
                              }
                              setState(() {
                                validatorState = false;
                              });
                            }
                          },
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  validatorState == true
                                      ? ""
                                      : "Could you please fill every field correctly",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: validatorState == true
                                          ? Colors.white
                                          : Colors.red),
                                ),
                                CustomButton(
                                  text: "Next",
                                  color: Colors.black,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ))
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
