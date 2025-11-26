import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../routes.dart';

/// Основной экран приложения с навигацией
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Индекс выбранного пункта в NavigationBar

  // Список изображений для горизонтального ListView
  final List<String> images = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/LibreOffice_Logo.svg/200px-LibreOffice_Logo.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/WPS_Office_logo.svg/200px-WPS_Office_logo.svg.png',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/FreeOffice_logo.svg/200px-FreeOffice_logo.svg.png',
  ];

  // Список пунктов программ
  final List<Map<String, String>> items = [
    {
      'title': 'FreeOffice',
      'description': 'Бесплатный офисный пакет для работы с документами',
      'icon': 'description',
    },
    {
      'title': 'LibreOffice',
      'description': 'Открытый офисный пакет с широким функционалом',
      'icon': 'library_books',
    },
    {
      'title': 'WPS Office',
      'description': 'Кроссплатформенный офисный пакет',
      'icon': 'business_center',
    },
    {
      'title': 'Google Docs',
      'description': 'Облачный офисный пакет от Google',
      'icon': 'cloud',
    },
  ];

  /// Получение иконки по имени
  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'description':
        return Icons.description;
      case 'library_books':
        return Icons.library_books;
      case 'business_center':
        return Icons.business_center;
      case 'cloud':
        return Icons.cloud;
      default:
        return Icons.apps;
    }
  }

  /// Показать SnackBar с названием выбранного пункта
  void _showSnackBar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Выбран пункт: $title'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'OK',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  /// Обработка нажатия на пункт списка
  void _onItemTap(int index) {
    final item = items[index];
    _showSnackBar(item['title']!);
    
    // Переход на экран детализации
    Navigator.pushNamed(
      context,
      Routes.detail,
      arguments: item, // Передаем данные пункта
    );
  }

  /// Виджет с основным содержимым экрана
  Widget _buildMainContent(bool isWideScreen, double platformPadding) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Название ПО',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF192252),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Описание ПО
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                'Описание ПО. Текстовые редакторы — это программные приложения, предназначенные для создания, редактирования и форматирования текстовых документов.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF424F7B),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Горизонтальный ListView с изображениями
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback при ошибке загрузки
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
                                  const Icon(
                                    Icons.image,
                                    size: 40,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Картинка ${index + 1}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
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
            SizedBox(height: platformPadding), // Адаптивный отступ

            // Заголовок списка программ
            const Text(
              'Список программ:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF192252),
              ),
            ),
            const SizedBox(height: 12),

            // Вертикальный список или сетка в зависимости от ширины экрана
            isWideScreen
                ? _buildGridView(platformPadding)
                : _buildListView(platformPadding),
          ],
        ),
      ),
    );
  }

  /// Виджет ListView для узких экранов
  Widget _buildListView(double platformPadding) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 3,
          margin: EdgeInsets.only(bottom: platformPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            leading: Icon(
              _getIcon(item['icon']!),
              color: Colors.green,
              size: 32,
            ),
            title: Text(
              item['title']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              item['description']!,
              style: const TextStyle(fontSize: 14),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 20,
            ),
            onTap: () => _onItemTap(index),
          ),
        );
      },
    );
  }

  /// Виджет GridView для широких экранов (2 столбца)
  Widget _buildGridView(double platformPadding) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 столбца
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5, // Соотношение сторон карточки
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            onTap: () => _onItemTap(index),
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _getIcon(item['icon']!),
                    color: Colors.green,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      item['description']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Виджет с профилем (заглушка)
  Widget _buildProfileContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_circle,
            size: 100,
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          const Text(
            'Профиль пользователя',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'ФИО номер группы',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF424F7B),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
              // Переход на полный экран профиля
              Navigator.pushNamed(context, Routes.profile);
            },
            icon: const Icon(Icons.settings),
            label: const Text('Настройки профиля'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Определяем ширину экрана для адаптивного дизайна
    final mediaQuery = MediaQuery.of(context);
    final isWideScreen = mediaQuery.size.width > 600;

    // Определяем платформу для адаптивных отступов
    final double platformPadding = (kIsWeb ||
            Platform.isMacOS ||
            Platform.isLinux ||
            Platform.isWindows)
        ? 20 // Больший отступ для десктоп и веб
        : 12; // Стандартный отступ для мобильных

    // Список экранов для NavigationBar
    final List<Widget> screens = [
      _buildMainContent(isWideScreen, platformPadding),
      _buildProfileContent(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'НАЗВАНИЕ ПРИЛОЖЕНИЯ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.green.shade50,
        indicatorColor: Colors.green.shade100,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 500),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
