// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_popular_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPopularProductsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetPopularProductsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetPopularProductsState()';
  }
}

/// @nodoc
class $GetPopularProductsStateCopyWith<$Res> {
  $GetPopularProductsStateCopyWith(
      GetPopularProductsState _, $Res Function(GetPopularProductsState) __);
}

/// @nodoc

class _Initial implements GetPopularProductsState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetPopularProductsState.initial()';
  }
}

/// @nodoc

class PopularProductsLoading implements GetPopularProductsState {
  const PopularProductsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PopularProductsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetPopularProductsState.popularProductsLoading()';
  }
}

/// @nodoc

class popularProductsSuccess implements GetPopularProductsState {
  const popularProductsSuccess(
      {required final List<ProductModel> popularProducts})
      : _popularProducts = popularProducts;

  final List<ProductModel> _popularProducts;
  List<ProductModel> get popularProducts {
    if (_popularProducts is EqualUnmodifiableListView) return _popularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularProducts);
  }

  /// Create a copy of GetPopularProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $popularProductsSuccessCopyWith<popularProductsSuccess> get copyWith =>
      _$popularProductsSuccessCopyWithImpl<popularProductsSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is popularProductsSuccess &&
            const DeepCollectionEquality()
                .equals(other._popularProducts, _popularProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_popularProducts));

  @override
  String toString() {
    return 'GetPopularProductsState.popularProductsSuccess(popularProducts: $popularProducts)';
  }
}

/// @nodoc
abstract mixin class $popularProductsSuccessCopyWith<$Res>
    implements $GetPopularProductsStateCopyWith<$Res> {
  factory $popularProductsSuccessCopyWith(popularProductsSuccess value,
          $Res Function(popularProductsSuccess) _then) =
      _$popularProductsSuccessCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> popularProducts});
}

/// @nodoc
class _$popularProductsSuccessCopyWithImpl<$Res>
    implements $popularProductsSuccessCopyWith<$Res> {
  _$popularProductsSuccessCopyWithImpl(this._self, this._then);

  final popularProductsSuccess _self;
  final $Res Function(popularProductsSuccess) _then;

  /// Create a copy of GetPopularProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? popularProducts = null,
  }) {
    return _then(popularProductsSuccess(
      popularProducts: null == popularProducts
          ? _self._popularProducts
          : popularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class popularProductsError implements GetPopularProductsState {
  const popularProductsError({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of GetPopularProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $popularProductsErrorCopyWith<popularProductsError> get copyWith =>
      _$popularProductsErrorCopyWithImpl<popularProductsError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is popularProductsError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'GetPopularProductsState.popularProductsError(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $popularProductsErrorCopyWith<$Res>
    implements $GetPopularProductsStateCopyWith<$Res> {
  factory $popularProductsErrorCopyWith(popularProductsError value,
          $Res Function(popularProductsError) _then) =
      _$popularProductsErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$popularProductsErrorCopyWithImpl<$Res>
    implements $popularProductsErrorCopyWith<$Res> {
  _$popularProductsErrorCopyWithImpl(this._self, this._then);

  final popularProductsError _self;
  final $Res Function(popularProductsError) _then;

  /// Create a copy of GetPopularProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(popularProductsError(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
