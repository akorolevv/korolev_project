import 'package:flutter/material.dart';
import 'routes.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Практическая работа №6',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      // Начальный маршрут - экран заставки
      initialRoute: Routes.loading,
      // Определение всех маршрутов приложения
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => LoginPage(),
        Routes.register: (context) => RegisterPage(),
        Routes.home: (context) => const HomePage(),
        Routes.detail: (context) => const DetailPage(),
        Routes.profile: (context) => ProfilPage(),
      },
    );
  }
}
