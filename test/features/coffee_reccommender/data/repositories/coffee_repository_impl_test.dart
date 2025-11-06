import 'package:flutter_test/flutter_test.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/data/datasources/coffee_local_data_source.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/entities/coffee_profile_entity.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/repositories/coffee_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:how_i_like_my_coffee/core/error/failure.dart';

// Mock sınıflarını üretmek için
@GenerateMocks([CoffeeLocalDataSource])
import 'coffee_repository_impl_test.mocks.dart'; // Bu dosya build_runner ile oluşacak

void main() {
  late CoffeeRepositoryImpl repository;
  late MockCoffeeLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockCoffeeLocalDataSource();
    repository = CoffeeRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  // Örnek Ham Veri (Data Source'tan gelen)
  final tJsonCoffee = {
    "id": "1",
    "name": "Mocha",
    "body": "Yoğun",
    "temperature": "Sıcak",
    "aromas": ["Çikolata", "Karamel"],
    "origin": "Karışım",
    "explanation": "Yoğun ve tatlı sevenler için."
  };
  final tJsonList = [tJsonCoffee];

  // Örnek Başarılı Entity (Domain katmanına dönüştürülmüş)
  final tEntity = CoffeeProfileEntity.fromJson(tJsonCoffee);
  final tEntityList = [tEntity];

  group('getRecommendation', () {
    test(
      'Data Source başarılı olduğunda, gelen JSON verisini Entity\'ye dönüştürmeli ve Right(EntityList) döndürmeli',
      () async {
        // Düzenleme (Arrange)
        when(mockLocalDataSource.getAllCoffeeProfiles())
            .thenAnswer((_) async => tJsonList);

        // Eylem (Act)
        final result = await repository.getRecommendation(
          temperature: 'Sıcak',
          body: 'Yoğun',
          aromas: ['Çikolata'],
        );

        // Doğrulama (Assert)
        // 1. Sonuç başarılı (Right) ve beklenen entity listesini içeriyor mu?
        expect(result, equals(Right(tEntityList)));
        // 2. Data Source doğru çağrıldı mı?
        verify(mockLocalDataSource.getAllCoffeeProfiles()).called(1);
        verifyNoMoreInteractions(mockLocalDataSource);
      },
    );

    test(
      'Data Source hata fırlattığında (Exception), Left(GeneralFailure) döndürmeli',
      () async {
        // Düzenleme (Arrange)
        when(mockLocalDataSource.getAllCoffeeProfiles())
            .thenThrow(Exception('Bağlantı hatası')); // Bir hata fırlat

        // Eylem (Act)
        final result = await repository.getRecommendation(
          temperature: 'Sıcak',
          body: 'Yoğun',
          aromas: ['Çikolata'],
        );

        // Doğrulama (Assert)
        // Sonuç hata (Left) ve GeneralFailure tipinde mi?
        expect(
            result,
            equals(const Left(GeneralFailure(
                'Veri çekilirken beklenmedik bir hata oluştu.'))));
        verify(mockLocalDataSource.getAllCoffeeProfiles()).called(1);
      },
    );
  });
}
