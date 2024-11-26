import 'dart:io';

import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class EditCategoriesData {
  Crud crud;
  EditCategoriesData(this.crud);
  editData(String id, String name, String namear, String imageold) async {
    var response = await crud.postData(AppLink.editcategories, {
      'id': id,
      'name': name,
      'namear': namear,
      'imageold': imageold,
    });
    return response.fold((l) => l, (r) => r);
  }

  editDatawithfile(String id, String name, String namear, String imageold,
      File image) async {
    var response = await crud.addRequestWithImageOne(
        AppLink.editcategories,
        {
          'id': id,
          'name': name,
          'namear': namear,
          'imageold': imageold,
        },
        image);
    return response.fold((l) => l, (r) => r);
  }
}
