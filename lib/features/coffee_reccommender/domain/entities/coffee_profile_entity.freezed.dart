// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coffee_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoffeeProfileEntity {
  String get id;
  String get name; // Örn: Latte, V60, Cold Brew
// Kullanıcı tercihlerini yansıtan ana özellikler
  String get body; // Gövde (Hafif, Orta, Yoğun)
  String get temperature; // Sıcaklık (Sıcak, Soğuk)
// Aromalar listesi (Çikolata, Meyvemsi, Fındıksı vb.)
  List<String> get aromas; // Kullanıcıyı eğitecek ek bilgiler
  String get origin; // Çekirdek Kökeni (Etiyopya, Kolombiya, Karışım)
  String get explanation;

  /// Create a copy of CoffeeProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoffeeProfileEntityCopyWith<CoffeeProfileEntity> get copyWith =>
      _$CoffeeProfileEntityCopyWithImpl<CoffeeProfileEntity>(
          this as CoffeeProfileEntity, _$identity);

  /// Serializes this CoffeeProfileEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoffeeProfileEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            const DeepCollectionEquality().equals(other.aromas, aromas) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, body, temperature,
      const DeepCollectionEquality().hash(aromas), origin, explanation);

  @override
  String toString() {
    return 'CoffeeProfileEntity(id: $id, name: $name, body: $body, temperature: $temperature, aromas: $aromas, origin: $origin, explanation: $explanation)';
  }
}

/// @nodoc
abstract mixin class $CoffeeProfileEntityCopyWith<$Res> {
  factory $CoffeeProfileEntityCopyWith(
          CoffeeProfileEntity value, $Res Function(CoffeeProfileEntity) _then) =
      _$CoffeeProfileEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String body,
      String temperature,
      List<String> aromas,
      String origin,
      String explanation});
}

/// @nodoc
class _$CoffeeProfileEntityCopyWithImpl<$Res>
    implements $CoffeeProfileEntityCopyWith<$Res> {
  _$CoffeeProfileEntityCopyWithImpl(this._self, this._then);

  final CoffeeProfileEntity _self;
  final $Res Function(CoffeeProfileEntity) _then;

  /// Create a copy of CoffeeProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? body = null,
    Object? temperature = null,
    Object? aromas = null,
    Object? origin = null,
    Object? explanation = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      aromas: null == aromas
          ? _self.aromas
          : aromas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      origin: null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoffeeProfileEntity].
extension CoffeeProfileEntityPatterns on CoffeeProfileEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CoffeeProfileEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoffeeProfileEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CoffeeProfileEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoffeeProfileEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CoffeeProfileEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoffeeProfileEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String body, String temperature,
            List<String> aromas, String origin, String explanation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoffeeProfileEntity() when $default != null:
        return $default(_that.id, _that.name, _that.body, _that.temperature,
            _that.aromas, _that.origin, _that.explanation);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String body, String temperature,
            List<String> aromas, String origin, String explanation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoffeeProfileEntity():
        return $default(_that.id, _that.name, _that.body, _that.temperature,
            _that.aromas, _that.origin, _that.explanation);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String body, String temperature,
            List<String> aromas, String origin, String explanation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoffeeProfileEntity() when $default != null:
        return $default(_that.id, _that.name, _that.body, _that.temperature,
            _that.aromas, _that.origin, _that.explanation);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CoffeeProfileEntity implements CoffeeProfileEntity {
  const _CoffeeProfileEntity(
      {required this.id,
      required this.name,
      required this.body,
      required this.temperature,
      required final List<String> aromas,
      required this.origin,
      required this.explanation})
      : _aromas = aromas;
  factory _CoffeeProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$CoffeeProfileEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
// Örn: Latte, V60, Cold Brew
// Kullanıcı tercihlerini yansıtan ana özellikler
  @override
  final String body;
// Gövde (Hafif, Orta, Yoğun)
  @override
  final String temperature;
// Sıcaklık (Sıcak, Soğuk)
// Aromalar listesi (Çikolata, Meyvemsi, Fındıksı vb.)
  final List<String> _aromas;
// Sıcaklık (Sıcak, Soğuk)
// Aromalar listesi (Çikolata, Meyvemsi, Fındıksı vb.)
  @override
  List<String> get aromas {
    if (_aromas is EqualUnmodifiableListView) return _aromas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aromas);
  }

// Kullanıcıyı eğitecek ek bilgiler
  @override
  final String origin;
// Çekirdek Kökeni (Etiyopya, Kolombiya, Karışım)
  @override
  final String explanation;

  /// Create a copy of CoffeeProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoffeeProfileEntityCopyWith<_CoffeeProfileEntity> get copyWith =>
      __$CoffeeProfileEntityCopyWithImpl<_CoffeeProfileEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoffeeProfileEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoffeeProfileEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            const DeepCollectionEquality().equals(other._aromas, _aromas) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, body, temperature,
      const DeepCollectionEquality().hash(_aromas), origin, explanation);

  @override
  String toString() {
    return 'CoffeeProfileEntity(id: $id, name: $name, body: $body, temperature: $temperature, aromas: $aromas, origin: $origin, explanation: $explanation)';
  }
}

/// @nodoc
abstract mixin class _$CoffeeProfileEntityCopyWith<$Res>
    implements $CoffeeProfileEntityCopyWith<$Res> {
  factory _$CoffeeProfileEntityCopyWith(_CoffeeProfileEntity value,
          $Res Function(_CoffeeProfileEntity) _then) =
      __$CoffeeProfileEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String body,
      String temperature,
      List<String> aromas,
      String origin,
      String explanation});
}

/// @nodoc
class __$CoffeeProfileEntityCopyWithImpl<$Res>
    implements _$CoffeeProfileEntityCopyWith<$Res> {
  __$CoffeeProfileEntityCopyWithImpl(this._self, this._then);

  final _CoffeeProfileEntity _self;
  final $Res Function(_CoffeeProfileEntity) _then;

  /// Create a copy of CoffeeProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? body = null,
    Object? temperature = null,
    Object? aromas = null,
    Object? origin = null,
    Object? explanation = null,
  }) {
    return _then(_CoffeeProfileEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      aromas: null == aromas
          ? _self._aromas
          : aromas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      origin: null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
