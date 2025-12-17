import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

// Указываем путь к сгенерированному файлу
part 'app_database.g.dart';

/// Таблица редакторов в БД
/// Drift автоматически создаст SQL-запросы на основе этого класса
class Editors extends Table {
  // Первичный ключ с автоинкрементом
  IntColumn get id => integer().autoIncrement()();

  // Название редактора
  TextColumn get title => text()();

  // Краткое описание
  TextColumn get description => text()();

  // Имя иконки (для Material Icons)
  TextColumn get icon => text()();

  // Путь к изображению в assets
  TextColumn get image => text()();
}

/// Главный класс базы данных Drift
/// @lazySingleton - создается один раз при первом обращении
@lazySingleton
@DriftDatabase(tables: [Editors])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Версия схемы БД (увеличивается при изменении структуры)
  @override
  int get schemaVersion => 1;

  /// Стратегия миграции и первоначальное заполнение данными
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      // Создаем все таблицы
      await m.createAll();

      // Первоначальное заполнение тестовыми данными
      await batch((batch) {
        batch.insertAll(editors, [
          EditorsCompanion.insert(
            title: 'FreeOffice',
            description: 'Бесплатный офисный пакет для работы с документами',
            icon: 'description',
            image: 'assets/images/editor1.jpg',
          ),
          EditorsCompanion.insert(
            title: 'LibreOffice',
            description: 'Открытый офисный пакет с широким функционалом',
            icon: 'library_books',
            image: 'assets/images/editor2.jpg',
          ),
          EditorsCompanion.insert(
            title: 'WPS Office',
            description: 'Кроссплатформенный офисный пакет',
            icon: 'business_center',
            image: 'assets/images/editor3.jpg',
          ),
          EditorsCompanion.insert(
            title: 'Google Docs',
            description: 'Облачный офисный пакет от Google',
            icon: 'cloud',
            image: 'assets/images/editor4.jpg',
          ),
          EditorsCompanion.insert(
            title: 'Microsoft Word',
            description: 'Профессиональный текстовый редактор от Microsoft',
            icon: 'edit_document',
            image: 'assets/images/editor5.jpg',
          ),
        ]);
      });
    },
  );
}

/// Функция открытия соединения с БД
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(
      name: 'editors_database.db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  });
}