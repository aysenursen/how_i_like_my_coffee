import 'package:dartz/dartz.dart';

import 'package:how_i_like_my_coffee/core/error/failure.dart';

import '../entities/dictionary_entry_entity.dart';
import '../repositories/coffee_repository.dart';

/// Use Case: Kahve sözlüğündeki tüm girişleri çeker.
class GetDictionaryUseCase {
  final CoffeeRepository repository;

  GetDictionaryUseCase({required this.repository});

  Future<Either<Failure, List<DictionaryEntryEntity>>> call() async {
    // Repository'den Sözlük verilerini çekme görevini devret
    try {
      final result = await repository.getDictionaryEntries();
      return result;
    } catch (e) {
      throw Exception('Sözlük verileri alınırken hata oluştu: $e');
    }
  }
}
