// lib/core/constants/app_constants.dart

abstract class AppConstants {
  // --- Kahve Tercihleri ---

  static const List<String> temperatureOptions = ['Sıcak', 'Soğuk'];

  static const List<String> bodyOptions = ['Hafif', 'Orta', 'Yoğun'];

  static const List<String> aromaOptions = [
    'Çikolata',
    'Meyvemsi',
    'Fındıksı',
    'Karamel',
    'Baharatlı',
    'Çiçeksi'
  ];

  // --- UI/UX Sabitleri (Örnek) ---

  static const double horizontalPadding = 16.0;
  static const double verticalSpacing = 20.0;
}
