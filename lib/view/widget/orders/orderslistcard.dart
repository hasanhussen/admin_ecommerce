import 'package:ecommerceadmin/controller/orders/pending_controller.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              Text("Total Price : ${listdata.ordersTotalprice} \$ ",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold)),
              const Divider(),
              Row(
                children: [
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == "0")
                    MaterialButton(
                      onPressed: () {
                        controller.rejectOrder(
                            listdata.ordersId!, listdata.ordersUsersid!);
                      },
                      color: AppColor.primaryColor,
                      textColor: Colors.white,
                      child: const Text("Reject"),
                    ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == "0")
                    MaterialButton(
                        onPressed: () {
                          controller.approveOrders(
                              listdata.ordersId!, listdata.ordersUsersid!);
                        },
                        color: AppColor.green,
                        textColor: Colors.white,
                        child: const Text("approve")),
                  if (listdata.ordersStatus! == "1")
                    MaterialButton(
                        onPressed: () {
                          controller.preparedOrders(listdata.ordersId!,
                              listdata.ordersUsersid!, listdata.ordersType!);
                        },
                        color: AppColor.green,
                        textColor: Colors.white,
                        child: const Text("ready")),
                ],
              ),
            ],
          )),
    );
  }
}
