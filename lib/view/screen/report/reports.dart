import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceadmin/controller/report/reports_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/data/model/reportmodel.dart';
import 'package:ecommerceadmin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReportController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'items top selling',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<ReportController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListReports(listdatamodel: controller.data)))),
    );
  }
}

class ListReports extends GetView<ReportController> {
  final List<ReportModel> listdatamodel;
  const ListReports({Key? key, required this.listdatamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
                child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imagesItems}/${listdatamodel[index].itemsImage}",
                    width: 70,
                    height: 70,
                  )),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listdatamodel[index].itemsName!),
                        subtitle: Text(listdatamodel[index].itemsDate!),
                      )),
                ],
              ),
            )),
          );
        });
  }
}
