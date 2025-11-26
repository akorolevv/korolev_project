import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class ProfilPage extends StatelessWidget {
  ProfilPage({super.key});

  // Ключ формы для валидации
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для полей ввода с начальными значениями
  final _fullNameController = TextEditingController(text: "Королев Артем Вадимович");
  final _emailController = TextEditingController(text: "test123@mail.ru");

  /// Функция сохранения изменений профиля
  void _saveProfile(BuildContext context) {
    // Проверяем валидность всех полей формы
    if (_formKey.currentState!.validate()) {
      // Если все поля валидны, показываем уведомление
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Профиль сохранен!\n"
                "ФИО: ${_fullNameController.text}\n"
                "Email: ${_emailController.text}",
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
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Профиль",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey, // Привязываем ключ формы
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // Аватар пользователя
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        // Placeholder изображение с собакой
                        'https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=400',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Если изображение не загрузилось, показываем иконку
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.grey,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          // Показываем индикатор загрузки
                          if (loadingProgress == null) return child;
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Поле ФИО (для чтения и редактирования)
                  CustomTextFormField(
                    inputType: InputFieldType.fullName,
                    labelText: "ФИО",
                    hintText: "Ваше полное имя",
                    prefIcon: const Icon(Icons.person),
                    controller: _fullNameController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      // Переходим к следующему полю
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  const SizedBox(height: 20),

                  // Поле Email (для чтения и редактирования)
                  CustomTextFormField(
                    inputType: InputFieldType.email,
                    labelText: "Email",
                    hintText: "example@mail.com",
                    prefIcon: const Icon(Icons.email),
                    controller: _emailController,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      // При нажатии Enter сохраняем профиль
                      _saveProfile(context);
                    },
                  ),
                  const SizedBox(height: 40),

                  // Кнопка "Сохранить"
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _saveProfile(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        "Сохранить",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Дополнительные опции профиля (опционально)
                  TextButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Функция изменения аватара"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.camera_alt, color: Color(0xFF424F7B)),
                    label: const Text(
                      "Изменить фото профиля",
                      style: TextStyle(
                        color: Color(0xFF424F7B),
                        fontSize: 16,
                      ),
                    ),
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
