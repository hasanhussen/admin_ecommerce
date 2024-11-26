import 'dart:io';

import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class AddItemsData {
  // Update class name
  Crud crud;
  AddItemsData(this.crud); // Update constructor

  addData(String name, String namear, File image, String desc, String descar,
      String count, String price, String discount, String catid) async {
    // Update method
    return await crud.addRequestWithImageOne(
        AppLink.additems, // Update API link
        {
          'name': name,
          'namear': namear,
          'desc': desc,
          'descar': descar,
          'count': count,
          'price': price,
          'discount': discount,
          'catid': catid
        },
        image);
  }
}
