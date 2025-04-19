import 'package:json_annotation/json_annotation.dart';

part 'popular_products_model.g.dart';

@JsonSerializable()
class ProductsListModel {
  List<PopularProduct>? products;

  ProductsListModel({this.products});

  factory ProductsListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListModelToJson(this);
}

@JsonSerializable()
class PopularProduct {
  int? id;
  String? name;
  String? description;
  double? price;
  @JsonKey(name: 'img')
  String? imageUrl;
  int? stars;
  String? location;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'type_id')
  int? typeId;

  PopularProduct({
    this.stars,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.typeId,
    this.id,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
  });

  factory PopularProduct.fromJson(Map<String, dynamic> json) =>
      _$PopularProductFromJson(json);

  Map<String, dynamic> toJson() => _$PopularProductToJson(this);
}
