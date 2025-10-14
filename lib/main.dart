import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Текстовые редакторы',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TextEditorsPage(),
    );
  }
}

class TextEditorsPage extends StatefulWidget {
  @override
  _TextEditorsPageState createState() => _TextEditorsPageState();
}

class _TextEditorsPageState extends State<TextEditorsPage> {
  // Список путей к изображениям для горизонтального ListView
  final List<String> images = [
    'assets/images/editor1.jpg',
    'assets/images/editor2.jpg',
    'assets/images/editor3.jpg',
    'assets/images/editor4.jpg',
    'assets/images/editor5.jpg',
  ];

  // Список пунктов для вертикального ListView с карточками
  final List<Map<String, dynamic>> items = [
    {
      'title': 'FreeOffice',
      'description': 'Бесплатный офисный пакет для работы с документами',
      'icon': Icons.description,
    },
    {
      'title': 'LibreOffice',
      'description': 'Открытый офисный пакет с широким функционалом',
      'icon': Icons.library_books,
    },
    {
      'title': 'WPS Office',
      'description': 'Кроссплатформенный офисный пакет',
      'icon': Icons.work,
    },
    {
      'title': 'Google Docs',
      'description': 'Онлайн-редактор документов от Google',
      'icon': Icons.cloud,
    },
    {
      'title': 'Microsoft Word',
      'description': 'Профессиональный текстовый редактор',
      'icon': Icons.edit_document,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'НАЗВАНИЕ ПРИЛОЖЕНИЯ',
          style: TextStyle(
            fontFamily: 'CustomFont',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Center(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  'Название ПО',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CustomFont',
                    color: Colors.green.shade800,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Описание ПО
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Описание ПО. Текстовые редакторы — это программные приложения, предназначенные для создания, редактирования и форматирования текстовых документов.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),

            SizedBox(height: 20),

            // ЗАДАНИЕ 1: Горизонтальный ListView с изображениями со скругленными углами
            // Контейнер для горизонтального списка
            Container(
              height: 150,
              child: ListView.builder( // создание списка
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) { // создание каждого элемента списка
                  return Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) { // обработчик ошибок
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Картинка ${index + 1}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Заголовок для списка пунктов
            Text(
              'Список программ:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // ЗАДАНИЕ 2 и 3: Вертикальный ListView с карточками и SnackBar
            Expanded(
              child: ListView.builder( // Создание списка
                itemCount: items.length,
                itemBuilder: (context, index) { // создание каждого элемента списка
                  final item = items[index];
                  return Card( // каждый элемент списка является карточкой
                    elevation: 3,
                    margin: EdgeInsets.only(bottom: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile( // шаблон содержимого
                      // Иконка перед текстом
                      leading: Icon(
                        item['icon'],
                        color: Colors.green,
                        size: 32,
                      ),
                      // Название
                      title: Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Короткое описание
                      subtitle: Text(
                        item['description'],
                        style: TextStyle(fontSize: 14),
                      ),
                      // Иконка после текста
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 20,
                      ),
                      // При нажатии показывается SnackBar
                      onTap: () { // при нажатии на элемент списка
                        ScaffoldMessenger.of(context).showSnackBar( // поиск scafford
                          SnackBar( // Уведомление
                            content: Text('Выбран пункт: ${item['title']}'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                            action: SnackBarAction(
                              label: 'OK',
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            // Разделительная линия
            Divider(thickness: 1, color: Colors.grey),

            SizedBox(height: 10),

            // Информация о студенте
            Row(
              children: [
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    'ФИО номер группы',
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