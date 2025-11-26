import 'package:flutter/material.dart';
import '../routes.dart';

/// Экран заставки приложения
/// Отображается при запуске и автоматически переходит на экран авторизации через 4 секунды
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Имитация загрузки приложения (инициализация настроек, БД и т.д.)
    _navigateToLogin();
  }

  /// Переход на экран авторизации через 4 секунды
  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      // Используем pushReplacementNamed для замены текущего маршрута
      // Пользователь не сможет вернуться на экран заставки кнопкой "Назад"
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Иконка приложения
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade100,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.apps,
                  size: 80,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),

              // Название приложения
              const Text(
                'НАЗВАНИЕ ПРИЛОЖЕНИЯ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF192252),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 50),

              // Индикатор загрузки
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              const SizedBox(height: 20),

              // Текст загрузки
              const Text(
                'Загрузка...',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF424F7B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
