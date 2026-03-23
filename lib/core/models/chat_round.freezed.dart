// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatRound _$ChatRoundFromJson(Map<String, dynamic> json) {
  return _ChatRound.fromJson(json);
}

/// @nodoc
mixin _$ChatRound {
  String get id => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get userContent => throw _privateConstructorUsedError;
  List<Attachment> get userAttachments => throw _privateConstructorUsedError;
  String? get assistantThinking => throw _privateConstructorUsedError;
  String? get assistantContent => throw _privateConstructorUsedError;
  bool get isIncomplete => throw _privateConstructorUsedError;

  /// Serializes this ChatRound to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoundCopyWith<ChatRound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoundCopyWith<$Res> {
  factory $ChatRoundCopyWith(ChatRound value, $Res Function(ChatRound) then) =
      _$ChatRoundCopyWithImpl<$Res, ChatRound>;
  @useResult
  $Res call({
    String id,
    String? parentId,
    int createdAt,
    String userContent,
    List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    bool isIncomplete,
  });
}

/// @nodoc
class _$ChatRoundCopyWithImpl<$Res, $Val extends ChatRound>
    implements $ChatRoundCopyWith<$Res> {
  _$ChatRoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? createdAt = null,
    Object? userContent = null,
    Object? userAttachments = null,
    Object? assistantThinking = freezed,
    Object? assistantContent = freezed,
    Object? isIncomplete = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as int,
            userContent: null == userContent
                ? _value.userContent
                : userContent // ignore: cast_nullable_to_non_nullable
                      as String,
            userAttachments: null == userAttachments
                ? _value.userAttachments
                : userAttachments // ignore: cast_nullable_to_non_nullable
                      as List<Attachment>,
            assistantThinking: freezed == assistantThinking
                ? _value.assistantThinking
                : assistantThinking // ignore: cast_nullable_to_non_nullable
                      as String?,
            assistantContent: freezed == assistantContent
                ? _value.assistantContent
                : assistantContent // ignore: cast_nullable_to_non_nullable
                      as String?,
            isIncomplete: null == isIncomplete
                ? _value.isIncomplete
                : isIncomplete // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatRoundImplCopyWith<$Res>
    implements $ChatRoundCopyWith<$Res> {
  factory _$$ChatRoundImplCopyWith(
    _$ChatRoundImpl value,
    $Res Function(_$ChatRoundImpl) then,
  ) = __$$ChatRoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? parentId,
    int createdAt,
    String userContent,
    List<Attachment> userAttachments,
    String? assistantThinking,
    String? assistantContent,
    bool isIncomplete,
  });
}

/// @nodoc
class __$$ChatRoundImplCopyWithImpl<$Res>
    extends _$ChatRoundCopyWithImpl<$Res, _$ChatRoundImpl>
    implements _$$ChatRoundImplCopyWith<$Res> {
  __$$ChatRoundImplCopyWithImpl(
    _$ChatRoundImpl _value,
    $Res Function(_$ChatRoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? parentId = freezed,
    Object? createdAt = null,
    Object? userContent = null,
    Object? userAttachments = null,
    Object? assistantThinking = freezed,
    Object? assistantContent = freezed,
    Object? isIncomplete = null,
  }) {
    return _then(
      _$ChatRoundImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as int,
        userContent: null == userContent
            ? _value.userContent
            : userContent // ignore: cast_nullable_to_non_nullable
                  as String,
        userAttachments: null == userAttachments
            ? _value._userAttachments
            : userAttachments // ignore: cast_nullable_to_non_nullable
                  as List<Attachment>,
        assistantThinking: freezed == assistantThinking
            ? _value.assistantThinking
            : assistantThinking // ignore: cast_nullable_to_non_nullable
                  as String?,
        assistantContent: freezed == assistantContent
            ? _value.assistantContent
            : assistantContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        isIncomplete: null == isIncomplete
            ? _value.isIncomplete
            : isIncomplete // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoundImpl implements _ChatRound {
  const _$ChatRoundImpl({
    required this.id,
    this.parentId,
    required this.createdAt,
    required this.userContent,
    final List<Attachment> userAttachments = const [],
    this.assistantThinking,
    this.assistantContent,
    this.isIncomplete = false,
  }) : _userAttachments = userAttachments;

  factory _$ChatRoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoundImplFromJson(json);

  @override
  final String id;
  @override
  final String? parentId;
  @override
  final int createdAt;
  @override
  final String userContent;
  final List<Attachment> _userAttachments;
  @override
  @JsonKey()
  List<Attachment> get userAttachments {
    if (_userAttachments is EqualUnmodifiableListView) return _userAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAttachments);
  }

  @override
  final String? assistantThinking;
  @override
  final String? assistantContent;
  @override
  @JsonKey()
  final bool isIncomplete;

  @override
  String toString() {
    return 'ChatRound(id: $id, parentId: $parentId, createdAt: $createdAt, userContent: $userContent, userAttachments: $userAttachments, assistantThinking: $assistantThinking, assistantContent: $assistantContent, isIncomplete: $isIncomplete)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userContent, userContent) ||
                other.userContent == userContent) &&
            const DeepCollectionEquality().equals(
              other._userAttachments,
              _userAttachments,
            ) &&
            (identical(other.assistantThinking, assistantThinking) ||
                other.assistantThinking == assistantThinking) &&
            (identical(other.assistantContent, assistantContent) ||
                other.assistantContent == assistantContent) &&
            (identical(other.isIncomplete, isIncomplete) ||
                other.isIncomplete == isIncomplete));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    parentId,
    createdAt,
    userContent,
    const DeepCollectionEquality().hash(_userAttachments),
    assistantThinking,
    assistantContent,
    isIncomplete,
  );

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoundImplCopyWith<_$ChatRoundImpl> get copyWith =>
      __$$ChatRoundImplCopyWithImpl<_$ChatRoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoundImplToJson(this);
  }
}

abstract class _ChatRound implements ChatRound {
  const factory _ChatRound({
    required final String id,
    final String? parentId,
    required final int createdAt,
    required final String userContent,
    final List<Attachment> userAttachments,
    final String? assistantThinking,
    final String? assistantContent,
    final bool isIncomplete,
  }) = _$ChatRoundImpl;

  factory _ChatRound.fromJson(Map<String, dynamic> json) =
      _$ChatRoundImpl.fromJson;

  @override
  String get id;
  @override
  String? get parentId;
  @override
  int get createdAt;
  @override
  String get userContent;
  @override
  List<Attachment> get userAttachments;
  @override
  String? get assistantThinking;
  @override
  String? get assistantContent;
  @override
  bool get isIncomplete;

  /// Create a copy of ChatRound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoundImplCopyWith<_$ChatRoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
