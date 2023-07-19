import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Details',
          style: TextStyle(color: Colors.grey.shade500),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                width: 200,
                imageUrl: controller.user["picture"]["large"],
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (ctx, url, err) => Icon(Icons.error),
              ),
            ),
            Column(
              children: [
                textView(
                    text:
                        "${controller.user["name"]["first"]} ${controller.user["name"]["last"]}"),
                SizedBox(
                  height: 20,
                ),
                textView(
                    text:
                        "${controller.user["location"]["street"]["number"]} ${controller.user["location"]["street"]["name"]}"),
                SizedBox(
                  height: 5,
                ),
                textView(
                    text:
                        "${controller.user["location"]["city"]}, ${controller.user["location"]["state"]},${controller.user["location"]["country"]}"),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    controller.launchEmail();
                  },
                  child: Text(
                    "${controller.user["email"]}",
                    style: TextStyle(color: Colors.blue.shade500, fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static textView({required String text}) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
    );
  }
}
