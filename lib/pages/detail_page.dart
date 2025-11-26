import 'package:flutter/material.dart';

/// Экран детализации пункта
/// Отображает подробную информацию о выбранном программном обеспечении
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем данные, переданные из предыдущего экрана
    final Map<String, String>? item =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    // Если данные не переданы, показываем заглушку
    if (item == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Детали'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('Данные не найдены'),
        ),
      );
    }

    // Получение иконки (используется как fallback)
    IconData icon;
    switch (item['icon']) {
      case 'description':
        icon = Icons.description;
        break;
      case 'library_books':
        icon = Icons.library_books;
        break;
      case 'business_center':
        icon = Icons.business_center;
        break;
      case 'cloud':
        icon = Icons.cloud;
        break;
      case 'edit_document':
        icon = Icons.edit_document;
        break;
      default:
        icon = Icons.apps;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ПУНКТ ${item['title']?.toUpperCase() ?? 'N'}'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Карточка с изображением
              Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: item['image'] != null
                        ? Image.asset(
                      item['image']!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback на иконку при ошибке загрузки
                        return Center(
                          child: Icon(
                            icon,
                            size: 100,
                            color: Colors.green,
                          ),
                        );
                      },
                    )
                        : Center(
                      child: Icon(
                        icon,
                        size: 100,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Название
              const Text(
                'Название:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424F7B),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['title'] ?? 'Неизвестно',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF192252),
                ),
              ),
              const SizedBox(height: 24),

              // Описание
              const Text(
                'Описание:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424F7B),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Text(
                  item['description'] ?? 'Описание отсутствует',
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF192252),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Дополнительная информация
              const Text(
                'Дополнительная информация:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF424F7B),
                ),
              ),
              const SizedBox(height: 12),

              _buildInfoRow(Icons.check_circle, 'Кроссплатформенность', 'Да'),
              _buildInfoRow(Icons.language, 'Язык интерфейса', 'Русский, English'),
              _buildInfoRow(Icons.star, 'Рейтинг', '4.5/5'),
              _buildInfoRow(Icons.download, 'Загрузки', '1M+'),

              const SizedBox(height: 40),

              // Кнопка "Назад"
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text(
                    'Вернуться назад',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Виджет для строки с информацией
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF424F7B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF192252),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}