// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_recommended_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetRecommendedProductsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetRecommendedProductsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetRecommendedProductsState()';
  }
}

/// @nodoc
class $GetRecommendedProductsStateCopyWith<$Res> {
  $GetRecommendedProductsStateCopyWith(GetRecommendedProductsState _,
      $Res Function(GetRecommendedProductsState) __);
}

/// @nodoc

class _Initial implements GetRecommendedProductsState {
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
    return 'GetRecommendedProductsState.initial()';
  }
}

/// @nodoc

class RecommendedProductsLoading implements GetRecommendedProductsState {
  const RecommendedProductsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecommendedProductsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetRecommendedProductsState.recommendedProductsLoading()';
  }
}

/// @nodoc

class RecommendedProductsSuccess implements GetRecommendedProductsState {
  const RecommendedProductsSuccess(
      {required final List<PopularProduct> recommendedProducts})
      : _recommendedProducts = recommendedProducts;

  final List<PopularProduct> _recommendedProducts;
  List<PopularProduct> get recommendedProducts {
    if (_recommendedProducts is EqualUnmodifiableListView)
      return _recommendedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedProducts);
  }

  /// Create a copy of GetRecommendedProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecommendedProductsSuccessCopyWith<RecommendedProductsSuccess>
      get copyWith =>
          _$RecommendedProductsSuccessCopyWithImpl<RecommendedProductsSuccess>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecommendedProductsSuccess &&
            const DeepCollectionEquality()
                .equals(other._recommendedProducts, _recommendedProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recommendedProducts));

  @override
  String toString() {
    return 'GetRecommendedProductsState.recommendedProductsSuccess(recommendedProducts: $recommendedProducts)';
  }
}

/// @nodoc
abstract mixin class $RecommendedProductsSuccessCopyWith<$Res>
    implements $GetRecommendedProductsStateCopyWith<$Res> {
  factory $RecommendedProductsSuccessCopyWith(RecommendedProductsSuccess value,
          $Res Function(RecommendedProductsSuccess) _then) =
      _$RecommendedProductsSuccessCopyWithImpl;
  @useResult
  $Res call({List<PopularProduct> recommendedProducts});
}

/// @nodoc
class _$RecommendedProductsSuccessCopyWithImpl<$Res>
    implements $RecommendedProductsSuccessCopyWith<$Res> {
  _$RecommendedProductsSuccessCopyWithImpl(this._self, this._then);

  final RecommendedProductsSuccess _self;
  final $Res Function(RecommendedProductsSuccess) _then;

  /// Create a copy of GetRecommendedProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recommendedProducts = null,
  }) {
    return _then(RecommendedProductsSuccess(
      recommendedProducts: null == recommendedProducts
          ? _self._recommendedProducts
          : recommendedProducts // ignore: cast_nullable_to_non_nullable
              as List<PopularProduct>,
    ));
  }
}

/// @nodoc

class RecommendedProductsError implements GetRecommendedProductsState {
  const RecommendedProductsError({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of GetRecommendedProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecommendedProductsErrorCopyWith<RecommendedProductsError> get copyWith =>
      _$RecommendedProductsErrorCopyWithImpl<RecommendedProductsError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecommendedProductsError &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'GetRecommendedProductsState.recommendedProductsError(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $RecommendedProductsErrorCopyWith<$Res>
    implements $GetRecommendedProductsStateCopyWith<$Res> {
  factory $RecommendedProductsErrorCopyWith(RecommendedProductsError value,
          $Res Function(RecommendedProductsError) _then) =
      _$RecommendedProductsErrorCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$RecommendedProductsErrorCopyWithImpl<$Res>
    implements $RecommendedProductsErrorCopyWith<$Res> {
  _$RecommendedProductsErrorCopyWithImpl(this._self, this._then);

  final RecommendedProductsError _self;
  final $Res Function(RecommendedProductsError) _then;

  /// Create a copy of GetRecommendedProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(RecommendedProductsError(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
