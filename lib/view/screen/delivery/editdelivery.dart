// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerceadmin/controller/delivery/editdelivery_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/shared/custombutton.dart';
import 'package:ecommerceadmin/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryEdit extends StatelessWidget {
  const DeliveryEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditDeliveryController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add delivery address'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<EditDeliveryController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      iconData: Icons.person,
                      mycontroller: controller.namecontroller,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "email",
                      labeltext: "email",
                      iconData: Icons.email_outlined,
                      mycontroller: controller.emailcontroller,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "phone",
                      labeltext: "phone",
                      iconData: Icons.phone_outlined,
                      mycontroller: controller.phonecontroller,
                      valid: (val) {},
                      isNumber: true),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.editdelivery();
                    },
                  )
                ])),
          )),
    );
  }
}
