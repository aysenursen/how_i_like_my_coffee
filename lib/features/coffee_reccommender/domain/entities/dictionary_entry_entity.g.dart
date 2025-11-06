// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_entry_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DictionaryEntryEntity _$DictionaryEntryEntityFromJson(
        Map<String, dynamic> json) =>
    _DictionaryEntryEntity(
      term: json['term'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$DictionaryEntryEntityToJson(
        _DictionaryEntryEntity instance) =>
    <String, dynamic>{
      'term': instance.term,
      'description': instance.description,
      'category': instance.category,
    };
