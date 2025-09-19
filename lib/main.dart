import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Устанавливаем заголовок приложения (отображается в диспетчере задач)
      title: 'Текстовые редакторы',
      // Настраиваем тему приложения
      theme: ThemeData(
        // Основной цвет приложения - зеленый
        primarySwatch: Colors.green,
      ),
      // Устанавливаем домашнюю страницу приложения
      home: TextEditorsPage(),
    );
  }
}

// Определяем класс TextEditorsPage - основная страница приложения
class TextEditorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold - базовый каркас экрана
    return Scaffold(
      // Настраиваем верхнюю панель приложения
      appBar: AppBar(
        title: Text('Текстовые редакторы'),
        // Центрируем заголовок
        centerTitle: true,
        // Устанавливаем зеленый фон для AppBar
        backgroundColor: Colors.green,
        // Устанавливаем белый цвет текста в AppBar
        foregroundColor: Colors.white,
      ),
      // Определяем основное содержимое экрана
      body: Padding(
        // отступы со всех сторон по 16 пикселей
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                // Растягиваем контейнер на всю ширину
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.green),
                ),
                // Текст заголовка
                child: Text(
                  'Текстовые редакторы',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800,
                  ),
                ),
              ),
            ),

            // Добавляем вертикальный отступ 20 пикселей
            SizedBox(height: 20),

            // БЛОК 2: Описание предметной области
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Текст описания
              child: Text(
                'Текстовые редакторы — это программные приложения, предназначенные для создания, редактирования и форматирования текстовых документов. Они являются основным инструментом для работы с текстом в различных сферах деятельности.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),

            // Вертикальный отступ
            SizedBox(height: 20),

            // БЛОК 3: Горизонтальный ряд с изображением и списком
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ЛЕВАЯ ЧАСТЬ: Изображение (иконка)
                // Expanded заставляет виджет занять доступное пространство
                Expanded(
                  // flex: 1 означает, что этот элемент займет 1 часть от доступного места
                  flex: 1,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.description,
                        size: 80,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 16),

                // ПРАВАЯ ЧАСТЬ: Список примеров
                Expanded(
                  // Также занимает 1 часть пространства
                  flex: 1,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    // Вертикальный столбец со списком
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('1. Microsoft Word', style: TextStyle(fontSize: 14)),
                        Text('2. Google Docs', style: TextStyle(fontSize: 14)),
                        Text('3. Notepad++', style: TextStyle(fontSize: 14)),
                        Text('4. Sublime Text', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // БЛОК 4: Разделительная линия
            Divider(thickness: 1, color: Colors.grey),

            SizedBox(height: 10),

            // БЛОК 5: Информация о студенте
            Row(
              children: [
                // Контейнер с иконкой пользователя
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.grey.shade600,
                    size: 24,
                  ),
                ),
                SizedBox(width: 12),
                // Контейнер с информацией о студенте
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  // Текст с ФИО и группой
                  child: Text(
                    'Королев А.В. группа ИКБО-26-22',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}