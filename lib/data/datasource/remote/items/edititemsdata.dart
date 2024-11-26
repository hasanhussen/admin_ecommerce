import 'dart:io';

import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class EditItemsData {
  Crud crud;
  EditItemsData(this.crud);

  editData(
      String id,
      String name,
      String namear,
      String desc,
      String descar,
      String count,
      String price,
      String discount,
      String catid,
      String imageold) async {
    var response = await crud.postData(AppLink.edititems, {
      'id': id,
      'name': name,
      'namear': namear,
      'desc': desc,
      'descar': descar,
      'count': count,
      'price': price,
      'discount': discount,
      'catid': catid,
      'imageold': imageold,
    });
    return response.fold((l) => l, (r) => r);
  }

  editDataWithFile(
      String id,
      String name,
      String namear,
      String desc,
      String descar,
      String count,
      String price,
      String discount,
      String catid,
      String imageold, // Update method name
      File image) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.edititems, // Update API link
        {
          'id': id,
          'name': name,
          'namear': namear,
          'desc': desc,
          'descar': descar,
          'count': count,
          'price': price,
          'discount': discount,
          'catid': catid,
          'imageold': imageold,
        },
        image);
    return response.fold((l) => l, (r) => r);
  }
}
