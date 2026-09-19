// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String,
  title: json['title'] as String,
  updatedAt: (json['updatedAt'] as num).toInt(),
  rounds: (json['rounds'] as List<dynamic>)
      .map((e) => ChatRound.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'updatedAt': instance.updatedAt,
  'rounds': instance.rounds,
};
