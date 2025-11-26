import 'package:flutter/material.dart';

// Перечисление типов полей ввода
enum InputFieldType { fullName, email, password, confirmPassword }

/// Кастомный виджет TextFormField с валидацией
/// Поддерживает различные типы полей: имя, email, пароль
class CustomTextFormField extends StatefulWidget {
  final InputFieldType inputType; // Тип поля
  final String labelText; // Текст метки
  final String hintText; // Текст подсказки
  final Icon prefIcon; // Иконка слева
  final TextEditingController controller; // Контроллер для управления текстом
  final TextEditingController? passwordController; // Контроллер основного пароля для сравнения
  final TextInputAction? textInputAction; // Действие кнопки на клавиатуре
  final Function(String)? onFieldSubmitted; // Callback при нажатии Enter

  const CustomTextFormField({
    super.key,
    required this.inputType,
    required this.labelText,
    required this.hintText,
    required this.prefIcon,
    required this.controller,
    this.passwordController,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _hidePassword = true; // Флаг скрытия пароля

  /// Функция валидации поля
  String? _validator(String? value) {
    // Проверка на пустое значение
    if (value == null || value.isEmpty) {
      return "Поле не может быть пустым";
    }

    // Валидация в зависимости от типа поля
    switch (widget.inputType) {
      case InputFieldType.fullName:
      // Регулярное выражение: только буквы (латиница и кириллица) и пробелы
        final reg = RegExp(r'^[A-Za-zА-Яа-яЁё\s]+$');
        if (!reg.hasMatch(value)) {
          return "Имя должно содержать только буквы";
        }
        break;

      case InputFieldType.email:
      // Регулярное выражение для email
        final reg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!reg.hasMatch(value)) {
          return "Введите корректный email";
        }
        break;

      case InputFieldType.password:
      // Проверка: минимум 5 символов и только английские буквы
        if (value.length < 5) {
          return "Пароль должен быть не менее 5 символов";
        }
        // Регулярное выражение: только английские буквы, цифры и спецсимволы
        final hasOnlyEnglish = RegExp(r'^[A-Za-z0-9!@#$%^&*()_+\-=\[\]{};:,.<>?]+$').hasMatch(value);
        if (!hasOnlyEnglish) {
          return "Пароль должен содержать только английские символы";
        }
        break;

      case InputFieldType.confirmPassword:
      // Проверка совпадения паролей - используем контроллер для получения актуального значения
        if (widget.passwordController != null) {
          final passwordValue = widget.passwordController!.text;
          if (value != passwordValue) {
            return "Пароли не совпадают";
          }
        }
        break;
    }

    return null; // Валидация пройдена
  }

  @override
  Widget build(BuildContext context) {
    // Определяем, является ли поле паролем
    final isPassword = widget.inputType == InputFieldType.password ||
        widget.inputType == InputFieldType.confirmPassword;

    return TextFormField(
      controller: widget.controller,
      obscureText: isPassword && _hidePassword, // Скрываем текст для пароля
      keyboardType: widget.inputType == InputFieldType.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      onFieldSubmitted: widget.onFieldSubmitted,

      // Стилизация текста
      style: const TextStyle(
        color: Color(0xFF192252),
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),

      // Оформление поля
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Color(0xFF424F7B),
          fontSize: 16,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),

        // Иконка слева
        prefixIcon: widget.prefIcon,
        prefixIconColor: Color(0xFF424F7B),

        // Иконка справа (для паролей - показать/скрыть)
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility_off : Icons.visibility,
            color: Color(0xFF424F7B),
          ),
          onPressed: () {
            setState(() => _hidePassword = !_hidePassword);
          },
        )
            : null,

        // Границы в разных состояниях
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF424F7B),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF192252),
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),

        // Внутренние отступы
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
      ),

      validator: _validator, // Подключаем функцию валидации
    );
  }
}