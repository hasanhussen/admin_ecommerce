// ignore_for_file: avoid_unnecessary_containers

import 'package:ecommerceadmin/controller/delivery/delivery_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/data/model/deliverymodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dilvery workers'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoute.deliveryadd);
            },
            child: const Icon(Icons.add)),
        body: GetBuilder<DeliveryController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, i) {
                  return CardAddress(
                    deliveryModel: controller.data[i],
                    onDelete: () {
                      controller.deletedelivery(controller.data[i].deliveryId!);
                    },
                    onEdit: () {
                      controller.gotoedit(
                        controller.data[i].deliveryId!.toString(),
                        controller.data[i].deliveryName!,
                        controller.data[i].deliveryEmail!,
                        controller.data[i].deliveryPassword!,
                        controller.data[i].deliveryPhone!.toString(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final DeliveryModel deliveryModel;
  final void Function()? onDelete;
  final void Function()? onEdit;
  const CardAddress(
      {Key? key, required this.deliveryModel, this.onDelete, this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Card(
        child: Container(
            height: 110,
            padding: const EdgeInsets.all(12),
            child: ListTile(
              title: Row(
                children: [
                  Text(deliveryModel.deliveryName!),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      deliveryModel.deliveryId!,
                      style: const TextStyle(fontSize: 20, height: 0),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(deliveryModel.deliveryEmail!),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        deliveryModel.deliveryPhone!,
                        style: const TextStyle(height: 0),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        deliveryModel.deliveryCreate!,
                        style: const TextStyle(height: 0),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
            )),
      ),
    );
  }
}
