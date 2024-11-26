import 'package:ecommerceadmin/controller/orders/pending_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders pending'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
            builder: ((controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) =>
                      CardOrdersList(listdata: controller.data[index])),
                )))),
      ),
    );
  }
}
