// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_entry_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DictionaryEntryEntity {
  String get term; // Terim (Örn: Asidite, Gövde, Etiyopya)
  String get description; // Açıklaması
  String get category;

  /// Create a copy of DictionaryEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DictionaryEntryEntityCopyWith<DictionaryEntryEntity> get copyWith =>
      _$DictionaryEntryEntityCopyWithImpl<DictionaryEntryEntity>(
          this as DictionaryEntryEntity, _$identity);

  /// Serializes this DictionaryEntryEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DictionaryEntryEntity &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, term, description, category);

  @override
  String toString() {
    return 'DictionaryEntryEntity(term: $term, description: $description, category: $category)';
  }
}

/// @nodoc
abstract mixin class $DictionaryEntryEntityCopyWith<$Res> {
  factory $DictionaryEntryEntityCopyWith(DictionaryEntryEntity value,
          $Res Function(DictionaryEntryEntity) _then) =
      _$DictionaryEntryEntityCopyWithImpl;
  @useResult
  $Res call({String term, String description, String category});
}

/// @nodoc
class _$DictionaryEntryEntityCopyWithImpl<$Res>
    implements $DictionaryEntryEntityCopyWith<$Res> {
  _$DictionaryEntryEntityCopyWithImpl(this._self, this._then);

  final DictionaryEntryEntity _self;
  final $Res Function(DictionaryEntryEntity) _then;

  /// Create a copy of DictionaryEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? description = null,
    Object? category = null,
  }) {
    return _then(_self.copyWith(
      term: null == term
          ? _self.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DictionaryEntryEntity].
extension DictionaryEntryEntityPatterns on DictionaryEntryEntity {
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
    TResult Function(_DictionaryEntryEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntryEntity() when $default != null:
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
    TResult Function(_DictionaryEntryEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntryEntity():
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
    TResult? Function(_DictionaryEntryEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntryEntity() when $default != null:
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
    TResult Function(String term, String description, String category)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntryEntity() when $default != null:
        return $default(_that.term, _that.description, _that.category);
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
    TResult Function(String term, String description, String category) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntryEntity():
        return $default(_that.term, _that.description, _that.category);
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
    TResult? Function(String term, String description, String category)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DictionaryEntryEntity() when $default != null:
        return $default(_that.term, _that.description, _that.category);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DictionaryEntryEntity implements DictionaryEntryEntity {
  const _DictionaryEntryEntity(
      {required this.term, required this.description, required this.category});
  factory _DictionaryEntryEntity.fromJson(Map<String, dynamic> json) =>
      _$DictionaryEntryEntityFromJson(json);

  @override
  final String term;
// Terim (Örn: Asidite, Gövde, Etiyopya)
  @override
  final String description;
// Açıklaması
  @override
  final String category;

  /// Create a copy of DictionaryEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DictionaryEntryEntityCopyWith<_DictionaryEntryEntity> get copyWith =>
      __$DictionaryEntryEntityCopyWithImpl<_DictionaryEntryEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DictionaryEntryEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DictionaryEntryEntity &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, term, description, category);

  @override
  String toString() {
    return 'DictionaryEntryEntity(term: $term, description: $description, category: $category)';
  }
}

/// @nodoc
abstract mixin class _$DictionaryEntryEntityCopyWith<$Res>
    implements $DictionaryEntryEntityCopyWith<$Res> {
  factory _$DictionaryEntryEntityCopyWith(_DictionaryEntryEntity value,
          $Res Function(_DictionaryEntryEntity) _then) =
      __$DictionaryEntryEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String term, String description, String category});
}

/// @nodoc
class __$DictionaryEntryEntityCopyWithImpl<$Res>
    implements _$DictionaryEntryEntityCopyWith<$Res> {
  __$DictionaryEntryEntityCopyWithImpl(this._self, this._then);

  final _DictionaryEntryEntity _self;
  final $Res Function(_DictionaryEntryEntity) _then;

  /// Create a copy of DictionaryEntryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? term = null,
    Object? description = null,
    Object? category = null,
  }) {
    return _then(_DictionaryEntryEntity(
      term: null == term
          ? _self.term
          : term // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
