import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/services/character_card_parser.dart';

/// 当前会话激活的角色（可为 null）
final currentCharacterProvider = StateProvider<CharacterData?>((ref) => null);

/// 角色开场白是否已发送（避免重复发送）
final characterGreetingSentProvider = StateProvider<bool>((ref) => false);