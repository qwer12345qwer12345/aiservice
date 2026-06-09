// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      rounds: (json['rounds'] as List<dynamic>)
          .map((e) => ChatRound.fromJson(e as Map<String, dynamic>))
          .toList(),
      config: json['config'] == null
          ? null
          : SessionConfig.fromJson(json['config'] as Map<String, dynamic>),
      hasUnseenUpdate: json['hasUnseenUpdate'] as bool? ?? false,
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'rounds': instance.rounds,
      'config': instance.config,
      'hasUnseenUpdate': instance.hasUnseenUpdate,
    };

_$SessionConfigImpl _$$SessionConfigImplFromJson(Map<String, dynamic> json) =>
    _$SessionConfigImpl(
      model: json['model'] as String?,
      temperature: (json['temperature'] as num?)?.toDouble(),
      enableReasoning: json['enableReasoning'] as bool?,
    );

Map<String, dynamic> _$$SessionConfigImplToJson(_$SessionConfigImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'temperature': instance.temperature,
      'enableReasoning': instance.enableReasoning,
    };
