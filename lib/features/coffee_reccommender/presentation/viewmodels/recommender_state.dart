import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/coffee_profile_entity.dart';
// import '../../../../core/error/failure.dart'; // Hata sınıfını sonra kullanacağız

part 'recommender_state.freezed.dart';

@freezed
abstract class RecommenderState with _$RecommenderState {
  // 1. Durum: Başlangıç/Boş
  const factory RecommenderState.initial() = _Initial;

  // 2. Durum: Veri yükleniyor
  const factory RecommenderState.loading() = _Loading;

  // 3. Durum: Başarılı sonuç (Öneri bulundu)
  const factory RecommenderState.loaded({
    required List<CoffeeProfileEntity> recommendations,
    // Ek alanlar eklenebilir (ör: String searchCriteria)
  }) = _Loaded;

  // 4. Durum: Hata
  const factory RecommenderState.error({
    required String message,
  }) = _Error;
}

// Yeni dosyayı kaydettikten sonra BUILD RUNNER'ı çalıştırdığınızdan emin olun!
// Komut: flutter pub run build_runner watch --delete-conflicting-outputs