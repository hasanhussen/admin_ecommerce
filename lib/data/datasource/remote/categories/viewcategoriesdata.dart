import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class ViewCategoriesData {
  Crud crud;
  ViewCategoriesData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.categories, {});
    return response.fold((l) => l, (r) => r);
  }
}
