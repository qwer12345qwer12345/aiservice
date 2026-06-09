// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      updatedAt: (json['updatedAt'] as num).toInt(),
      rounds: (json['rounds'] as List<dynamic>)
          .map((e) => ChatRound.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'rounds': instance.rounds,
    };
