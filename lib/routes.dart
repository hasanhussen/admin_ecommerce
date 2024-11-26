import 'package:ecommerceadmin/core/constant/routes.dart';
import 'package:ecommerceadmin/core/middleware/mymiddleware.dart';
import 'package:ecommerceadmin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerceadmin/view/screen/auth/login.dart';
import 'package:ecommerceadmin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerceadmin/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommerceadmin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerceadmin/view/screen/categories/addcategories.dart';
import 'package:ecommerceadmin/view/screen/categories/editcategories.dart';
import 'package:ecommerceadmin/view/screen/categories/viewcategories.dart';
import 'package:ecommerceadmin/view/screen/delivery/adddelivery.dart';
import 'package:ecommerceadmin/view/screen/delivery/delivery.dart';
import 'package:ecommerceadmin/view/screen/delivery/editdelivery.dart';
import 'package:ecommerceadmin/view/screen/homescreen.dart';
import 'package:ecommerceadmin/view/screen/items/additems.dart';
import 'package:ecommerceadmin/view/screen/items/edititems.dart';
import 'package:ecommerceadmin/view/screen/items/viewitems.dart';
import 'package:ecommerceadmin/view/screen/language.dart';
import 'package:ecommerceadmin/view/screen/notification/viewnotification.dart';
import 'package:ecommerceadmin/view/screen/onboarding.dart';
import 'package:ecommerceadmin/view/screen/orders/archive.dart';
import 'package:ecommerceadmin/view/screen/orders/details.dart';
import 'package:ecommerceadmin/view/screen/orders/pending.dart';
import 'package:ecommerceadmin/view/screen/orders/vieworder.dart';
import 'package:ecommerceadmin/view/screen/report/reports.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: () =>   TestView()),
//  Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.notification, page: () => const NotificationView()),
  GetPage(name: AppRoute.categories, page: () => const Categories()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.addcategories, page: () => const AddCategories()),
  GetPage(name: AppRoute.editcategories, page: () => const EditCategories()),
  GetPage(name: AppRoute.additems, page: () => const AddItems()),
  GetPage(name: AppRoute.edititems, page: () => const EditItems()),
  GetPage(name: AppRoute.report, page: () => const Reports()),
  GetPage(name: AppRoute.ordershome, page: () => const OrdersHome()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.deliveryview, page: () => const DeliveryView()),
  GetPage(name: AppRoute.deliveryadd, page: () => const DeliveryAdd()),
  GetPage(name: AppRoute.deliveryedit, page: () => const DeliveryEdit()),
];
