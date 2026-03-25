// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StreamStatus {
  String get content => throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  bool get isStreaming => throw _privateConstructorUsedError;

  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreamStatusCopyWith<StreamStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamStatusCopyWith<$Res> {
  factory $StreamStatusCopyWith(
    StreamStatus value,
    $Res Function(StreamStatus) then,
  ) = _$StreamStatusCopyWithImpl<$Res, StreamStatus>;
  @useResult
  $Res call({String content, String reasoning, bool isStreaming});
}

/// @nodoc
class _$StreamStatusCopyWithImpl<$Res, $Val extends StreamStatus>
    implements $StreamStatusCopyWith<$Res> {
  _$StreamStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? reasoning = null,
    Object? isStreaming = null,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            reasoning: null == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String,
            isStreaming: null == isStreaming
                ? _value.isStreaming
                : isStreaming // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StreamStatusImplCopyWith<$Res>
    implements $StreamStatusCopyWith<$Res> {
  factory _$$StreamStatusImplCopyWith(
    _$StreamStatusImpl value,
    $Res Function(_$StreamStatusImpl) then,
  ) = __$$StreamStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, String reasoning, bool isStreaming});
}

/// @nodoc
class __$$StreamStatusImplCopyWithImpl<$Res>
    extends _$StreamStatusCopyWithImpl<$Res, _$StreamStatusImpl>
    implements _$$StreamStatusImplCopyWith<$Res> {
  __$$StreamStatusImplCopyWithImpl(
    _$StreamStatusImpl _value,
    $Res Function(_$StreamStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? reasoning = null,
    Object? isStreaming = null,
  }) {
    return _then(
      _$StreamStatusImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
        isStreaming: null == isStreaming
            ? _value.isStreaming
            : isStreaming // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$StreamStatusImpl implements _StreamStatus {
  const _$StreamStatusImpl({
    this.content = '',
    this.reasoning = '',
    this.isStreaming = false,
  });

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String reasoning;
  @override
  @JsonKey()
  final bool isStreaming;

  @override
  String toString() {
    return 'StreamStatus(content: $content, reasoning: $reasoning, isStreaming: $isStreaming)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamStatusImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.isStreaming, isStreaming) ||
                other.isStreaming == isStreaming));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, reasoning, isStreaming);

  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamStatusImplCopyWith<_$StreamStatusImpl> get copyWith =>
      __$$StreamStatusImplCopyWithImpl<_$StreamStatusImpl>(this, _$identity);
}

abstract class _StreamStatus implements StreamStatus {
  const factory _StreamStatus({
    final String content,
    final String reasoning,
    final bool isStreaming,
  }) = _$StreamStatusImpl;

  @override
  String get content;
  @override
  String get reasoning;
  @override
  bool get isStreaming;

  /// Create a copy of StreamStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamStatusImplCopyWith<_$StreamStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  Session? get session => throw _privateConstructorUsedError;
  String? get currentRoundId => throw _privateConstructorUsedError;
  ChatPageList? get pageList => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call({
    Session? session,
    String? currentRoundId,
    ChatPageList? pageList,
    String? error,
    bool isLoading,
  });

  $SessionCopyWith<$Res>? get session;
  $ChatPageListCopyWith<$Res>? get pageList;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? currentRoundId = freezed,
    Object? pageList = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _value.copyWith(
            session: freezed == session
                ? _value.session
                : session // ignore: cast_nullable_to_non_nullable
                      as Session?,
            currentRoundId: freezed == currentRoundId
                ? _value.currentRoundId
                : currentRoundId // ignore: cast_nullable_to_non_nullable
                      as String?,
            pageList: freezed == pageList
                ? _value.pageList
                : pageList // ignore: cast_nullable_to_non_nullable
                      as ChatPageList?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res>? get session {
    if (_value.session == null) {
      return null;
    }

    return $SessionCopyWith<$Res>(_value.session!, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatPageListCopyWith<$Res>? get pageList {
    if (_value.pageList == null) {
      return null;
    }

    return $ChatPageListCopyWith<$Res>(_value.pageList!, (value) {
      return _then(_value.copyWith(pageList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatStateImplCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$$ChatStateImplCopyWith(
    _$ChatStateImpl value,
    $Res Function(_$ChatStateImpl) then,
  ) = __$$ChatStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Session? session,
    String? currentRoundId,
    ChatPageList? pageList,
    String? error,
    bool isLoading,
  });

  @override
  $SessionCopyWith<$Res>? get session;
  @override
  $ChatPageListCopyWith<$Res>? get pageList;
}

/// @nodoc
class __$$ChatStateImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatStateImpl>
    implements _$$ChatStateImplCopyWith<$Res> {
  __$$ChatStateImplCopyWithImpl(
    _$ChatStateImpl _value,
    $Res Function(_$ChatStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = freezed,
    Object? currentRoundId = freezed,
    Object? pageList = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(
      _$ChatStateImpl(
        session: freezed == session
            ? _value.session
            : session // ignore: cast_nullable_to_non_nullable
                  as Session?,
        currentRoundId: freezed == currentRoundId
            ? _value.currentRoundId
            : currentRoundId // ignore: cast_nullable_to_non_nullable
                  as String?,
        pageList: freezed == pageList
            ? _value.pageList
            : pageList // ignore: cast_nullable_to_non_nullable
                  as ChatPageList?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ChatStateImpl implements _ChatState {
  const _$ChatStateImpl({
    this.session,
    this.currentRoundId,
    this.pageList,
    this.error,
    this.isLoading = false,
  });

  @override
  final Session? session;
  @override
  final String? currentRoundId;
  @override
  final ChatPageList? pageList;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ChatState(session: $session, currentRoundId: $currentRoundId, pageList: $pageList, error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatStateImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.currentRoundId, currentRoundId) ||
                other.currentRoundId == currentRoundId) &&
            (identical(other.pageList, pageList) ||
                other.pageList == pageList) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    session,
    currentRoundId,
    pageList,
    error,
    isLoading,
  );

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      __$$ChatStateImplCopyWithImpl<_$ChatStateImpl>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState({
    final Session? session,
    final String? currentRoundId,
    final ChatPageList? pageList,
    final String? error,
    final bool isLoading,
  }) = _$ChatStateImpl;

  @override
  Session? get session;
  @override
  String? get currentRoundId;
  @override
  ChatPageList? get pageList;
  @override
  String? get error;
  @override
  bool get isLoading;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatStateImplCopyWith<_$ChatStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
