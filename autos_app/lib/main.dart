// import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:productos_app/models/navigation_model.dart';
import 'package:productos_app/pages/Principales/Home/pages.dart';
import 'package:productos_app/widgets/book_car.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/services/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:productos_app/preferencias/preferencias_usuario.dart';


void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final pref = PreferenciasUsurario();
  await pref.initPref();
  
  runApp(AppState());
  
  }

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
      ChangeNotifierProvider(create: (_) => AuthService()),
      ChangeNotifierProvider(create: (_) => ProductsService(AuthService())),
      ChangeNotifierProvider(create: (_) => ScoreService()),
      ChangeNotifierProvider(create: (_) => NavigationModel()),
      ChangeNotifierProvider(create: (_) => CuotasProvider())

      ],
      child: MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'checkAuth',
      routes: {
        'checkAuth': (_) => CheckAuthPage(),

        'login': (_) => LoginPage(),
        'newAcount': (_) => NewAcountPage(),
        

        'home': (_) => HomePage(),
        'principal': (_) => PrincipalPage()



      },
      scaffoldMessengerKey: NotificationsService.messagerKey,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.green[400],
          elevation: 0,
          
        )
      ),
    );
  }
}
