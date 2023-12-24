// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/controllers/firstpage_controller.dart';
import 'package:suitmedia_test/routes/app_routes.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key});

  FirstPageController firstPageController = Get.put(FirstPageController());
  TextEditingController palindromeTextField = TextEditingController();
  TextEditingController nameTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 185),
                child: Container(
                  width: 116,
                  height: 116,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(180),
                  ),
                  child: const Icon(
                    Icons.person_add_alt_1_sharp,
                    color: Colors.white,
                  ),
                ),
              ),

              // ** TEXT FIELD **
              Padding(
                padding: const EdgeInsets.only(top: 51),
                child: Container(
                  width: 310,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: nameTextField,
                        decoration: const InputDecoration(
                            border: InputBorder.none, // Remove the underline
                            hintText: "Name",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(104, 103, 119, 0.36))),
                        style: const TextStyle(
                          fontFamily: "poppins",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: 310,
                  height: 47,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: palindromeTextField,
                        decoration: const InputDecoration(
                            border: InputBorder.none, // Remove the underline
                            hintText: "Palindrome",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(104, 103, 119, 0.36))),
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // ** BUTTON **
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: ElevatedButton(
                  onPressed: () {
                    // check is palindrome text field is empty?
                    // if empty then error
                    if (palindromeTextField.text.isEmpty) {
                      Get.defaultDialog(
                          title: "Error",
                          middleText: "Palindrome cannot be empty!");
                    } else {
                      firstPageController.palindrome =
                          palindromeTextField.text.obs;
                      firstPageController.isPalindrome();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(
                        310, 41), // Set the width and height directly
                    backgroundColor: const Color.fromRGBO(43, 99, 123, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "CHECK",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () {
                    // check if the name is null/empty
                    // then show to error dialog text
                    if (nameTextField.text.isEmpty) {
                      Get.defaultDialog(
                          title: "Error", middleText: "Name cannot be empty!");
                    }
                    // check if user already check the palindrome
                    // if yes, then go to the next page
                    if (firstPageController.isVerified) {
                      firstPageController.name = nameTextField.text.obs;
                      Get.toNamed(AppRoutes.second);
                    } else {
                      Get.defaultDialog(
                          title: "Error",
                          middleText: "Verify palindrome first!");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(
                        310, 41), // Set the width and height directly
                    backgroundColor: const Color.fromRGBO(43, 99, 123, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
