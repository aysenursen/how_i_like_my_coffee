import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod'u GetIt'e bağlamak için
// Domain Katmanı İçe Aktarımları (Şu an sadece abstract Repository var)
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/repositories/coffee_repository.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/repositories/coffee_repository_impl.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/usecases/get_dictionary_use_case.dart';
// Use Case ve View Model İçe Aktarımları (Yakında oluşturulacak)
import 'package:how_i_like_my_coffee/features/coffee_reccommender/domain/usecases/get_recommendation_use_case.dart';
// import 'package:how_i_like_my_coffee/features/coffee_recommender/presentation/viewmodels/recommender_view_model.dart';
import 'package:how_i_like_my_coffee/features/coffee_reccommender/data/datasources/coffee_local_data_source.dart';

final sl = GetIt.instance; // sl = Service Locator (Hizmet Bulucu)

Future<void> initDependencies() async {
  // 1. Data Source (En az bağımlı olan)
  sl.registerLazySingleton<CoffeeLocalDataSource>(
      () => CoffeeLocalDataSourceImpl());

  // 2. Repository Implementasyonu (Data Source'a bağımlı)
  // Registering abstract interface with concrete implementation
  sl.registerLazySingleton<CoffeeRepository>(
    () => CoffeeRepositoryImpl(
        localDataSource: sl()), // sl() ile LocalDataSource'u çekiyor
  );

  // 3. Use Case (Repository'ye bağımlı)
  sl.registerLazySingleton(() => GetRecommendationUseCase(repository: sl()));
  sl.registerLazySingleton(
      () => GetDictionaryUseCase(repository: sl())); // YENİ KAYIT

  // 4. Dictionary Use Case (Eğer önceki adımda yaptıysanız)
  // sl.registerLazySingleton(() => GetDictionaryUseCase(repository: sl()));
  //------------------------------------------
  // 1. Presentation Katmanı (ViewModels/Riverpod Providers)
  // Riverpod, GetIt'ten bağımlılıkları çekebilir.
  // Not: Riverpod'u tam olarak bağlamak için buraya Provider'ları değil,
  // GetIt üzerinden Use Case'leri kaydedeceğiz.
  //------------------------------------------

  //------------------------------------------
  // 2. Domain Katmanı (Use Cases)
  // Use Case'ler, Repository'leri kullanır
  // sl.registerLazySingleton(() => GetRecommendationUseCase(repository: sl()));

  //------------------------------------------
  // 3. Data Katmanı (Repositories ve Data Sources)
  // Repository'ler, Data Source'ları kullanır
  // sl.registerLazySingleton<CoffeeRepository>(
  //   () => CoffeeRepositoryImpl(localDataSource: sl()),
  // );

  // Data Source'lar
  // sl.registerLazySingleton(() => CoffeeLocalDataSource());
  //------------------------------------------

  // *Şu an sadece abstract yapıyı kaydediyoruz, diğerlerini sonra ekleyeceğiz*
}
