import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/get_recommendation_use_case.dart';
import 'recommender_state.dart'; // Yeni state sınıfımız

// GetIt örneği (sl) uygulama genelinde tanımlı olduğu için çekilebilir.
final sl = GetIt.instance;

// -----------------------------------------------------
// 1. Riverpod Provider Tanımı
// -----------------------------------------------------
// StateNotifierProvider, dışarıdan erişilebilecek ViewModel'ı tanımlar.
final recommenderViewModelProvider =
    StateNotifierProvider<RecommenderViewModel, RecommenderState>((ref) {
  // GetIt'ten Use Case'i çekerek ViewModel'ı oluşturuyoruz (DI'ı kullanıyoruz!)
  final getRecommendationUseCase = sl<GetRecommendationUseCase>();
  return RecommenderViewModel(
      getRecommendationUseCase: getRecommendationUseCase);
});

// -----------------------------------------------------
// 2. ViewModel Sınıfı
// -----------------------------------------------------
class RecommenderViewModel extends StateNotifier<RecommenderState> {
  final GetRecommendationUseCase _getRecommendationUseCase;

  // Constructor: Başlangıç durumunu ve Use Case bağımlılığını alır.
  RecommenderViewModel(
      {required GetRecommendationUseCase getRecommendationUseCase})
      : _getRecommendationUseCase = getRecommendationUseCase,
        super(const RecommenderState.initial()); // Başlangıç durumu: initial

  /// Kullanıcının tercihlerine göre kahve önerisi almak için metot.
  Future<void> getRecommendation({
    required String temperature,
    required String body,
    required List<String> aromas,
  }) async {
    state = const RecommenderState.loading();

    // 1. Either tipinde sonuç al
    final resultEither = await _getRecommendationUseCase.call(
      temperature: temperature,
      body: body,
      aromas: aromas,
    );

    // 2. Either yapısını aç (fold metodu)
    resultEither.fold(
      // ❌ Hata Durumu (Left)
      (failure) {
        // Use Case'ten gelen Failure'ı UI'ın göstereceği Error durumuna paketle
        state = RecommenderState.error(message: failure.message);
      },
      // ✅ Başarı Durumu (Right)
      (recommendations) {
        // Şimdi recommendations saf bir List<CoffeeProfileEntity>'dir. isNotEmpty kullanılabilir.
        if (recommendations.isNotEmpty) {
          state = RecommenderState.loaded(recommendations: recommendations);
        } else {
          state = const RecommenderState.error(
              message: "Tercihlerinize uygun kahve profili bulunamadı.");
        }
      },
    );
  }
}
