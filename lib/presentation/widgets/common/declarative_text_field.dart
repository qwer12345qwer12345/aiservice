import 'package:flutter/cupertino.dart';

/// 声明式受控文本输入框
/// 自动与外部 value 同步，无需手动管理 TextEditingController
class DeclarativeCupertinoTextField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String? placeholder;
  final TextInputType? keyboardType;
  final bool obscureText;

  const DeclarativeCupertinoTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.placeholder,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  State<DeclarativeCupertinoTextField> createState() => _DeclarativeCupertinoTextFieldState();
}

class _DeclarativeCupertinoTextFieldState extends State<DeclarativeCupertinoTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(DeclarativeCupertinoTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      final selection = _controller.selection;
      _controller.text = widget.value;
      // 尽量保持光标位置
      if (selection.isValid && selection.baseOffset <= widget.value.length) {
        _controller.selection = selection;
      } else {
        _controller.selection = TextSelection.collapsed(offset: widget.value.length);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: _controller,
      placeholder: widget.placeholder,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
    );
  }
}