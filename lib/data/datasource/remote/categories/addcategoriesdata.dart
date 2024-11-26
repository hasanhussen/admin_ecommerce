import 'dart:io';

import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class AddCategoriesData {
  Crud crud;
  AddCategoriesData(this.crud);
  addData(String name, String namear, File image) async {
    return await crud.addRequestWithImageOne(
        AppLink.addcategories,
        {
          'name': name,
          'namear': namear,
        },
        image);
  }
}

 // var response = await crud.postData(AppLink.addcategories, {
    //   'name': name,
    //   'namear': namear,
    //   'imageold': imageold,
    // });
    // return response.fold((l) => l, (r) => r);