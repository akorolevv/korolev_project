import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // Ключ формы для валидации
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для полей ввода
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  /// Функция отправки формы регистрации
  void _submit(BuildContext context) {
    // Проверяем валидность всех полей формы
    if (_formKey.currentState!.validate()) {
      // Если все поля валидны, показываем уведомление
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Регистрация успешна!\n"
                "ФИО: ${_fullNameController.text}\n"
                "Email: ${_emailController.text}",
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
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
                  // Заголовок
                  const Text(
                    "Регистрация",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF192252),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Поле ФИО
                  CustomTextFormField(
                    inputType: InputFieldType.fullName,
                    labelText: "ФИО",
                    hintText: "Иванов Иван Иванович",
                    prefIcon: const Icon(Icons.person),
                    controller: _fullNameController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      // Переходим к следующему полю
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 20),

                  // Поле Email
                  CustomTextFormField(
                    inputType: InputFieldType.email,
                    labelText: "Email",
                    hintText: "example@mail.com",
                    prefIcon: const Icon(Icons.email),
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 20),

                  // Поле Пароль
                  CustomTextFormField(
                    inputType: InputFieldType.password,
                    labelText: "Пароль",
                    hintText: "Минимум 6 символов",
                    prefIcon: const Icon(Icons.security),
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 20),

                  // Поле Повторите пароль
                  CustomTextFormField(
                    inputType: InputFieldType.confirmPassword,
                    labelText: "Повторите пароль",
                    hintText: "Введите пароль еще раз",
                    prefIcon: const Icon(Icons.security),
                    controller: _confirmPasswordController,
                    // Передаем пароль для сравнения
                    passwordToMatch: _passwordController.text,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      // При нажатии Enter отправляем форму
                      _submit(context);
                    },
                  ),
                  const SizedBox(height: 30),

                  // Кнопка "Зарегистрироваться"
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
                        "Зарегистрироваться",
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

                  // Ссылка на вход
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Уже есть аккаунт? ",
                        style: TextStyle(
                          color: Color(0xFF424F7B),
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Переход на экран входа
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          "Войдите",
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
    home: RegisterPage(),
  ));
}