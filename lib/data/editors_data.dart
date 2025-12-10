import '../models/editor.dart';

/// Список текстовых редакторов (имитация данных)
final List<Editor> editorsData = [
  Editor(
    title: 'FreeOffice',
    description: 'Бесплатный офисный пакет для работы с документами',
    icon: 'description',
    image: 'assets/images/editor1.jpg',
  ),
  Editor(
    title: 'LibreOffice',
    description: 'Открытый офисный пакет с широким функционалом',
    icon: 'library_books',
    image: 'assets/images/editor2.jpg',
  ),
  Editor(
    title: 'WPS Office',
    description: 'Кроссплатформенный офисный пакет',
    icon: 'business_center',
    image: 'assets/images/editor3.jpg',
  ),
  Editor(
    title: 'Google Docs',
    description: 'Облачный офисный пакет от Google',
    icon: 'cloud',
    image: 'assets/images/editor4.jpg',
  ),
  Editor(
    title: 'Microsoft Word',
    description: 'Профессиональный текстовый редактор от Microsoft',
    icon: 'edit_document',
    image: 'assets/images/editor5.jpg',
  ),
];