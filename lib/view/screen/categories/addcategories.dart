// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerceadmin/controller/categories/addcategories_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/core/shared/custombutton.dart';
import 'package:ecommerceadmin/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddCategoriesController controller = Get.put(AddCategoriesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details category'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: controller.formState,
            child: GetBuilder<AddCategoriesController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    CustomTextFormAuth(
                        hinttext: "name",
                        labeltext: "name",
                        iconData: Icons.category,
                        mycontroller: controller.name,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "name",
                        labeltext: "namear",
                        iconData: Icons.streetview,
                        mycontroller: controller.namear,
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
                      text: "Add",
                      onPressed: () {
                        controller.addCategories();
                      },
                    )
                  ])),
            ),
          )),
    );
  }
}
