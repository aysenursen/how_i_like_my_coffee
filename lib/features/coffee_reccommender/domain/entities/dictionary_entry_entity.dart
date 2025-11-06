import 'package:freezed_annotation/freezed_annotation.dart';

part 'dictionary_entry_entity.freezed.dart';
part 'dictionary_entry_entity.g.dart';

@freezed
abstract class DictionaryEntryEntity with _$DictionaryEntryEntity {
  const factory DictionaryEntryEntity({
    required String term, // Terim (Örn: Asidite, Gövde, Etiyopya)
    required String description, // Açıklaması
    required String category, // Kategori (Örn: Köken, Tadım, Demleme)
  }) = _DictionaryEntryEntity;

  factory DictionaryEntryEntity.fromJson(Map<String, dynamic> json) =>
      _$DictionaryEntryEntityFromJson(json);
}

// 🚨 Build Runner'ı tekrar çalıştırmayı unutmayın!
// flutter pub run build_runner watch --delete-conflicting-outputs
