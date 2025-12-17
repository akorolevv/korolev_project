part of 'editors_bloc.dart';

/// Базовый класс состояний для EditorsBloc
@immutable
sealed class EditorsState {}

/// Начальное состояние
final class EditorsInitial extends EditorsState {}

/// Состояние загрузки
final class EditorsLoading extends EditorsState {}

/// Состояние успешной загрузки
/// Используем тип Editor из Drift (сгенерированный класс)
final class EditorsLoaded extends EditorsState {
  final List<Editor> editors;

  EditorsLoaded(this.editors);
}

/// Состояние ошибки
final class EditorsError extends EditorsState {
  final String message;

  EditorsError(this.message);
}