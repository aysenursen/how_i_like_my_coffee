import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_i_like_my_coffee/core/error/failure.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/entities/coffee_profile_entity.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/repositories/coffee_repository.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/usecases/get_recommendation_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 1. Mock Repository'yi oluşturmak için 'mockito' kullan
@GenerateMocks([CoffeeRepository])
import 'get_recommendation_use_case_test.mocks.dart'; // Otomatik oluşacak dosya

void main() {
  late GetRecommendationUseCase useCase;
  late MockCoffeeRepository mockRepository; // Sahte Repository

  // Testler başlamadan önce kurulumu yap
  setUp(() {
    mockRepository = MockCoffeeRepository();
    useCase = GetRecommendationUseCase(repository: mockRepository);
  });

  // Örnek başarılı veri
  final tCoffeeProfile = CoffeeProfileEntity(
    id: '1',
    name: 'Latte',
    body: 'Orta',
    temperature: 'Sıcak',
    aromas: ['Karamel'],
    origin: 'Kolombiya',
    explanation: 'Dengeli.',
  );

  final tRecommendations = [tCoffeeProfile];

  test(
    'Use Case, Repository\'yi doğru parametrelerle çağırmalı ve Entity listesini döndürmeli',
    () async {
      // Düzenleme (Arrange): Repository'nin metodunu sahte sonuç döndürmeye ayarla
      when(mockRepository.getRecommendation(
        temperature: anyNamed('temperature'),
        body: anyNamed('body'),
        aromas: anyNamed('aromas'),
      )).thenAnswer(
          (_) async => Right(tRecommendations)); // <<< DÜZELTME BURADA!

      // Eylem (Act): Use Case'i çağır
      final result = await useCase.call(
        temperature: 'Sıcak',
        body: 'Orta',
        aromas: ['Çikolata'],
      );

      // Doğrulama (Assert 1): Use Case'in geri dönüşü de Either olduğu için
      // assert işlemini de buna göre düzeltmeliyiz.
      expect(result, equals(Right(tRecommendations))); // <<< DÜZELTME BURADA!

      // ... (Diğer verify işlemleri aynı kalır) ...
    },
  );
  test(
    'Repository hata (Failure) döndürdüğünde, Use Case de Left(Failure) döndürmeli',
    () async {
      // Düzenleme (Arrange): Repository'nin hata döndürmesini sağla
      when(mockRepository.getRecommendation(
        temperature: anyNamed('temperature'),
        body: anyNamed('body'),
        aromas: anyNamed('aromas'),
      )).thenAnswer((_) async => const Left(
          GeneralFailure('Repository hatası'))); // <<< Hata Senaryosu

      // Eylem (Act): Use Case'i çağır
      final result = await useCase.call(
        temperature: 'Sıcak',
        body: 'Orta',
        aromas: ['Çikolata'],
      );

      // Doğrulama (Assert): Sonuç, beklediğimiz hata (Failure) tipini içeriyor mu?
      expect(result, equals(const Left(GeneralFailure('Repository hatası'))));

      verify(mockRepository.getRecommendation(
        temperature: anyNamed('temperature'),
        body: anyNamed('body'),
        aromas: anyNamed('aromas'),
      )).called(1);
    },
  );

  // Hata testleri (Failure testleri) buraya eklenecektir.
}
