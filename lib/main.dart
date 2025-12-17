import 'package:flutter/material.dart';
import 'routes.dart';
import 'pages/loading_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home/home_page.dart';
import 'pages/detail_page.dart';
import 'pages/profil_page.dart';

// Импорт DI-контейнера
import 'di/di.dart';

void main() async {
  // Обязательно для асинхронной инициализации до runApp
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация DI-контейнера (регистрация всех зависимостей)
  // Это создает AppDatabase, EditorsRepository и настраивает EditorsBloc
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Практическая работа №8',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: Routes.loading,
      routes: {
        Routes.loading: (context) => const LoadingPage(),
        Routes.login: (context) => LoginPage(),
        Routes.register: (context) => RegisterPage(),
        // BlocProvider теперь создается внутри HomePage с использованием getIt
        Routes.home: (context) => const HomePage(),
        Routes.detail: (context) => const DetailPage(),
        Routes.profile: (context) => ProfilPage(),
      },
    );
  }
}