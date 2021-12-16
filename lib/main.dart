
import 'package:elancer_second_proj/prefs/shared_pref_controller.dart';
import 'package:elancer_second_proj/screens/auth/activate_screen.dart';
import 'package:elancer_second_proj/screens/auth/login_screen.dart';
import 'package:elancer_second_proj/screens/auth/password/forget_password_screen.dart';
import 'package:elancer_second_proj/screens/auth/register_screen.dart';
import 'package:elancer_second_proj/screens/bn_screens/categories_screen.dart';
import 'package:elancer_second_proj/screens/bn_screens/profile_screen.dart';
import 'package:elancer_second_proj/screens/launch_screen.dart';
import 'package:elancer_second_proj/screens/main_screen.dart';
import 'package:elancer_second_proj/screens/out_boarding_screen.dart';
import 'package:elancer_second_proj/screens/home_products_screen.dart';
import 'package:elancer_second_proj/screens/settings_screen/about_screen.dart';
import 'package:elancer_second_proj/screens/settings_screen/change_password.dart';
import 'package:elancer_second_proj/screens/settings_screen/contact_us_screen.dart';
import 'package:elancer_second_proj/screens/settings_screen/edit_screen.dart';
import 'package:elancer_second_proj/screens/settings_screen/faqs_screen.dart';
import 'package:elancer_second_proj/screens/settings_screen/language_screen.dart';
import 'package:elancer_second_proj/screens/settings_screen/profile_screen.dart';
import 'package:elancer_second_proj/screens/sub_categories_screen.dart';
import 'package:elancer_second_proj/screens/test.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/launch_screen'   ,
        routes: {
          '/login_screen':(context)=> const LoginScreen(),
         '/register_screen':(context)=> const RegisterScreen(),
          '/activate_screen':(context)=> const ActivateScreen(),
          '/froget_password_screen':(context)=> const ForgetPasswordScreen(),
          '/out_boarding_screen':(context)=> const OutBoardingScreen(),
          '/launch_screen':(context)=> const LaunchScreen(),
          '/main_screen':(context)=> const MainScreen(),
          '/categories_screen':(context)=> const CategoriesScreen(),
          //'/products_screen':(context)=> const HomeProductsScreen(),
          //'/test_screen':(context)=> const Test(),
         // '/sub_categories_screen':(context)=> const SubCategoriesScreen(),
          '/language_screen':(context)=> const LanguageScreen(),
          '/profile_screen':(context)=> const EditProfileScreen(),
          '/edit_screen':(context)=> const EditScreen(),
          '/change_password_screen':(context)=> const ChangePassword(),
          '/faqs_screen':(context)=> const FaqsScreen(),
          '/contact_us_screen':(context)=> const ContactUsScreen(),
          '/about_screen':(context)=> const AboutScreen(),













        }
    );
  }
}
