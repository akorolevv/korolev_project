import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/editors_data.dart';
import '../../../models/editor.dart';

part 'editors_event.dart';
part 'editors_state.dart';

/// BLoC для управления состоянием списка редакторов
class EditorsBloc extends Bloc<EditorsEvent, EditorsState> {

  /// Конструктор: устанавливаем начальное состояние и регистрируем обработчики
  EditorsBloc() : super(EditorsInitial()) {
    // Регистрация обработчика для события LoadEditorsEvent
    on<LoadEditorsEvent>(_onLoadEditors);
  }

  /// Обработчик события загрузки редакторов
  Future<void> _onLoadEditors(
      LoadEditorsEvent event,
      Emitter<EditorsState> emit,
      ) async {
    // Переходим в состояние загрузки
    emit(EditorsLoading());

    try {
      // Имитация задержки загрузки данных (например, из сети или БД)
      await Future.delayed(const Duration(milliseconds: 800));

      // Проверяем, есть ли данные
      if (editorsData.isEmpty) {
        emit(EditorsError('Список редакторов пуст'));
      } else {
        // Успешная загрузка - передаем список редакторов
        emit(EditorsLoaded(editorsData));
      }
    } catch (e) {
      // В случае ошибки переходим в состояние ошибки
      emit(EditorsError('Ошибка загрузки: ${e.toString()}'));
    }
  }
}