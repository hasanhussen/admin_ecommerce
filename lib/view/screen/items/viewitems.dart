import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceadmin/controller/items/viewitems_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/data/model/itemsmodel.dart';
import 'package:ecommerceadmin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsController cont = Get.put(ItemsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Items',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: WillPopScope(
        onWillPop: () {
          return cont.myBack();
        },
        child: Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<ItemsController>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListItems(listdatamodel: controller.items)))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cont.gotoAdd(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListItems extends GetView<ItemsController> {
  final List<ItemsModel> listdatamodel;
  const ListItems({Key? key, required this.listdatamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.gotoEdit(
                listdatamodel[index].itemsId.toString(),
                listdatamodel[index].itemsName!,
                listdatamodel[index].itemsNameAr!,
                listdatamodel[index].itemsDesc!,
                listdatamodel[index].itemsDescAr!,
                listdatamodel[index].itemsCount!,
                listdatamodel[index].itemsPrice!,
                listdatamodel[index].itemsDiscount!,
                listdatamodel[index].categoriesName!,
                listdatamodel[index].categoriesId!,
                listdatamodel[index].itemsImage!,
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                  child: Container(
                color: listdatamodel[index].itemsActive == '0'
                    ? Color.fromARGB(255, 212, 108, 108)
                    : Colors.white,
                padding: EdgeInsets.all(10),
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
                    IconButton(
                        onPressed: () {
                          listdatamodel[index].itemsActive == '1'
                              ? Get.defaultDialog(
                                  title: 'Waring',
                                  titleStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.primaryColor),
                                  content: const Text(
                                      'Are you sure you want to hide this item from the store?'),
                                  onConfirm: () {
                                    controller.activeitem(
                                        listdatamodel[index].itemsId.toString(),
                                        '0');
                                  },
                                  onCancel: () {},
                                  cancelTextColor: Colors.black,
                                  confirmTextColor: Colors.white,
                                  buttonColor: AppColor.primaryColor)
                              : Get.defaultDialog(
                                  title: 'Waring',
                                  titleStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.primaryColor),
                                  content: const Text(
                                      'Are you sure you want to unhide this item from the store?'),
                                  onConfirm: () {
                                    controller.activeitem(
                                        listdatamodel[index].itemsId.toString(),
                                        '1');
                                  },
                                  onCancel: () {},
                                  cancelTextColor: Colors.black,
                                  confirmTextColor: Colors.white,
                                  buttonColor: AppColor.primaryColor);
                        },
                        icon: Icon(
                          Icons.hide_source_outlined,
                          color: listdatamodel[index].itemsActive == '0'
                              ? Colors.white
                              : AppColor.primaryColor,
                        )),
                    IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              title: 'Waring',
                              titleStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primaryColor),
                              content: const Text(
                                  'Are you sure you want to delete this item?'),
                              onConfirm: () {
                                controller.deleteItems(
                                    listdatamodel[index].itemsId.toString(),
                                    listdatamodel[index].itemsImage!);
                              },
                              onCancel: () {},
                              cancelTextColor: Colors.black,
                              confirmTextColor: Colors.white,
                              buttonColor: AppColor.primaryColor);
                        },
                        icon: Icon(
                          Icons.delete_outlined,
                          color: listdatamodel[index].itemsActive == '0'
                              ? Colors.white
                              : AppColor.black,
                        ))
                  ],
                ),
              )),
            ),
          );
        });
  }
}
