import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Ключ формы для валидации
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для полей ввода
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Функция отправки формы
  void _submit(BuildContext context) {
    // Проверяем валидность всех полей формы
    if (_formKey.currentState!.validate()) {
      // Если все поля валидны, показываем уведомление
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Вход выполнен!\nEmail: ${_emailController.text}",
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey, // Привязываем ключ формы
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Приветственный текст
                  const Text(
                    "Добро пожаловать!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF192252),
                    ),
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    "Войдите в свой аккаунт",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF424F7B),
                    ),
                  ),
                  const SizedBox(height: 8),

                  const Text(
                    "Или создайте новый",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF424F7B),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Поле Email
                  CustomTextFormField(
                    inputType: InputFieldType.email,
                    labelText: "Email",
                    hintText: "example@mail.com",
                    prefIcon: const Icon(Icons.email),
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      // При нажатии Enter переходим к следующему полю
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 20),

                  // Поле Пароль
                  CustomTextFormField(
                    inputType: InputFieldType.password,
                    labelText: "Пароль",
                    hintText: "Введите пароль",
                    prefIcon: const Icon(Icons.security),
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      // При нажатии Enter отправляем форму
                      _submit(context);
                    },
                  ),
                  const SizedBox(height: 12),

                  // Ссылка "Забыли пароль?"
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Функция восстановления пароля"),
                          ),
                        );
                      },
                      child: const Text(
                        "Забыли пароль?",
                        style: TextStyle(
                          color: Color(0xFF424F7B),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Кнопка "Войти"
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () => _submit(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        "Войти",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Разделитель
                  const Divider(
                    color: Color(0xFF424F7B),
                    thickness: 1,
                  ),
                  const SizedBox(height: 20),

                  // Ссылка на регистрацию
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Нет аккаунта? ",
                        style: TextStyle(
                          color: Color(0xFF424F7B),
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Переход на экран регистрации
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text(
                          "Зарегистрируйтесь",
                          style: TextStyle(
                            color: Color(0xFF192252),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Для тестирования экрана отдельно
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}