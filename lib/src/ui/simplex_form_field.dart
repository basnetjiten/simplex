/*
 * @Author: Jiten Basnet
 * @Company: EB Pearls
 * @Date: 13/12/2024
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A customized [TextFormField] wrapper that provides a standardized look and feel
/// across the application with simplified configuration.
///
/// It includes built-in support for:
/// - Password visibility toggling when [keyboardType] is [TextInputType.visiblePassword].
/// - Standardized borders and padding.
/// - Automatic focus management on tap outside and editing completion.
/// - Easy configuration of text capitalization styles.
class SimplexFormField extends StatelessWidget {
  /// Creates a [SimplexFormField].
  const SimplexFormField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.suffixIcon,
    this.inputAction,
    this.onFieldSubmitted,
    this.readonly = false,
    this.focusedBorder,
    this.disabledBorder,
    this.onTap,
    this.focusNode,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onEditingComplete,
    this.style,
    this.textAlign,
    this.contentPadding,
    this.fillColor,
    this.autoFocus = false,
    this.maxLength,
    this.onSuffixPressed,
    this.initialValue,
    this.inputFormatters,
    this.showCounterText = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.disableBorder = false,
    this.hintStyle,
    this.cursorColor,
    this.border,
    this.errorMaxLines,
    this.errorFontSize,
    this.sentenceCapitalization = false,
    this.autoCorrect = false,
    this.wordCapitalization = false,
    this.characterCapitalization = false,
    this.inputDecoration,
    this.obscureColor,
    this.nonObscureColor,
    this.passwordIcon,
    this.passwordObscureIcon,
    this.passwordIconSize,
    this.labelStyle,
    this.label,
    this.labelText,
    this.cursorHeight,
    this.borderRadius,
    this.alignVertical,
    this.prefixIconConstraints,
  });

  /// An icon to display before the text.
  final Widget? prefixIcon;

  /// An icon to display after the text.
  final Widget? suffixIcon;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that appears below the field when there is an error.
  final String? errorText;

  /// Whether to show the character counter text when [maxLength] is set.
  final bool showCounterText;

  /// The maximum number of lines for the text.
  final int? maxLines;

  /// The minimum number of lines for the text.
  final int? minLines;

  /// The type of information for which to optimize the text input control.
  final TextInputType? keyboardType;

  /// The type of action button to use for the keyboard.
  final TextInputAction? inputAction;

  /// Called when the text being edited changes.
  final void Function(String)? onChanged;

  /// Whether the field is read-only.
  final bool readonly;

  /// The border to display around the field.
  final InputBorder? border;

  /// The border to display when the field has focus.
  final InputBorder? focusedBorder;

  /// The border to display when the field is disabled.
  final InputBorder? disabledBorder;

  /// Called when the user taps on the field.
  final Function()? onTap;

  /// Called when the user indicates they are done editing the text.
  final Function(String)? onFieldSubmitted;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// An optional method that validates an input.
  final String? Function(String?)? validator;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// Called when the user finishes editing.
  final Function()? onEditingComplete;

  /// The style to use for the text being edited.
  final TextStyle? style;

  /// The style to use for the [hintText].
  final TextStyle? hintStyle;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The padding around the text.
  final EdgeInsetsGeometry? contentPadding;

  /// Called when the [suffixIcon] (password toggle) is pressed.
  final Function()? onSuffixPressed;

  /// The color to fill the field background with.
  final Color? fillColor;

  /// The maximum number of characters allowed in the field.
  final int? maxLength;

  /// Used to enable/disable automatic validation.
  final AutovalidateMode? autoValidateMode;

  /// Optional input formatters for the field.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to disable the border entirely.
  final bool disableBorder;

  /// The color of the cursor.
  final Color? cursorColor;

  /// The height of the cursor.
  final double? cursorHeight;

  /// The maximum number of lines for the [errorText].
  final int? errorMaxLines;

  /// The font size for the [errorText].
  final double? errorFontSize;

  /// The size of the password toggle icon.
  final double? passwordIconSize;

  /// The border radius for the field.
  final double? borderRadius;

  /// Whether the field should be focused automatically.
  final bool autoFocus;

  /// Whether to capitalize the first letter of each sentence.
  final bool sentenceCapitalization;

  /// Whether to capitalize the first letter of each word.
  final bool wordCapitalization;

  /// Whether to capitalize every character.
  final bool characterCapitalization;

  /// The initial value of the field.
  final String? initialValue;

  /// The color of the password toggle icon when text is obscured.
  final Color? obscureColor;

  /// The color of the password toggle icon when text is NOT obscured.
  final Color? nonObscureColor;

  /// Custom [InputDecoration] to override the default.
  final InputDecoration? inputDecoration;

  /// Custom icon for the password toggle (visible state).
  final IconData? passwordIcon;

  /// Custom icon for the password toggle (obscured state).
  final IconData? passwordObscureIcon;

  /// The style to use for the label.
  final TextStyle? labelStyle;

  /// A widget to display as the label.
  final Widget? label;

  /// Text to display as the label.
  final String? labelText;

  /// How the text should be aligned vertically.
  final TextAlignVertical? alignVertical;

  /// Constraints for the [prefixIcon].
  final BoxConstraints? prefixIconConstraints;

  /// Whether to enable auto-correction.
  final bool autoCorrect;

  @override
  Widget build(BuildContext context) => TextFormField(
    autocorrect: autoCorrect,
    textAlignVertical: alignVertical,
    textCapitalization: getTextCapitalization(
      sentenceCapitalization: sentenceCapitalization,
      wordCapitalization: wordCapitalization,
      characterCapitalization: characterCapitalization,
    ),
    onTapOutside: (PointerDownEvent data) =>
        FocusScope.of(context).requestFocus(FocusNode()),
    cursorColor: cursorColor,
    enableSuggestions: false,
    cursorHeight: cursorHeight ?? 16.0,
    initialValue: initialValue,
    inputFormatters: inputFormatters,
    textAlign: textAlign ?? TextAlign.start,
    autofocus: autoFocus,
    obscureText: obscureText,
    controller: controller,
    focusNode: focusNode,
    onTap: onTap,
    readOnly: readonly,
    style: style,
    maxLines: maxLines,
    minLines: minLines,
    keyboardType: keyboardType,
    textInputAction: inputAction ?? TextInputAction.next,
    onChanged: onChanged,
    validator: validator,
    autovalidateMode: autoValidateMode,
    maxLength: maxLength,
    onEditingComplete:
        onEditingComplete ??
        () => FocusScope.of(context).requestFocus(FocusNode()),
    decoration:
        inputDecoration ??
        InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          counterText: showCounterText ? null : '',
          contentPadding: contentPadding,
          helperText: '',
          labelStyle: labelStyle,
          label: label,
          labelText: labelText,
          alignLabelWithHint: false,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          border: border,
          focusedBorder: disableBorder ? InputBorder.none : focusedBorder,
          enabledBorder: disableBorder ? InputBorder.none : focusedBorder,
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: hintStyle,
          errorMaxLines: errorMaxLines ?? 2,
          errorText: errorText,
          suffixIcon: keyboardType == TextInputType.visiblePassword
              ? IconButton(
                  onPressed: onSuffixPressed,
                  icon: !obscureText
                      ? suffixIcon ?? const Icon(Icons.visibility)
                      : suffixIcon ?? const Icon(Icons.visibility_off),
                  color: !obscureText
                      ? obscureColor ?? Colors.black
                      : nonObscureColor ?? Colors.black,
                )
              : suffixIcon,
          disabledBorder: disabledBorder,
        ),
  );

  TextCapitalization getTextCapitalization({
    required bool sentenceCapitalization,
    required bool wordCapitalization,
    required bool characterCapitalization,
  }) {
    if (sentenceCapitalization) {
      return TextCapitalization.sentences;
    } else if (wordCapitalization) {
      return TextCapitalization.words;
    } else if (characterCapitalization) {
      return TextCapitalization.characters;
    } else {
      return TextCapitalization.none;
    }
  }
}
