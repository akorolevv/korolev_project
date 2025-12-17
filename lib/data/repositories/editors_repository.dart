import 'package:injectable/injectable.dart';
import '../database/app_database.dart';

/// Репозиторий для работы с редакторами
/// Реализует паттерн Repository - абстрагирует слой данных от бизнес-логики
/// @lazySingleton - один экземпляр на всё приложение
@lazySingleton
class EditorsRepository {
  final AppDatabase _db;

  // Внедрение зависимости через конструктор
  EditorsRepository(this._db);

  /// Получить все редакторы из БД
  Future<List<Editor>> getAllEditors() async {
    return _db.select(_db.editors).get();
  }

  /// Получить редактор по ID
  Future<Editor?> getEditorById(int id) async {
    return (_db.select(_db.editors)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// Добавить новый редактор
  Future<int> addEditor({
    required String title,
    required String description,
    required String icon,
    required String image,
  }) async {
    return _db.into(_db.editors).insert(
      EditorsCompanion.insert(
        title: title,
        description: description,
        icon: icon,
        image: image,
      ),
    );
  }

  /// Обновить редактор
  Future<bool> updateEditor(Editor editor) async {
    return _db.update(_db.editors).replace(editor);
  }

  /// Удалить редактор по ID
  Future<int> deleteEditor(int id) async {
    return (_db.delete(_db.editors)..where((t) => t.id.equals(id))).go();
  }

  /// Поиск редакторов по названию (регистронезависимый)
  Future<List<Editor>> searchEditors(String query) async {
    final allEditors = await getAllEditors();
    return allEditors
        .where((e) => e.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}