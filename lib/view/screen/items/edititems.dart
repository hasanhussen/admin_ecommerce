// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerceadmin/controller/items/edititems_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/shared/custombutton.dart';
import 'package:ecommerceadmin/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceadmin/view/widget/items/customdropdownsearch.dart';
import 'package:ecommerceadmin/view/widget/items/edititemimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItems extends StatelessWidget {
  const EditItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditItemsController()); // Update controller
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Details Items'), // Update title if necessary
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<EditItemsController>(
            // Update GetBuilder
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "Name", // Update hint text
                      labeltext: "Name", // Update label text
                      iconData: Icons.production_quantity_limits,
                      mycontroller: controller.nameController,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "Namear", // Update hint text
                      labeltext: "Namear", // Update label text
                      iconData: Icons.production_quantity_limits,
                      mycontroller: controller.nameArController,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "Item description", // Update hint text
                      labeltext: "Item description", // Update label text
                      iconData: Icons.description_outlined,
                      mycontroller: controller.descController,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "Item description arabic", // Update hint text
                      labeltext: "Item description arabic", // Update label text
                      iconData: Icons.description_outlined,
                      mycontroller: controller.descarController,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "Item count", // Update hint text
                      labeltext: "Item count", // Update label text
                      iconData: Icons.production_quantity_limits,
                      mycontroller: controller.countController,
                      valid: (val) {},
                      isNumber: true),
                  CustomTextFormAuth(
                      hinttext: "Item price", // Update hint text
                      labeltext: "Item price", // Update label text
                      iconData: Icons.production_quantity_limits,
                      mycontroller: controller.priceController,
                      valid: (val) {},
                      isNumber: true),
                  CustomTextFormAuth(
                      hinttext: "discount", // Update hint text
                      labeltext: "discount", // Update label text
                      iconData: Icons.discount_outlined,
                      mycontroller: controller.discountController,
                      valid: (val) {},
                      isNumber: true),
                  CustomdropdownSearch(
                    listdata: controller.dropdownlist,
                    dropdownSelectedName: controller.catnameController,
                    dropdownSelectedID: controller.catidController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  EditItemImagePicker(oldimage: controller.oldimage),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.editItems(); // Update method call
                    },
                  )
                ])),
          )),
    );
  }
}
