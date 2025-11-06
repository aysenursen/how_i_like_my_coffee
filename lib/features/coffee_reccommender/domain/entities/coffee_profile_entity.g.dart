// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoffeeProfileEntity _$CoffeeProfileEntityFromJson(Map<String, dynamic> json) =>
    _CoffeeProfileEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      body: json['body'] as String,
      temperature: json['temperature'] as String,
      aromas:
          (json['aromas'] as List<dynamic>).map((e) => e as String).toList(),
      origin: json['origin'] as String,
      explanation: json['explanation'] as String,
    );

Map<String, dynamic> _$CoffeeProfileEntityToJson(
        _CoffeeProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'body': instance.body,
      'temperature': instance.temperature,
      'aromas': instance.aromas,
      'origin': instance.origin,
      'explanation': instance.explanation,
    };
