import 'package:ecommerceadmin/controller/categories/viewcategories_controller.dart';
import 'package:ecommerceadmin/core/class/handlingdataview.dart';
import 'package:ecommerceadmin/core/constant/color.dart';
import 'package:ecommerceadmin/data/model/categoriesmodel.dart';
import 'package:ecommerceadmin/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesController cont = Get.put(CategoriesController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: WillPopScope(
        onWillPop: () {
          return cont.myback();
        },
        child: Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<CategoriesController>(
                builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:
                        ListCategories(listdatamodel: controller.categories)))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cont.gotoadd(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListCategories extends GetView<CategoriesController> {
  final List<CategoriesModel> listdatamodel;
  const ListCategories({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: SvgPicture.network(
                      "${AppLink.imageCategories}/${listdatamodel[index].categoriesImage}",
                      width: 70,
                      height: 70,
                    )),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].categoriesName!),
                          subtitle:
                              Text(listdatamodel[index].categoriesDatetime!),
                        )),
                    IconButton(
                        onPressed: () {
                          controller.gotoedit(
                              listdatamodel[index].categoriesId.toString(),
                              listdatamodel[index].categoriesName!,
                              listdatamodel[index].categoriesNameAr!,
                              listdatamodel[index].categoriesImage!);
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              title: 'Waring',
                              titleStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primaryColor),
                              content: const Text(
                                  'Are you sure you want to delete this categories?'),
                              onConfirm: () {
                                controller.deleteCategories(
                                    listdatamodel[index]
                                        .categoriesId
                                        .toString(),
                                    listdatamodel[index].categoriesImage!);
                              },
                              onCancel: () {},
                              cancelTextColor: Colors.black,
                              confirmTextColor: Colors.white,
                              buttonColor: AppColor.primaryColor);
                        },
                        icon: const Icon(Icons.delete_outlined))
                  ],
                ),
              )),
            ),
          );
        });
  }
}
