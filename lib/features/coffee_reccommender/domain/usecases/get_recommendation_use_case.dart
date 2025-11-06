import 'package:how_i_like_my_coffee/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../repositories/coffee_repository.dart';
import '../entities/coffee_profile_entity.dart';
// import '../../../../core/error/failure.dart'; // Hata sınıfını sonra ekleyeceğiz
// import 'package:dartz/dartz.dart'; // Either yapısı için (Opsiyonel ama profesyonel)

/// Use Case: Kullanıcı tercihlerine göre kahve önerisi alır.
/// Bu, uygulamanın birincil iş mantığını barındırır.
class GetRecommendationUseCase {
  final CoffeeRepository repository;

  // Use Case, bağımlılığını (Repository) constructor (yapıcı) ile alır.
  // Bu, DI (GetIt) tarafından sağlanır.
  GetRecommendationUseCase({required this.repository});

  // Metot çağrısı (Fonksiyonel Programlama stili için 'call' metodu kullanılıyor)
  Future<Either<Failure, List<CoffeeProfileEntity>>> call({
    required String temperature,
    required String body,
    required List<String> aromas,
  }) async {
    // 🚨 HATA DÜZELTİLDİ: Repository artık Either döndürdüğü için direkt sonucu döndürüyoruz.
    final result = await repository.getRecommendation(
      temperature: temperature,
      body: body,
      aromas: aromas,
    );
    return result;
  }
}
