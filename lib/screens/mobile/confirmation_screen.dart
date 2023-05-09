import 'package:e_registration_system/api/repositories/client_repository.dart';
import 'package:e_registration_system/components/custom_button.dart';
import 'package:e_registration_system/components/custom_textfield_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  ClientController clientController = Get.put(ClientController());

  dynamic argumentData = Get.arguments;
  late String staffId;
  late String NIN;
  late String firstName;
  late String lastName;
  late String otherName;
  late String gender;
  late String birthday;
  late String country;
  late String state;
  late String city;
  late String address;
  late String email;
  late String institution;
  late String typeOfInstitution;
  late String gradeLevel;
  late String phoneNumber;
  late String course;
  @override
  initState() {
    super.initState();
    staffId = argumentData[0]['staffId'];
    NIN = argumentData[1]['NIN'];
    firstName = argumentData[2]['firstName'];
    lastName = argumentData[3]['lastName'];
    otherName = argumentData[4]['otherName'];
    gender = argumentData[5]['gender'];
    birthday = argumentData[6]['birthday'];
    country = argumentData[7]['country'];
    state = argumentData[8]['state'];
    city = argumentData[9]['city'];
    address = argumentData[10]['address'];
    email = argumentData[11]['email'];
    institution = argumentData[12]['institution'];
    typeOfInstitution = argumentData[13]['typeOfInstitution'];
    gradeLevel = argumentData[14]['gradeLevel'];
    phoneNumber = argumentData[15]['phoneNumber'];
    course = argumentData[16]['course'];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 30,
                          ),
                          Text(
                            'Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                const Text(
                  'Check your details correctly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Staff id:",
                  text: staffId,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "NIN:",
                  text: NIN,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "First name:",
                  text: firstName,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Last name:",
                  text: lastName,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Other name:",
                  text: otherName,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Gender:",
                  text: gender,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(label: "Birthday:", text: birthday),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Country:",
                  text: country,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "State:",
                  text: state,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "City:",
                  text: city,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Address:",
                  text: address,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Email:",
                  text: email,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Institution:",
                  text: institution,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Type of institution:",
                  text: typeOfInstitution,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Grade level:",
                  text: gradeLevel,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Phone number:",
                  text: phoneNumber,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextFieldDisplay(
                  label: "Course:",
                  text: course,
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const CustomButton(
                        text: "Edit",
                        color: Colors.grey,
                        textColor: Colors.white,
                      ),
                    )),
                    SizedBox(width: size.width * 0.02),
                    Flexible(
                        child: InkWell(
                      onTap: () async {
                        bool created = await clientController.registerClient(
                          staffId: staffId,
                          nin: NIN,
                          firstName: firstName,
                          lastName: lastName,
                          middleName: otherName,
                          gender: gender,
                          birthday: birthday,
                          state: state,
                          city: city,
                          address: address,
                          email: email,
                          institution: institution,
                          typeOfInstitution: typeOfInstitution,
                          gradeLevel: gradeLevel,
                          phoneNumber: phoneNumber,
                          course: course,
                        );
                        if (created) {
                          Get.toNamed("/successful");
                        }
                      },
                      child: const CustomButton(
                          text: "Submit",
                          color: Colors.black,
                          textColor: Colors.white),
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
