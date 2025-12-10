import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/editor.dart';
import '../../routes.dart';
import 'bloc/editors_bloc.dart';

/// Основной экран приложения с навигацией и BLoC
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Список изображений для горизонтального ListView
  final List<String> images = [
    'assets/images/editor1.jpg',
    'assets/images/editor2.jpg',
    'assets/images/editor3.jpg',
    'assets/images/editor4.jpg',
    'assets/images/editor5.jpg',
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
      case 'edit_document':
        return Icons.edit_document;
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
  void _onItemTap(Editor editor) {
    _showSnackBar(editor.title);

    // Переход на экран детализации с передачей данных
    Navigator.pushNamed(
      context,
      Routes.detail,
      arguments: {
        'title': editor.title,
        'description': editor.description,
        'icon': editor.icon,
        'image': editor.image,
      },
    );
  }

  /// Виджет для отображения изображения с fallback
  Widget _buildImageWidget(String imagePath,
      {double? width, double? height, BoxFit fit = BoxFit.cover}) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, size: 40, color: Colors.grey),
                SizedBox(height: 8),
                Text('Картинка',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Виджет с основным содержимым экрана (использует BLoC)
  Widget _buildMainContent(bool isWideScreen, double platformPadding) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  'Текстовые редакторы',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF192252),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Описание
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                'Текстовые редакторы — это программные приложения, предназначенные для создания, редактирования и форматирования текстовых документов.',
                style: TextStyle(fontSize: 14, color: Color(0xFF424F7B)),
              ),
            ),
            const SizedBox(height: 16),

            // Горизонтальный ListView с изображениями
            SizedBox(
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
                      child: _buildImageWidget(images[index],
                          width: 200, height: 150),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: platformPadding),

            // Заголовок списка
            const Text(
              'Список программ:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF192252),
              ),
            ),
            const SizedBox(height: 12),

            // BlocBuilder для отображения списка на основе состояния
            BlocBuilder<EditorsBloc, EditorsState>(
              builder: (context, state) {
                // Состояние: Загрузка
                if (state is EditorsLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: CircularProgressIndicator(color: Colors.green),
                    ),
                  );
                }

                // Состояние: Ошибка
                if (state is EditorsError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          const Icon(Icons.error_outline,
                              size: 60, color: Colors.red),
                          const SizedBox(height: 16),
                          Text(
                            state.message,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<EditorsBloc>()
                                  .add(LoadEditorsEvent());
                            },
                            child: const Text('Повторить'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                // Состояние: Данные загружены
                if (state is EditorsLoaded) {
                  final editors = state.editors;

                  if (editors.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text('Список пуст',
                            style: TextStyle(fontSize: 16)),
                      ),
                    );
                  }

                  // Отображаем список или сетку
                  return isWideScreen
                      ? _buildGridView(editors, platformPadding)
                      : _buildListView(editors, platformPadding);
                }

                // Начальное состояние (Initial) - fallback
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text('Загрузка данных...',
                        style: TextStyle(fontSize: 16)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Виджет ListView для узких экранов
  Widget _buildListView(List<Editor> editors, double platformPadding) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: editors.length,
      itemBuilder: (context, index) {
        final editor = editors[index];
        return Card(
          elevation: 3,
          margin: EdgeInsets.only(bottom: platformPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 50,
                height: 50,
                child: _buildImageWidget(editor.image, width: 50, height: 50),
              ),
            ),
            title: Text(
              editor.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(editor.description,
                style: const TextStyle(fontSize: 14)),
            trailing: const Icon(Icons.arrow_forward_ios,
                color: Colors.grey, size: 20),
            onTap: () => _onItemTap(editor),
          ),
        );
      },
    );
  }

  /// Виджет GridView для широких экранов
  Widget _buildGridView(List<Editor> editors, double platformPadding) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
      ),
      itemCount: editors.length,
      itemBuilder: (context, index) {
        final editor = editors[index];
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            onTap: () => _onItemTap(editor),
            borderRadius: BorderRadius.circular(8.0),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child:
                      _buildImageWidget(editor.image, width: 60, height: 60),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    editor.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      editor.description,
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

  /// Виджет с профилем
  Widget _buildProfileContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle, size: 100, color: Colors.green),
          const SizedBox(height: 20),
          const Text(
            'Профиль пользователя',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Королев Артем Вадимович',
            style: TextStyle(fontSize: 16, color: Color(0xFF424F7B)),
          ),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {
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
    final mediaQuery = MediaQuery.of(context);
    final isWideScreen = mediaQuery.size.width > 600;

    final double platformPadding =
    (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows)
        ? 20
        : 12;

    final List<Widget> screens = [
      _buildMainContent(isWideScreen, platformPadding),
      _buildProfileContent(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ТЕКСТОВЫЕ РЕДАКТОРЫ',
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