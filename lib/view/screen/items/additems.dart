// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerceadmin/controller/items/additems_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/shared/custombutton.dart';
import 'package:ecommerceadmin/view/widget/auth/customtextformauth.dart';
import 'package:ecommerceadmin/view/widget/items/customdropdownsearch.dart';
import 'package:ecommerceadmin/view/widget/items/itemimagepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItems extends StatelessWidget {
  // Update class name
  const AddItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddItemsController controller =
        Get.put(AddItemsController()); // Update controller
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Details Items'), // Update title if necessary
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: controller.formState,
            child: GetBuilder<AddItemsController>(
              // Update GetBuilder
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    CustomTextFormAuth(
                        hinttext: "Name", // Update hint text
                        labeltext: "Name", // Update label text
                        iconData: Icons.category,
                        mycontroller: controller.name,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "Namear", // Update hint text
                        labeltext: "Namear", // Update label text
                        iconData: Icons.streetview,
                        mycontroller: controller.namear,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "Item description", // Update hint text
                        labeltext: "Item description", // Update label text
                        iconData: Icons.description_outlined,
                        mycontroller: controller.desc,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "Item description arabic", // Update hint text
                        labeltext:
                            "Item description arabic", // Update label text
                        iconData: Icons.description_outlined,
                        mycontroller: controller.descar,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "Item count", // Update hint text
                        labeltext: "Item count", // Update label text
                        iconData: Icons.production_quantity_limits,
                        mycontroller: controller.count,
                        valid: (val) {},
                        isNumber: true),
                    CustomTextFormAuth(
                        hinttext: "Item price", // Update hint text
                        labeltext: "Item price", // Update label text
                        iconData: Icons.production_quantity_limits,
                        mycontroller: controller.price,
                        valid: (val) {},
                        isNumber: true),
                    CustomTextFormAuth(
                        hinttext: "discount", // Update hint text
                        labeltext: "discount", // Update label text
                        iconData: Icons.discount_outlined,
                        mycontroller: controller.discount,
                        valid: (val) {},
                        isNumber: true),
                    CustomdropdownSearch(
                      listdata: controller.dropdownlist,
                      dropdownSelectedName: controller.catname,
                      dropdownSelectedID: controller.catid,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ItemImagePicker(),
                    CustomButton(
                      text: "Add",
                      onPressed: () {
                        controller.addItems(); // Update method call
                      },
                    )
                  ])),
            ),
          )),
    );
  }
}
