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

// Изменяем на StatefulWidget для управления состоянием изображений
class TextEditorsPage extends StatefulWidget {
  @override
  _TextEditorsPageState createState() => _TextEditorsPageState();
}

class _TextEditorsPageState extends State<TextEditorsPage> {
  // Переменная для отслеживания текущего изображения
  int currentImageIndex = 0;

  // Список путей к изображениям
  List<String> images = [
    'assets/images/editor1.png',
    'assets/images/editor2.png',
    'assets/images/editor3.jpg',
    'assets/images/editor4.jpg',
    'assets/images/editor5.jpg',
  ];

  // Функция для циклической смены изображений
  void changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold - базовый каркас экрана
    return Scaffold(
      // Настраиваем верхнюю панель приложения с кастомным шрифтом
      appBar: AppBar(
        title: Text(
          'Текстовые редакторы',
          style: TextStyle(
            fontFamily: 'CustomFont', // Используем кастомный шрифт
            fontWeight: FontWeight.w700,
          ),
        ),
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
                // Текст заголовка с кастомным шрифтом
                child: Text(
                  'Текстовые редакторы',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFont', // Используем кастомный шрифт
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
                // ЛЕВАЯ ЧАСТЬ: Изображение (заменяем иконку на изображения)
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    // Обработчик нажатия для смены изображения
                    onTap: changeImage,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          images[currentImageIndex], // Отображаем текущее изображение
                          fit: BoxFit.cover, // Изображение заполняет контейнер
                          // Обработчик ошибки, если изображение не найдено
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Изображение\nне найдено',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 16),

                // ПРАВАЯ ЧАСТЬ: Список примеров
                Expanded(
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
                        Text('1. FreeOffice', style: TextStyle(fontSize: 14)),
                        Text('2. LibreOffice', style: TextStyle(fontSize: 14)),
                        Text('3. WPSOffice', style: TextStyle(fontSize: 14)),
                        Text('4. GoogleDocs', style: TextStyle(fontSize: 14)),
                        Text('5. MicrosoftWord', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Добавляем кнопку для альтернативного способа смены изображений
            Center(
              child: ElevatedButton(
                onPressed: changeImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text('Сменить изображение (${currentImageIndex + 1}/${images.length})'),
              ),
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