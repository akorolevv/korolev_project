part of 'editors_bloc.dart';

/// Базовый класс событий для EditorsBloc
@immutable
sealed class EditorsEvent {}

/// Событие: Загрузить список редакторов
final class LoadEditorsEvent extends EditorsEvent {}