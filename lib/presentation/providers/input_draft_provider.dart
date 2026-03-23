import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pending_attachment.dart';

final globalInputDraftProvider = StateProvider<String>((ref) => '');

final globalAttachmentDraftProvider =
    StateProvider<List<PendingAttachment>>((ref) => []);