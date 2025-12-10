import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/bloc/editors_bloc.dart';
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
      title: 'Практическая работа №7',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => LoginPage(),
        Routes.register: (context) => RegisterPage(),
        // Оборачиваем HomePage в BlocProvider и сразу отправляем событие загрузки
        Routes.home: (context) => BlocProvider(
          create: (_) => EditorsBloc()..add(LoadEditorsEvent()),
          child: const HomePage(),
        ),
        Routes.detail: (context) => const DetailPage(),
        Routes.profile: (context) => ProfilPage(),
      },
    );
  }
}