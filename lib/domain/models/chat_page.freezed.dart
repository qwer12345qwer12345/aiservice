// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatPage {
  int get pageIndex => throw _privateConstructorUsedError;
  ChatRound get round => throw _privateConstructorUsedError;

  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatPageCopyWith<ChatPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPageCopyWith<$Res> {
  factory $ChatPageCopyWith(ChatPage value, $Res Function(ChatPage) then) =
      _$ChatPageCopyWithImpl<$Res, ChatPage>;
  @useResult
  $Res call({int pageIndex, ChatRound round});

  $ChatRoundCopyWith<$Res> get round;
}

/// @nodoc
class _$ChatPageCopyWithImpl<$Res, $Val extends ChatPage>
    implements $ChatPageCopyWith<$Res> {
  _$ChatPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageIndex = null, Object? round = null}) {
    return _then(
      _value.copyWith(
            pageIndex: null == pageIndex
                ? _value.pageIndex
                : pageIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            round: null == round
                ? _value.round
                : round // ignore: cast_nullable_to_non_nullable
                      as ChatRound,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatRoundCopyWith<$Res> get round {
    return $ChatRoundCopyWith<$Res>(_value.round, (value) {
      return _then(_value.copyWith(round: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatPageImplCopyWith<$Res>
    implements $ChatPageCopyWith<$Res> {
  factory _$$ChatPageImplCopyWith(
    _$ChatPageImpl value,
    $Res Function(_$ChatPageImpl) then,
  ) = __$$ChatPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageIndex, ChatRound round});

  @override
  $ChatRoundCopyWith<$Res> get round;
}

/// @nodoc
class __$$ChatPageImplCopyWithImpl<$Res>
    extends _$ChatPageCopyWithImpl<$Res, _$ChatPageImpl>
    implements _$$ChatPageImplCopyWith<$Res> {
  __$$ChatPageImplCopyWithImpl(
    _$ChatPageImpl _value,
    $Res Function(_$ChatPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pageIndex = null, Object? round = null}) {
    return _then(
      _$ChatPageImpl(
        pageIndex: null == pageIndex
            ? _value.pageIndex
            : pageIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        round: null == round
            ? _value.round
            : round // ignore: cast_nullable_to_non_nullable
                  as ChatRound,
      ),
    );
  }
}

/// @nodoc

class _$ChatPageImpl implements _ChatPage {
  const _$ChatPageImpl({required this.pageIndex, required this.round});

  @override
  final int pageIndex;
  @override
  final ChatRound round;

  @override
  String toString() {
    return 'ChatPage(pageIndex: $pageIndex, round: $round)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.round, round) || other.round == round));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageIndex, round);

  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageImplCopyWith<_$ChatPageImpl> get copyWith =>
      __$$ChatPageImplCopyWithImpl<_$ChatPageImpl>(this, _$identity);
}

abstract class _ChatPage implements ChatPage {
  const factory _ChatPage({
    required final int pageIndex,
    required final ChatRound round,
  }) = _$ChatPageImpl;

  @override
  int get pageIndex;
  @override
  ChatRound get round;

  /// Create a copy of ChatPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatPageImplCopyWith<_$ChatPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatPageList {
  List<ChatPage> get pages => throw _privateConstructorUsedError;
  int get currentPageIndex => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatPageListCopyWith<ChatPageList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPageListCopyWith<$Res> {
  factory $ChatPageListCopyWith(
    ChatPageList value,
    $Res Function(ChatPageList) then,
  ) = _$ChatPageListCopyWithImpl<$Res, ChatPageList>;
  @useResult
  $Res call({List<ChatPage> pages, int currentPageIndex, int totalPages});
}

/// @nodoc
class _$ChatPageListCopyWithImpl<$Res, $Val extends ChatPageList>
    implements $ChatPageListCopyWith<$Res> {
  _$ChatPageListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pages = null,
    Object? currentPageIndex = null,
    Object? totalPages = null,
  }) {
    return _then(
      _value.copyWith(
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as List<ChatPage>,
            currentPageIndex: null == currentPageIndex
                ? _value.currentPageIndex
                : currentPageIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatPageListImplCopyWith<$Res>
    implements $ChatPageListCopyWith<$Res> {
  factory _$$ChatPageListImplCopyWith(
    _$ChatPageListImpl value,
    $Res Function(_$ChatPageListImpl) then,
  ) = __$$ChatPageListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatPage> pages, int currentPageIndex, int totalPages});
}

/// @nodoc
class __$$ChatPageListImplCopyWithImpl<$Res>
    extends _$ChatPageListCopyWithImpl<$Res, _$ChatPageListImpl>
    implements _$$ChatPageListImplCopyWith<$Res> {
  __$$ChatPageListImplCopyWithImpl(
    _$ChatPageListImpl _value,
    $Res Function(_$ChatPageListImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pages = null,
    Object? currentPageIndex = null,
    Object? totalPages = null,
  }) {
    return _then(
      _$ChatPageListImpl(
        pages: null == pages
            ? _value._pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as List<ChatPage>,
        currentPageIndex: null == currentPageIndex
            ? _value.currentPageIndex
            : currentPageIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$ChatPageListImpl implements _ChatPageList {
  const _$ChatPageListImpl({
    required final List<ChatPage> pages,
    required this.currentPageIndex,
    required this.totalPages,
  }) : _pages = pages;

  final List<ChatPage> _pages;
  @override
  List<ChatPage> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  @override
  final int currentPageIndex;
  @override
  final int totalPages;

  @override
  String toString() {
    return 'ChatPageList(pages: $pages, currentPageIndex: $currentPageIndex, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageListImpl &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            (identical(other.currentPageIndex, currentPageIndex) ||
                other.currentPageIndex == currentPageIndex) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_pages),
    currentPageIndex,
    totalPages,
  );

  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageListImplCopyWith<_$ChatPageListImpl> get copyWith =>
      __$$ChatPageListImplCopyWithImpl<_$ChatPageListImpl>(this, _$identity);
}

abstract class _ChatPageList implements ChatPageList {
  const factory _ChatPageList({
    required final List<ChatPage> pages,
    required final int currentPageIndex,
    required final int totalPages,
  }) = _$ChatPageListImpl;

  @override
  List<ChatPage> get pages;
  @override
  int get currentPageIndex;
  @override
  int get totalPages;

  /// Create a copy of ChatPageList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatPageListImplCopyWith<_$ChatPageListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
