import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Импорт сгенерированного файла конфигурации
import 'di.config.dart';

/// Глобальный экземпляр DI-контейнера
final getIt = GetIt.instance;

/// Функция инициализации всех зависимостей
/// Вызывается один раз при запуске приложения в main()
/// @InjectableInit() - аннотация для кодогенератора
@InjectableInit()
void configureDependencies() => getIt.init();