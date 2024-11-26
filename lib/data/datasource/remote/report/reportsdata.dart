import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class ReportData {
  Crud crud;
  ReportData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.report, {});
    return response.fold((l) => l, (r) => r);
  }
}
