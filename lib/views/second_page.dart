// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/controllers/firstpage_controller.dart';
import 'package:suitmedia_test/controllers/secondpage_controller.dart';
import 'package:suitmedia_test/routes/app_routes.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  FirstPageController firstPageController = Get.put(FirstPageController());
  SecondPageController secondPageController = Get.put(SecondPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Second Screen",
            style: TextStyle(
                fontFamily: "poppins",
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(
            color: const Color.fromRGBO(85, 74, 240, 1),
            icon: const Icon(
                Icons.arrow_back_ios), // Replace with a custom icon if needed
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(4.0), // Adjust the height of the border
            child: Container(
              width: double.infinity,
              height: 0.5, // Height of the border
              color: const Color.fromARGB(
                  255, 190, 190, 190), // Color of the border
            ),
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13, left: 21),
                    child: Text("Welcome",
                        style: TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1, left: 21),
                    child: Text(firstPageController.name.value,
                        style: const TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                  ),
                ],
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 222),
                    child: Obx(
                      () => Text(
                        secondPageController.selectedUsername.value,
                        style: const TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                    )),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 315),
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.third);
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
                      "Choose a User",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
