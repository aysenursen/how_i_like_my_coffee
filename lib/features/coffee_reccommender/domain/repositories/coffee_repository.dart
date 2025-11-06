// core/error/failure.dart dosyasını henüz oluşturmadık, şimdilik Dart'ın kendi Exception sınıfını kullanıyoruz.
// Yakında bu yapıyı kendi Failure sınıfımızla değiştireceğiz.

import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/entities/coffee_profile_entity.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/entities/dictionary_entry_entity.dart';
import 'package:how_i_like_my_coffee/core/error/failure.dart';
import 'package:dartz/dartz.dart';

/// Bu, Domain katmanının veri ile etkileşime girmesi gereken kontrattır (arayüz).
/// Uygulama (Use Cases), Repository'nin somut implementasyonunu (Data katmanında) bilmez.
/// Bu, kodumuzu test edilebilir ve esnek yapar.
abstract class CoffeeRepository {
  // Öneri almak için bir metot tanımlıyoruz.
  // Geriye bir CoffeeProfileEntity listesi (öneri sonuçları) döndürecektir.
  Future<Either<Failure, List<CoffeeProfileEntity>>> getRecommendation({
    required String temperature,
    required String body,
    required List<String> aromas,
  });

  // Sözlük metodu da güncellenmeli (ileride kullanmak üzere)
  Future<Either<Failure, List<DictionaryEntryEntity>>> getDictionaryEntries();
}
