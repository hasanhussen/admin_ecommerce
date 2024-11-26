// ignore_for_file: body_might_complete_normally_nullable, avoid_print, avoid_unnecessary_containers

import 'package:ecommerceadmin/controller/notification/notification_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerceadmin/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              Get.defaultDialog(
                  title: 'Add notification details',
                  content: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        CustomTextFormAuth(
                            hinttext: '',
                            labeltext: 'title',
                            iconData: Icons.title,
                            mycontroller: controller.titlenotification,
                            valid: (val) {},
                            isNumber: false),
                        CustomTextFormAuth(
                            maxLines: 2,
                            hinttext: '',
                            labeltext: 'body',
                            iconData: Icons.content_paste_go_outlined,
                            mycontroller: controller.bodynotification,
                            valid: (val) {},
                            isNumber: false),
                        CustomButtomAuth(
                          text: 'send',
                          onPressed: () {
                            print(controller.titlenotification.text);
                            controller.sendnotification(
                                controller.titlenotification.text.toString(),
                                controller.bodynotification.text.toString());
                            Get.back();
                          },
                        )
                      ],
                    ),
                  ));
            },
            child: const Text("send notification to all users",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: Container(
        child: GetBuilder<NotificationController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView(children: [
                      const Center(
                          child: Text(
                        "Notification",
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                      const SizedBox(height: 10),
                      ...List.generate(
                          controller.data.length,
                          (index) => Card(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Stack(
                                    children: [
                                      ListTile(
                                        title: Text(controller.data[index]
                                            ['notification_admin_title']),
                                        subtitle: Text(controller.data[index]
                                            ['notification_admin_body']),
                                      ),
                                      Positioned(
                                          right: 5,
                                          child: Text(
                                            Jiffy.parse(controller.data[index]
                                                    ['notification_admin_date'])
                                                .fromNow(),
                                            style: const TextStyle(
                                                color: AppColor.primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                              ))
                    ])))),
      ),
    );
  }
}
