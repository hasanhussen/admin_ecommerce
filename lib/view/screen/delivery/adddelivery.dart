// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerceadmin/controller/delivery/adddelivery_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/shared/custombutton.dart';
import 'package:ecommerceadmin/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryAdd extends StatelessWidget {
  const DeliveryAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddDeliveryController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add delivery address'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddDeliveryController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      iconData: Icons.person,
                      mycontroller: controller.name,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "email",
                      labeltext: "email",
                      iconData: Icons.email_outlined,
                      mycontroller: controller.email,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "password",
                      labeltext: "password",
                      maxLines: 1,
                      iconData: Icons.lock_outline,
                      obscureText: controller.isshowpassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      mycontroller: controller.password,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "phone",
                      labeltext: "phone",
                      iconData: Icons.phone_outlined,
                      mycontroller: controller.phone,
                      valid: (val) {},
                      isNumber: true),
                  CustomButton(
                    text: "Add",
                    onPressed: () {
                      controller.addDelivery();
                    },
                  )
                ])),
          )),
    );
  }
}
