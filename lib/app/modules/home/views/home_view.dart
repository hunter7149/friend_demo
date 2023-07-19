import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:friends/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Friends',
            style: TextStyle(color: Colors.grey.shade500),
          ),
          centerTitle: true,
        ),
        body: Obx(() => controller.users.isEmpty
            ? Center(
                child: Text(
                  'Loading data..',
                  style: TextStyle(fontSize: 20, color: Colors.blue.shade600),
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.78,
                      crossAxisCount: _getCrossAxisCount(
                          context), // Adjusted cross axis count
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    padding: EdgeInsets.all(10),
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAILS,
                              arguments: controller.users[index]);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  width: 100,
                                  imageUrl: controller.users[index]["picture"]
                                      ["large"],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (ctx, url, err) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                      "${controller.users[index]["name"]["first"]} ${controller.users[index]["name"]["last"]}"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      " ${controller.users[index]["location"]["country"]}"),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )));
  }

  int _getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = 200; // Adjust this value based on your item's width
    final crossAxisCount = (screenWidth / itemWidth).floor();
    if (crossAxisCount == 1) {
      return 2;
    } else {
      return crossAxisCount;
    }
  }
}
