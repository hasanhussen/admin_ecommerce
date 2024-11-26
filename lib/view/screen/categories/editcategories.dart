// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerceadmin/controller/categories/editcategories_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/core/shared/custombutton.dart';
import 'package:ecommerceadmin/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditCategories extends StatelessWidget {
  const EditCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditCategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('edit details category'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<EditCategoriesController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(children: [
                  CustomTextFormAuth(
                      hinttext: "nane",
                      labeltext: "name",
                      iconData: Icons.location_city,
                      mycontroller: controller.namecontroller,
                      valid: (val) {},
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "namear",
                      labeltext: "namear",
                      iconData: Icons.streetview,
                      mycontroller: controller.namearcontroller,
                      valid: (val) {},
                      isNumber: false),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      onPressed: () {
                        controller.chooseImage();
                      },
                      child: const Text('choose categories image'),
                    ),
                  ),
                  if (controller.file != null)
                    SvgPicture.file(controller.file!),
                  CustomButton(
                    text: "Save",
                    onPressed: () {
                      controller.editcategories();
                    },
                  )
                ])),
          )),
    );
  }
}
