import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/profil_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Практическая работа №5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Используем стандартный шрифт системы
      ),
      // Стартовая страница - меню выбора экрана
      home: HomePage(),
      // Определение маршрутов для навигации
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilPage(),
      },
    );
  }
}

/// Главная страница с кнопками для перехода на разные экраны
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Практическая работа №5',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Заголовок
                const Icon(
                  Icons.mobile_friendly,
                  size: 80,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Формы ввода и валидация',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF192252),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Выберите экран для просмотра',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF424F7B),
                  ),
                ),
                const SizedBox(height: 50),

                // Кнопка "Авторизация"
                _buildNavigationButton(
                  context: context,
                  icon: Icons.login,
                  label: 'Авторизация',
                  route: '/login',
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),

                // Кнопка "Регистрация"
                _buildNavigationButton(
                  context: context,
                  icon: Icons.person_add,
                  label: 'Регистрация',
                  route: '/register',
                  color: Colors.green,
                ),
                const SizedBox(height: 16),

                // Кнопка "Профиль"
                _buildNavigationButton(
                  context: context,
                  icon: Icons.account_circle,
                  label: 'Профиль',
                  route: '/profile',
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Виджет кнопки навигации
  Widget _buildNavigationButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String route,
    required Color color,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: () {
          // Переход на выбранный экран
          Navigator.pushNamed(context, route);
        },
        icon: Icon(icon, size: 28),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
        ),
      ),
    );
  }
}