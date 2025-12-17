import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repositories/editors_repository.dart';
import '../../../data/database/app_database.dart';

part 'editors_event.dart';
part 'editors_state.dart';

/// BLoC для управления состоянием списка редакторов
/// @injectable - регистрируется как Factory (новый экземпляр при каждом запросе)
@injectable
class EditorsBloc extends Bloc<EditorsEvent, EditorsState> {
  // Репозиторий внедряется через конструктор (DI)
  final EditorsRepository repository;

  EditorsBloc(this.repository) : super(EditorsInitial()) {
    on<LoadEditorsEvent>(_onLoadEditors);
  }

  /// Обработчик события загрузки редакторов
  Future<void> _onLoadEditors(
      LoadEditorsEvent event,
      Emitter<EditorsState> emit,
      ) async {
    emit(EditorsLoading());

    try {
      // Получаем данные из репозитория (который работает с Drift БД)
      final editors = await repository.getAllEditors();

      if (editors.isEmpty) {
        emit(EditorsError('Список редакторов пуст'));
      } else {
        emit(EditorsLoaded(editors));
      }
    } catch (e) {
      emit(EditorsError('Ошибка загрузки: ${e.toString()}'));
    }
  }
}