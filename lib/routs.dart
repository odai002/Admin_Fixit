
import 'package:dash_fixit/view/Screen/home.dart';
import 'package:dash_fixit/view/Screen/sign_in.dart';
import 'package:dash_fixit/view/Screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'Core/constant/route.dart';


List<GetPage<dynamic>>? routes =[
  //Splach
/*
  GetPage(name:'/' , page: () =>const Language()),
*/
  GetPage(name:'/', page: () =>const SplachScreen()),

// Auth
  GetPage(name:AppRoute.SignIn , page: () => const SignIn()),
  GetPage(name:AppRoute.HomePage , page: () => const HomePage()),

];


