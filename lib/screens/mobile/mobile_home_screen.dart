import 'package:csc_picker/csc_picker.dart';
import 'package:e_registration_system/components/custom_button.dart';
import 'package:e_registration_system/components/custom_course_value.dart';
import 'package:e_registration_system/components/custom_date_field.dart';
import 'package:e_registration_system/components/custom_email_form_field.dart';
import 'package:e_registration_system/components/custom_text_field.dart';
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
  TextEditingController birthdayController = TextEditingController();

  late String selectedGender;
  String countryError = "";

  late String selectedCountry;
  late String selectedState;
  late String selectedCity;

  String genderValue = "";

  bool stateState = false;
  bool cityState = false;

  String course = " Flutter";

  bool validatorState = true;
  bool countryValidatorState = true;

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
            const Text(
              'Fill in your details correctly',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
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
                      // CustomDropDown(selectedValue: genderValue),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "*required",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Color(0xff034D29),
                                width: 3.0,
                              )),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<String>(
                                  focusColor: Color(0xff034D29),
                                  // dropdownColor: Color(0xff034D29),
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        selectedGender = value;
                                        print(selectedGender);
                                      });
                                    }
                                  },
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'male',
                                      child: Text('Male'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'female',
                                      child: Text('Female'),
                                    ),
                                  ],
                                  decoration: const InputDecoration(
                                    labelText: 'Select your gender',
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select a valid gender';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      CustomDateField(
                          hint: "Birthday",
                          validatorText:
                              "Enter a birthday in YYYY-MM-DD format",
                          icon: const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.grey,
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
                        countryValidatorState == true ? "" : countryError,
                        style: TextStyle(
                            fontSize: 12,
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
                      CustomCourseField(course: course),
                      SizedBox(height: size.height * 0.03),
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
                      InkWell(
                          onTap: () {
                            print(validatorState);
                            if ((formKey.currentState!.validate()) &&
                                (selectedCountry.isNotEmpty &&
                                    selectedState.isNotEmpty &&
                                    selectedCity.isNotEmpty &&
                                    selectedGender.isNotEmpty) &&
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
                                  {"course": course},
                                ],
                              );
                            } else {
                              if (selectedCountry != "Nigeria") {
                                setState(() {
                                  countryError = "Only available in Nigeria";
                                });
                              }
                              setState(() {
                                validatorState = false;
                                countryValidatorState = false;
                              });
                            }
                          },
                          child: CustomButton(
                            text: "Next",
                            color: Colors.black,
                            textColor: Colors.white,
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
