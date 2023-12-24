// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_test/controllers/thirdpage_controller.dart';
import 'package:suitmedia_test/controllers/secondpage_controller.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key});

  @override
  Widget build(BuildContext context) {
    SecondPageController secondPagesController =
        Get.put(SecondPageController());
    ThirdPageController thirdPageController = Get.put(ThirdPageController());

    final ScrollController scrollController = ScrollController();

    void onScroll() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && thirdPageController.hasMore.value) {
        thirdPageController.getUser();
      }
    }

    thirdPageController.getUser();
    scrollController.addListener(onScroll);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Third Screen",
            style: TextStyle(
              fontFamily: "poppins",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            color: const Color.fromRGBO(85, 74, 240, 1),
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: const Color.fromARGB(255, 190, 190, 190),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: thirdPageController.onRefresh,
          child: Obx(
            () => ListView.builder(
              controller: scrollController,
              itemCount: thirdPageController.hasMore.value
                  ? thirdPageController.users.length + 1
                  : thirdPageController.users.length,
              itemBuilder: (context, index) {
                if (index < thirdPageController.users.length) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 20, right: 20),
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          secondPagesController.selectedUsername.value =
                              '${thirdPageController.users[index].first_name} ${thirdPageController.users[index].last_name}';
                          Get.back();
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                                top: 15,
                                bottom: 15,
                              ),
                              child: Container(
                                width: 49,
                                height: 49,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(180),
                                  image: DecorationImage(
                                    image: NetworkImage(thirdPageController
                                            .users[index].avatar ??
                                        ""),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    top: 18,
                                  ),
                                  child: Text(
                                    '${thirdPageController.users[index].first_name} ${thirdPageController.users[index].last_name}',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    thirdPageController.users[index].email ??
                                        "",
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }
}
