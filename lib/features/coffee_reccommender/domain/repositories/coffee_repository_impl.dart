// Domain Katmanı Bağımlılıkları (Abstract Repository ve Entity)
import 'package:how_i_like_my_coffee/features/coffee_reccommender/data/datasources/coffee_local_data_source.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/entities/dictionary_entry_entity.dart';

import '../../domain/repositories/coffee_repository.dart';
import '../../domain/entities/coffee_profile_entity.dart';

import 'package:how_i_like_my_coffee/core/error/failure.dart';
import 'package:dartz/dartz.dart';
// Data Katmanı Bağımlılıkları (Local Data Source)

// Model'i (Data katmanı için) henüz oluşturmadık, şimdilik doğrudan JSON kullanıyoruz.
// Normalde bu adımda JSON'dan Model'e, Model'den Entity'ye dönüşüm yapılır.

class CoffeeRepositoryImpl implements CoffeeRepository {
  final CoffeeLocalDataSource localDataSource;

  // Bağımlılığı (DataSource) constructor ile alıyoruz (GetIt sağlayacak)
  CoffeeRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<CoffeeProfileEntity>>> getRecommendation({
    required String temperature,
    required String body,
    required List<String> aromas,
  }) async {
    try {
      final jsonList = await localDataSource.getAllCoffeeProfiles();

      // ... (Filtreleme ve dönüşüm mantığı aynı kalır) ...
      final recommendations = jsonList.map((jsonMap) {
        return CoffeeProfileEntity.fromJson(jsonMap);
      }).where((entity) {
        // Basit Öneri Mantığı:
        bool matchesTemp = entity.temperature == temperature;
        bool matchesBody = entity.body == body;
        bool matchesAroma =
            aromas.any((userAroma) => entity.aromas.contains(userAroma));
        return matchesTemp && matchesBody && matchesAroma;
      }).toList();

      // ✅ BAŞARI DURUMU: Right(data) döndür
      return Right(recommendations);
    } catch (e) {
      // ❌ HATA DURUMU: Left(Failure) döndür
      // Gerçek uygulamada hatanın türüne göre ServerFailure, CacheFailure döndürülür.
      return Left(
          GeneralFailure('Veri çekilirken beklenmedik bir hata oluştu.'));
    }
  }

  @override
  Future<Either<Failure, List<DictionaryEntryEntity>>>
      getDictionaryEntries() async {
    try {
      final jsonList = await localDataSource.getDictionaryData();

      // JSON'dan Entity'ye dönüşüm
      final entries = jsonList.map((jsonMap) {
        return DictionaryEntryEntity.fromJson(jsonMap);
      }).toList();

      return Right(entries);
    } catch (e) {
      return Left(
        GeneralFailure(
          'Repository Hatası: Sözlük verisi alınamadı veya dönüştürülemedi: $e',
        ),
      );
    }
  }
}
