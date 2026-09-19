// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TreeNode {

 String get id; String? get parentId; List<TreeNode> get children; int get depth;
/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreeNodeCopyWith<TreeNode> get copyWith => _$TreeNodeCopyWithImpl<TreeNode>(this as TreeNode, _$identity);

  /// Serializes this TreeNode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TreeNode;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreeNode&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.parentId, _this.parentId) || other.parentId == _this.parentId)&&const DeepCollectionEquality().equals(other.children, _this.children)&&(identical(other.depth, _this.depth) || other.depth == _this.depth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TreeNode;
  return Object.hash(runtimeType,_this.id,_this.parentId,const DeepCollectionEquality().hash(_this.children),_this.depth);
}

@override
String toString() {
  final _this = this as TreeNode;
  return 'TreeNode(id: ${_this.id}, parentId: ${_this.parentId}, children: ${_this.children}, depth: ${_this.depth})';
}


}

/// @nodoc
abstract mixin class $TreeNodeCopyWith<$Res>  {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) _then) = _$TreeNodeCopyWithImpl;
@useResult
$Res call({
 String id, String? parentId, List<TreeNode> children, int depth
});




}
/// @nodoc
class _$TreeNodeCopyWithImpl<$Res>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._self, this._then);

  final TreeNode _self;
  final $Res Function(TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? parentId = freezed,Object? children = null,Object? depth = null,}) {
  return _then(TreeNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,children: null == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TreeNode].
extension TreeNodePatterns on TreeNode {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreeNode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreeNode value)  $default,){
final _that = this;
switch (_that) {
case _TreeNode():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreeNode value)?  $default,){
final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? parentId,  List<TreeNode> children,  int depth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that.id,_that.parentId,_that.children,_that.depth);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? parentId,  List<TreeNode> children,  int depth)  $default,) {final _that = this;
switch (_that) {
case _TreeNode():
return $default(_that.id,_that.parentId,_that.children,_that.depth);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? parentId,  List<TreeNode> children,  int depth)?  $default,) {final _that = this;
switch (_that) {
case _TreeNode() when $default != null:
return $default(_that.id,_that.parentId,_that.children,_that.depth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TreeNode implements TreeNode {
  const _TreeNode({required this.id, this.parentId, required  List<TreeNode> children, required this.depth}): _children = children;
  factory _TreeNode.fromJson(Map<String, dynamic> json) => _$TreeNodeFromJson(json);

@override final  String id;
@override final  String? parentId;
 final  List<TreeNode> _children;
@override List<TreeNode> get children {
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_children);
}

@override final  int depth;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreeNodeCopyWith<_TreeNode> get copyWith => __$TreeNodeCopyWithImpl<_TreeNode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TreeNodeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreeNode&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&const DeepCollectionEquality().equals(other.children, _children)&&(identical(other.depth, depth) || other.depth == depth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,parentId,const DeepCollectionEquality().hash(_children),depth);
}

@override
String toString() {
    return 'TreeNode(id: $id, parentId: $parentId, children: $children, depth: $depth)';
}


}

/// @nodoc
abstract mixin class _$TreeNodeCopyWith<$Res> implements $TreeNodeCopyWith<$Res> {
  factory _$TreeNodeCopyWith(_TreeNode value, $Res Function(_TreeNode) _then) = __$TreeNodeCopyWithImpl;
@override @useResult
$Res call({
 String id, String? parentId, List<TreeNode> children, int depth
});




}
/// @nodoc
class __$TreeNodeCopyWithImpl<$Res>
    implements _$TreeNodeCopyWith<$Res> {
  __$TreeNodeCopyWithImpl(this._self, this._then);

  final _TreeNode _self;
  final $Res Function(_TreeNode) _then;

/// Create a copy of TreeNode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? parentId = freezed,Object? children = null,Object? depth = null,}) {
  return _then(_TreeNode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,children: null == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,depth: null == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TreePath {

 List<TreeNode> get nodes; TreeNode get targetNode;
/// Create a copy of TreePath
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreePathCopyWith<TreePath> get copyWith => _$TreePathCopyWithImpl<TreePath>(this as TreePath, _$identity);

  /// Serializes this TreePath to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TreePath;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreePath&&const DeepCollectionEquality().equals(other.nodes, _this.nodes)&&(identical(other.targetNode, _this.targetNode) || other.targetNode == _this.targetNode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TreePath;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.nodes),_this.targetNode);
}

@override
String toString() {
  final _this = this as TreePath;
  return 'TreePath(nodes: ${_this.nodes}, targetNode: ${_this.targetNode})';
}


}

/// @nodoc
abstract mixin class $TreePathCopyWith<$Res>  {
  factory $TreePathCopyWith(TreePath value, $Res Function(TreePath) _then) = _$TreePathCopyWithImpl;
@useResult
$Res call({
 List<TreeNode> nodes, TreeNode targetNode
});


$TreeNodeCopyWith<$Res> get targetNode;

}
/// @nodoc
class _$TreePathCopyWithImpl<$Res>
    implements $TreePathCopyWith<$Res> {
  _$TreePathCopyWithImpl(this._self, this._then);

  final TreePath _self;
  final $Res Function(TreePath) _then;

/// Create a copy of TreePath
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nodes = null,Object? targetNode = null,}) {
  return _then(TreePath(
nodes: null == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,targetNode: null == targetNode ? _self.targetNode : targetNode // ignore: cast_nullable_to_non_nullable
as TreeNode,
  ));
}
/// Create a copy of TreePath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeNodeCopyWith<$Res> get targetNode {
  
  return $TreeNodeCopyWith<$Res>(_self.targetNode, (value) {
    return _then(_self.copyWith(targetNode: value));
  });
}
}


