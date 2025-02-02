
import 'package:dash_fixit/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/localization/changelocal.dart';
import 'Core/localization/translation.dart';
import 'Core/services/myservices.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return  SafeArea(
      child: GetMaterialApp(
        locale:controller.Language,
        translations: MyTranslation(),
        debugShowCheckedModeBanner: false,
        getPages:routes,
      ),
    );
  }
}
