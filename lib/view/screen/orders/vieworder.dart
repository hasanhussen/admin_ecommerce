import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/view/widget/orders/ordercontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersHome extends StatelessWidget {
  const OrdersHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: AppColor.primaryColor,
          title: const Text(
            'Orders',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: [
            OrderContainer(
                icon: Icons.run_circle_outlined,
                title: 'Pending',
                onTap: () {
                  Get.toNamed(AppRoute.orderspending);
                }),
            OrderContainer(
                icon: Icons.archive_outlined,
                title: 'Archive',
                onTap: () {
                  Get.toNamed(AppRoute.ordersarchive);
                }),
          ],
        ));
  }
}
