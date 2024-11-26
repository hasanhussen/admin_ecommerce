import 'package:ecommerceadmin/core/class/crud.dart';
import 'package:ecommerceadmin/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.notification, {});
    return response.fold((l) => l, (r) => r);
  }

  sendtousers(String title, String body) async {
    var response = await crud.postData(
        'http://10.0.2.2/ecommerce/admin/notification/sendnotificationtousers.php',
        {'title': title, 'body': body});
    print('resdata=$response');
    return response.fold((l) => l, (r) => r);
  }
}
