// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsListModel _$ProductsListModelFromJson(Map<String, dynamic> json) =>
    ProductsListModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => PopularProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsListModelToJson(ProductsListModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

PopularProduct _$PopularProductFromJson(Map<String, dynamic> json) =>
    PopularProduct(
      stars: (json['stars'] as num?)?.toInt(),
      location: json['location'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      typeId: (json['type_id'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['img'] as String?,
    );

Map<String, dynamic> _$PopularProductToJson(PopularProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'img': instance.imageUrl,
      'stars': instance.stars,
      'location': instance.location,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'type_id': instance.typeId,
    };
