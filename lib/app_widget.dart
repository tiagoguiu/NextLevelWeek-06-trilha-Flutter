import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/insert_boleto/inser_boleto_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/models/ser_model.dart';
import 'package:payflow/shared/themes/appColors.dart';

void main() {
  runApp(AppWidget());
}

//gerencia de rotas a utilizando material

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.

  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
//setando as configurações de tela para não ser possivel girar
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(),
        "/extra": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null ? ModalRoute.of(context)!.settings.arguments.toString() : null,
            ),
      },
    );
  }
}
