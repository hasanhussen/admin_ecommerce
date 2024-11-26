import 'package:ecommerceadmin/bindings/intialbindings.dart';
import 'package:ecommerceadmin/core/localization/changelocal.dart';
import 'package:ecommerceadmin/core/localization/translation.dart';
import 'package:ecommerceadmin/core/services/services.dart';
import 'package:ecommerceadmin/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'ecommerceadmin Course',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