/// Adds pattern-matching-related methods to [TreePath].
extension TreePathPatterns on TreePath {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TreePath value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TreePath() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TreePath value)  $default,){
final _that = this;
switch (_that) {
case _TreePath():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TreePath value)?  $default,){
final _that = this;
switch (_that) {
case _TreePath() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TreeNode> nodes,  TreeNode targetNode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TreePath() when $default != null:
return $default(_that.nodes,_that.targetNode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TreeNode> nodes,  TreeNode targetNode)  $default,) {final _that = this;
switch (_that) {
case _TreePath():
return $default(_that.nodes,_that.targetNode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TreeNode> nodes,  TreeNode targetNode)?  $default,) {final _that = this;
switch (_that) {
case _TreePath() when $default != null:
return $default(_that.nodes,_that.targetNode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TreePath implements TreePath {
  const _TreePath({required  List<TreeNode> nodes, required this.targetNode}): _nodes = nodes;
  factory _TreePath.fromJson(Map<String, dynamic> json) => _$TreePathFromJson(json);

 final  List<TreeNode> _nodes;
@override List<TreeNode> get nodes {
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nodes);
}

@override final  TreeNode targetNode;

/// Create a copy of TreePath
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TreePathCopyWith<_TreePath> get copyWith => __$TreePathCopyWithImpl<_TreePath>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TreePathToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TreePath&&const DeepCollectionEquality().equals(other.nodes, _nodes)&&(identical(other.targetNode, targetNode) || other.targetNode == targetNode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_nodes),targetNode);
}

@override
String toString() {
    return 'TreePath(nodes: $nodes, targetNode: $targetNode)';
}


}

/// @nodoc
abstract mixin class _$TreePathCopyWith<$Res> implements $TreePathCopyWith<$Res> {
  factory _$TreePathCopyWith(_TreePath value, $Res Function(_TreePath) _then) = __$TreePathCopyWithImpl;
@override @useResult
$Res call({
 List<TreeNode> nodes, TreeNode targetNode
});


@override $TreeNodeCopyWith<$Res> get targetNode;

}
/// @nodoc
class __$TreePathCopyWithImpl<$Res>
    implements _$TreePathCopyWith<$Res> {
  __$TreePathCopyWithImpl(this._self, this._then);

  final _TreePath _self;
  final $Res Function(_TreePath) _then;

/// Create a copy of TreePath
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nodes = null,Object? targetNode = null,}) {
  return _then(_TreePath(
nodes: null == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<TreeNode>,targetNode: null == targetNode ? _self.targetNode : targetNode // ignore: cast_nullable_to_non_nullable
as TreeNode,
  ));
}

/// Create a copy of TreePath
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TreeNodeCopyWith<$Res> get targetNode {
  
  return $TreeNodeCopyWith<$Res>(_self.targetNode, (value) {
    return _then(_self.copyWith(targetNode: value));
  });
}
}

// dart format on
