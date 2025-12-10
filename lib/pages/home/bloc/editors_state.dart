part of 'editors_bloc.dart';

/// Базовый класс состояний для EditorsBloc
@immutable
sealed class EditorsState {}

/// Начальное состояние - ничего не загружено
final class EditorsInitial extends EditorsState {}

/// Состояние загрузки - отображается индикатор
final class EditorsLoading extends EditorsState {}

/// Состояние успешной загрузки - получен список редакторов
final class EditorsLoaded extends EditorsState {
  final List<Editor> editors;

  EditorsLoaded(this.editors);
}

/// Состояние ошибки - произошла ошибка при загрузке
final class EditorsError extends EditorsState {
  final String message;

  EditorsError(this.message);
}