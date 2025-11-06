// Bu bir Interface (arayüz) görevini görecektir.
abstract class CoffeeLocalDataSource {
  Future<List<Map<String, dynamic>>> getAllCoffeeProfiles();
  // İleride buraya başka metotlar ekleyebiliriz: (Sözlük, Favoriler vb.)
  // YENİ: Sözlük verilerini çekme metodu
  Future<List<Map<String, dynamic>>> getDictionaryData();
}

// Somut implementasyon
class CoffeeLocalDataSourceImpl implements CoffeeLocalDataSource {
  static const List<Map<String, dynamic>> _staticDictionaryData = [
    {
      "term": "Asidite",
      "description":
          "Kahve çekirdeğinde bulunan doğal ekşilik ve parlaklık hissidir. Limon veya elma notaları olarak hissedilebilir. Yüksek asidite kaliteli kahve işaretidir.",
      "category": "Tadım"
    },
    {
      "term": "Gövde (Body)",
      "description":
          "Kahveyi ağızda tuttuğunuzda hissedilen ağırlık, kalınlık veya dolgunluktur. Tam yağlı süt, yoğun gövdeye örnektir.",
      "category": "Tadım"
    },
    {
      "term": "Etiyopya",
      "description":
          "Kahvenin anavatanıdır. Genellikle parlak asidite, hafif gövde ve güçlü meyvemsi/çiçeksi aromalar sunar.",
      "category": "Köken"
    },
    // ... Diğer terimler ...
  ];
  // Örnek statik kahve veri listesi (Bu, gerçek dünyada bir JSON dosyasından gelirdi)
  static const List<Map<String, dynamic>> _staticCoffeeProfiles = [
    {
      "id": "1",
      "name": "Etiyopya V60 (Filtre)",
      "body": "Hafif",
      "temperature": "Sıcak",
      "aromas": ["Meyvemsi", "Çiçeksi"],
      "origin": "Etiyopya",
      "explanation":
          "Meyvemsi tatları sevenler için ideal, gövdesi hafif ve temiz içimli bir deneyim sunar."
    },
    {
      "id": "2",
      "name": "Kolombiya Espresso",
      "body": "Orta",
      "temperature": "Sıcak",
      "aromas": ["Çikolata", "Karamel", "Fındıksı"],
      "origin": "Kolombiya",
      "explanation":
          "Dengeli, çikolata notalı ve orta gövdeli yapısıyla sütün tadını bastırmayan klasik bir espresso bazlı kahvedir."
    },
    {
      "id": "3",
      "name": "Cold Brew",
      "body": "Yoğun",
      "temperature": "Soğuk",
      "aromas": ["Çikolata", "Baharatlı"],
      "origin": "Karışım",
      "explanation":
          "Yoğun ve sert kahveyi soğuk sevenler için mükemmel bir seçimdir. Asiditesi düşük olduğu için mideyi rahatsız etmez."
    },
    // ... Uygulamanızı geliştirirken buraya daha fazla profil ekleyebilirsiniz ...
  ];

  @override
  Future<List<Map<String, dynamic>>> getAllCoffeeProfiles() async {
    // Gerçek bir veritabanı gecikmesini simüle etmek için küçük bir gecikme ekleyebiliriz
    await Future.delayed(const Duration(milliseconds: 200));
    return _staticCoffeeProfiles;
  }

  @override
  Future<List<Map<String, dynamic>>> getDictionaryData() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _staticDictionaryData;
  }
}
