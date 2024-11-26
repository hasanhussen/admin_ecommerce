import 'package:ecommerceadmin/controller/homescreen_controller.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/view/widget/home/homecontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              children: [
                ...List.generate(
                    6,
                    (index) => HomeContainer(
                        image: controller.homecontainerlist[index]['image'],
                        title: controller.homecontainerlist[index]['title'],
                        onTap: controller.homecontainerlist[index]['ontap']))
              ],
            )));
  }
}
