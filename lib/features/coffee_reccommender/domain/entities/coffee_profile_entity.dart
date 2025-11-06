import 'package:freezed_annotation/freezed_annotation.dart';

part 'coffee_profile_entity.freezed.dart'; // BUILD RUNNER BU DOSYAYI OLUŞTURACAK
part 'coffee_profile_entity.g.dart'; // BUILD RUNNER BU DOSYAYI OLUŞTURACAK

@freezed
abstract class CoffeeProfileEntity with _$CoffeeProfileEntity {
  const factory CoffeeProfileEntity({
    required String id,
    required String name, // Örn: Latte, V60, Cold Brew

    // Kullanıcı tercihlerini yansıtan ana özellikler
    required String body, // Gövde (Hafif, Orta, Yoğun)
    required String temperature, // Sıcaklık (Sıcak, Soğuk)

    // Aromalar listesi (Çikolata, Meyvemsi, Fındıksı vb.)
    required List<String> aromas,

    // Kullanıcıyı eğitecek ek bilgiler
    required String origin, // Çekirdek Kökeni (Etiyopya, Kolombiya, Karışım)
    required String explanation, // "Neden bu öneri?" açıklaması
  }) = _CoffeeProfileEntity;

  // JSON'dan nesne oluşturmak için gerekli fabrika metodu
  factory CoffeeProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$CoffeeProfileEntityFromJson(json);
}
