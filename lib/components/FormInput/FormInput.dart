import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final onSave;

  final validator;

  /// change 事件
  final onChange;

  /// 提示文本
  final placeholder;

  /// border 类型
  final String border;

  /// 内边距
  final double padding;

  /// 填充色
  final Color background;

  /// 形状 square 和 circle
  final String shape;

  /// 是否密码类型
  final bool password;

  /// 最大长度
  final int? maxLength;

  /// 键盘类型
  final TextInputType type;

  /// 键盘右下角
  final TextInputAction inputAction;

  /// 有填充图标
  final prefixIcon;

  /// 右侧 自定义 widget
  final suffixIcon;

  /// 最大行数
  final int maxLines;

  /// 最小行数
  final int minLines;

  const FormInput({
    Key? key,
    required this.onSave,
    this.validator,
    this.onChange,
    this.placeholder,
    this.maxLength,
    this.type = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.padding = 14,
    this.password = false,
    this.shape = 'square',
    this.border = 'surround',
    this.inputAction = TextInputAction.none,
    this.background = const Color(0xffffffff),
  }) : super(key: key);

  _border() {
    if (border == 'none') {
      return InputBorder.none;
    } else if (border == 'surround') {
      return OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(shape == 'square' ? 6 : 100),
        ),
        borderSide: const BorderSide(
          color: Color(0xffdadbde),
          width: 1.0,
        ),
      );
    } else {
      return const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffdadbde),
          width: 1.0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) => onSave(value),
      validator: (value) {
        if (validator == null) return null;
        return validator(value);
      },
      decoration: InputDecoration(
        hintText: placeholder,
        isDense: true,
        filled: true,
        fillColor: background,
        enabledBorder: _border(),
        focusedBorder: _border(),
        errorBorder: _border(),
        focusedErrorBorder: _border(),
        contentPadding: EdgeInsets.all(padding),
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 12, top: 6, bottom: 6),
          child: suffixIcon,
        ),
      ),
    );
  }
}
