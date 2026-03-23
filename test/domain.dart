import 'package:flutter_test/flutter_test.dart';
import 'package:aiservice/core/models/message.dart';
import 'package:aiservice/core/models/session.dart';
import 'package:aiservice/domain/models/tree_node.dart';
import 'package:aiservice/domain/models/chat_page.dart';
import 'package:aiservice/domain/services/tree_builder.dart';
import 'package:aiservice/domain/services/message_paginator.dart';
import 'package:aiservice/domain/services/branch_navigator.dart';
import 'package:aiservice/domain/states/chat_state.dart';
import 'package:aiservice/domain/states/branch_state.dart';

void main() {
  group('Domain Layer Tests', () {
    
    // ==========================================
    // 1. TreeBuilder 测试
    // ==========================================
    group('TreeBuilder', () {
      test('空消息列表返回空树', () {
        final result = TreeBuilder.buildTree([]);
        expect(result, isEmpty);
      });

      test('单条消息构建成功', () {
        final messages = [
          Message(
            id: 'msg1',
            parentId: 'null',
            role: 'user',
            content: 'Hello',
            timestamp: 0,
          ),
        ];
        final result = TreeBuilder.buildTree(messages);
        expect(result.length, 1);
        expect(result.first.id, 'msg1');
        expect(result.first.children, isEmpty);
      });

      test('父子关系构建成功', () {
        final messages = [
          Message(
            id: 'msg1',
            parentId: 'null',
            role: 'user',
            content: 'Hello',
            timestamp: 0,
          ),
          Message(
            id: 'msg2',
            parentId: 'msg1',
            role: 'assistant',
            content: 'Hi',
            timestamp: 1,
          ),
        ];
        final result = TreeBuilder.buildTree(messages);
        expect(result.length, 1);
        expect(result.first.children.length, 1);
        expect(result.first.children.first.id, 'msg2');
      });

      test('分支结构构建成功', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg1', role: 'user', content: 'Q2', timestamp: 2),
          Message(id: 'msg4', parentId: 'msg3', role: 'assistant', content: 'A2', timestamp: 3),
        ];
        final result = TreeBuilder.buildTree(messages);
        expect(result.length, 1);
        expect(result.first.children.length, 2); // 两个分支
      });

      test('findPath 找到正确路径', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg2', role: 'user', content: 'Q2', timestamp: 2),
        ];
        final roots = TreeBuilder.buildTree(messages);
        final path = TreeBuilder.findPath(roots, 'msg3');
        expect(path, isNotNull);
        expect(path!.nodes.length, 3);
        expect(path.targetNode.id, 'msg3');
      });

      test('findLeafNodes 找到所有叶子', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg1', role: 'user', content: 'Q2', timestamp: 2),
          Message(id: 'msg4', parentId: 'msg3', role: 'assistant', content: 'A2', timestamp: 3),
        ];
        final roots = TreeBuilder.buildTree(messages);
        final leaves = TreeBuilder.findLeafNodes(roots);
        expect(leaves.length, 2); // msg2 和 msg4 是叶子
      });

      test('findLatestLeaf 找到最新叶子', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg2', role: 'user', content: 'Q2', timestamp: 2),
        ];
        final roots = TreeBuilder.buildTree(messages);
        final latest = TreeBuilder.findLatestLeaf(roots.first);
        expect(latest?.id, 'msg3');
      });
    });

    // ==========================================
    // 2. MessagePaginator 测试
    // ==========================================
    group('MessagePaginator', () {
      test('空消息返回空页列表', () {
        final result = MessagePaginator.paginate([], 0);
        expect(result.pages, isEmpty);
        expect(result.totalPages, 0);
      });

      test('一问一答配对成功', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A', timestamp: 1),
        ];
        final result = MessagePaginator.paginate(messages, 0);
        expect(result.pages.length, 1);
        expect(result.pages.first.userMessage.content, 'Q');
        expect(result.pages.first.aiMessage?.content, 'A');
      });

      test('多轮对话分页成功', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg2', role: 'user', content: 'Q2', timestamp: 2),
          Message(id: 'msg4', parentId: 'msg3', role: 'assistant', content: 'A2', timestamp: 3),
        ];
        final result = MessagePaginator.paginate(messages, 0);
        expect(result.pages.length, 2);
        expect(result.pages[0].userMessage.content, 'Q1');
        expect(result.pages[1].userMessage.content, 'Q2');
      });

      test('用户消息无回复时标记为不完整', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q', timestamp: 0),
        ];
        final result = MessagePaginator.paginate(messages, 0);
        expect(result.pages.length, 1);
        expect(result.pages.first.aiMessage, isNull);
        expect(result.pages.first.isIncomplete, true);
      });

      test('getTotalPages 计算正确', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg2', role: 'user', content: 'Q2', timestamp: 2),
        ];
        final totalPages = MessagePaginator.getTotalPages(messages);
        expect(totalPages, 2);
      });
    });

    // ==========================================
    // 3. BranchNavigator 测试
    // ==========================================
    group('BranchNavigator', () {
      test('空会话返回空路径', () {
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: [],
        );
        final result = BranchNavigator.getCurrentBranchPath(session, 'any');
        expect(result, isEmpty);
      });

      test('获取当前分支路径', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg2', role: 'user', content: 'Q2', timestamp: 2),
        ];
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: messages,
        );
        final result = BranchNavigator.getCurrentBranchPath(session, 'msg3');
        expect(result.length, 3);
        expect(result.first.id, 'msg1');
        expect(result.last.id, 'msg3');
      });

      test('switchBranch 切换到最新叶子', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg2', role: 'user', content: 'Q2', timestamp: 2),
        ];
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: messages,
        );
        final newLeafId = BranchNavigator.switchBranch(session, 'msg1');
        expect(newLeafId, 'msg3'); // 应该切换到最新叶子
      });

      test('isOnLatestBranch 判断正确', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg1', role: 'user', content: 'Q2', timestamp: 2),
          Message(id: 'msg4', parentId: 'msg3', role: 'assistant', content: 'A2', timestamp: 3),
        ];
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: messages,
        );
        expect(BranchNavigator.isOnLatestBranch(session, 'msg2'), false); // 旧分支
        expect(BranchNavigator.isOnLatestBranch(session, 'msg4'), true);  // 最新分支
      });

      test('getNextParentId 获取正确父节点', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
        ];
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: messages,
        );
        // 当前在 AI 消息，父节点应该是 msg1
        final parentId = BranchNavigator.getNextParentId(session, 'msg2');
        expect(parentId, 'msg1');
      });
    });

    // ==========================================
    // 4. ChatState 测试
    // ==========================================
    group('ChatState', () {
      test('初始状态正确', () {
        final state = ChatState.initial();
        expect(state.isStreaming, false);
        expect(state.error, isNull);
        expect(state.isLoading, false);
      });

      test('copyWithSession 更新成功', () {
        final state = ChatState.initial();
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: [],
        );
        final updated = state.copyWithSession(session);
        expect(updated.session, session);
        expect(updated.isLoading, false);
      });

      test('copyWithStreaming 更新成功', () {
        final state = ChatState.initial();
        final updated = state.copyWithStreaming(content: 'Hello', isDone: false);
        expect(updated.isStreaming, true);
        expect(updated.streamingContent, 'Hello');
      });

      test('copyWithError 更新成功', () {
        final state = ChatState.initial();
        final updated = state.copyWithError('网络错误');
        expect(updated.error, '网络错误');
        expect(updated.isStreaming, false);
      });
    });

    // ==========================================
    // 5. BranchState 测试
    // ==========================================
    group('BranchState', () {
      test('初始状态正确', () {
        final state = BranchState.initial();
        expect(state.roots, isEmpty);
        expect(state.selectedNodeId, isNull);
        expect(state.isVisible, false);
      });

      test('copyWithRoots 更新成功', () {
        final state = BranchState.initial();
        final roots = [
          TreeNode(
            id: 'node1',
            parentId: 'null',
            message: Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q', timestamp: 0),
            children: [],
            depth: 0,
          ),
        ];
        final updated = state.copyWithRoots(roots);
        expect(updated.roots.length, 1);
      });

      test('hasSelection 判断正确', () {
        final state1 = BranchState.initial();
        expect(state1.hasSelection, false);

        final state2 = state1.copyWithSelectedNode('node1');
        expect(state2.hasSelection, true);
      });

      test('canNavigate 判断正确', () {
        final state = BranchState.initial().copyWithSelectedNode('node1');
        expect(state.canNavigate, false); // 没有高亮路径

        final roots = [
          TreeNode(
            id: 'node1',
            parentId: 'null',
            message: Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q', timestamp: 0),
            children: [],
            depth: 0,
          ),
        ];
        final updated = state.copyWithHighlightedPath(roots);
        expect(updated.canNavigate, true);
      });
    });

    // ==========================================
    // 6. 集成测试
    // ==========================================
    group('Integration Tests', () {
      test('完整分支导航流程', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg2', role: 'user', content: 'Q2', timestamp: 2),
          Message(id: 'msg4', parentId: 'msg3', role: 'assistant', content: 'A2', timestamp: 3),
        ];
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: messages,
        );

        // 1. 获取当前分支路径
        final path = BranchNavigator.getCurrentBranchPath(session, 'msg4');
        expect(path.length, 4);

        // 2. 分页
        final pages = MessagePaginator.paginate(path, 0);
        expect(pages.pages.length, 2);

        // 3. 切换到旧分支
        final newLeafId = BranchNavigator.switchBranch(session, 'msg2');
        expect(newLeafId, 'msg4'); // 应该还是最新叶子

        // 4. 判断是否在最新分支
        expect(BranchNavigator.isOnLatestBranch(session, 'msg4'), true);
      });

      test('多分支场景', () {
        final messages = [
          Message(id: 'msg1', parentId: 'null', role: 'user', content: 'Q1', timestamp: 0),
          Message(id: 'msg2', parentId: 'msg1', role: 'assistant', content: 'A1', timestamp: 1),
          Message(id: 'msg3', parentId: 'msg1', role: 'user', content: 'Q2', timestamp: 2),
          Message(id: 'msg4', parentId: 'msg3', role: 'assistant', content: 'A2', timestamp: 3),
        ];
        final session = Session(
          id: 'test',
          title: '测试',
          createdAt: 0,
          updatedAt: 0,
          messages: messages,
        );

        // 两个分支叶子：msg2 和 msg4
        final leaves = BranchNavigator.getAllBranchLeaves(session);
        expect(leaves.length, 2);

        // msg2 是旧分支
        expect(BranchNavigator.isOnLatestBranch(session, 'msg2'), false);
        // msg4 是新分支
        expect(BranchNavigator.isOnLatestBranch(session, 'msg4'), true);
      });
    });
  });
}