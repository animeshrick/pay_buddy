import 'package:flutter/material.dart';

import '../const/color_const.dart';
import '../extension/hex_color.dart';
import '../service/value_handler.dart';
import 'custom_text.dart';

class CustomDropDown<T> extends StatelessWidget {
  final T? selectedValue;
  final void Function(T?)? onChanged;
  final List<CustomDropDownModel<T>> items;

  const CustomDropDown({
    super.key,
    this.selectedValue,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: selectedValue,
      icon: const Icon(Icons.arrow_drop_down),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
      elevation: 1,
      style: customizeTextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontColor: HexColor.fromHex(ColorConst.primaryDark)),
      onChanged: onChanged,
      items: List.generate(
          items.length,
          (index) => DropdownMenuItem<T>(
                value: items.elementAt(index).value,
                child: CustomText(items.elementAt(index).title ?? '',
                    color: HexColor.fromHex(ColorConst.primaryDark), size: 13),
              )),
    );
  }
}

class CustomDropDownFormField<T> extends StatelessWidget {
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final String? hintText;
  final String? Function(T?)? validator;
  final T? value;
  final Widget? prefix;
  final Widget? label;

  const CustomDropDownFormField(
      {super.key,
      required this.onChanged,
      required this.items,
      this.hintText,
      this.validator,
      this.label,
      this.value,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      dropdownColor: Colors.white,
      value: value,
      items: items,
      onChanged: onChanged,
      hint: hintText != null
          ? CustomTextEnum(hintText!,
                  color: HexColor.fromHex(ColorConst.gray500))
              .textMediumMD()
          : null,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      iconDisabledColor: HexColor.fromHex(ColorConst.gray100),
      iconEnabledColor: HexColor.fromHex(ColorConst.gray500),
      decoration: InputDecoration(
        prefixIcon: prefix,
        filled: true,
        // labelText: labelText,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        label: label,
        contentPadding: ValueHandler().isTextNotEmptyOrNull(label)
            ? EdgeInsets.symmetric(vertical: 20, horizontal: 16)
            : EdgeInsets.only(left: 4),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: HexColor.fromHex(ColorConst.gray300),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: HexColor.fromHex(ColorConst.gray300),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: HexColor.fromHex(ColorConst.error400),
            width: 1,
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<T>> customItemList<T>({
  required List<CustomDropDownModel<T>> valueList,
}) =>
    List.generate(
        valueList.length,
        (index) => DropdownMenuItem<T>(
              value: valueList.elementAt(index).value,
              child: CustomTextEnum(valueList.elementAt(index).title ?? '',
                      color: HexColor.fromHex(ColorConst.primaryDark))
                  .textMediumMD(),
            ));

class CustomDropDownModel<T> {
  T? value;
  String? title;

  CustomDropDownModel({this.value, this.title});
}

class CustomMenuAnchor<T> extends StatelessWidget {
  final void Function(T?) onPressed;
  final Widget icon;
  final List<CustomDropDownModel<T>> items;
  final double? iconSize;
  final Color? color;

  const CustomMenuAnchor({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.items,
    this.iconSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(
            Colors.white), // Set background color to white
      ),
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          iconSize: iconSize,
          color: color,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: icon,
        );
      },
      menuChildren: List<MenuItemButton>.generate(
        items.length,
        (int index) => MenuItemButton(
          onPressed: () {
            onPressed(items.elementAt(index).value);
          },
          child: CustomText(items.elementAt(index).title ?? "",
              color: HexColor.fromHex(ColorConst.primaryDark), size: 13),
        ),
      ),
    );
  }
}

class CustomDropdownMenuFormField<T> extends StatelessWidget {
  final List<CustomDropDownModel<T>> items;
  final void Function(T?)? onChanged;
  final String? hintText;
  final Widget? prefix, suffix;
  final T? value;
  final String? Function(T?)? validator;
  final AutovalidateMode? autoValidateMode;

  const CustomDropdownMenuFormField({
    super.key,
    required this.onChanged,
    required this.items,
    this.hintText,
    this.prefix,
    this.suffix,
    this.value,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return _DropdownMenuFormField<T?>(
          validator: validator,
          autovalidateMode: autoValidateMode,
          width: constraints.maxWidth,
          menuStyle: const MenuStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
          ),
          initialSelection: value,
          leadingIcon: prefix,
          trailingIcon: suffix ??
              Icon(Icons.arrow_drop_down,
                  size: 24, color: HexColor.fromHex(ColorConst.primaryDark)),
          selectedTrailingIcon: suffix != null
              ? RotatedBox(
                  quarterTurns: 2,
                  child: suffix,
                )
              : Icon(Icons.arrow_drop_up,
                  size: 24, color: HexColor.fromHex(ColorConst.primaryDark)),
          hintText: hintText,
          textStyle: customizeTextStyle(
              fontColor: HexColor.fromHex(ColorConst.primaryDark),
              fontSize: 16),
          onSelected: onChanged,
          dropdownMenuEntries: List.generate(
              items.length,
              (index) => DropdownMenuEntry<T?>(
                  value: items.elementAt(index).value,
                  label: items.elementAt(index).title ?? "",
                  labelWidget: CustomTextEnum(
                    items.elementAt(index).title ?? "",
                    color: HexColor.fromHex(ColorConst.primaryDark),
                    // size: 16,
                  ).textMediumMD())),
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: customizeTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontColor: Colors.red),
            hintStyle: customizeTextStyle(
                fontColor: HexColor.fromHex(ColorConst.grey4), fontSize: 16),
            labelStyle: customizeTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontColor: HexColor.fromHex(ColorConst.color5)),
            floatingLabelStyle: customizeTextStyle(
                fontWeight: FontWeightEnum.Semibold,
                fontSize: 16,
                fontColor: HexColor.fromHex(ColorConst.brand600)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: HexColor.fromHex(ColorConst.gray300),
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ));
    });
  }
}

class _DropdownMenuFormField<T> extends FormField<T> {
  _DropdownMenuFormField({
    super.key,
    bool enabled = true,
    double? width,
    double? menuHeight,
    Widget? leadingIcon,
    Widget? trailingIcon,
    Widget? label,
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? selectedTrailingIcon,
    bool enableFilter = false,
    bool enableSearch = true,
    TextStyle? textStyle,
    InputDecorationTheme? inputDecorationTheme,
    MenuStyle? menuStyle,
    this.controller,
    T? initialSelection,
    this.onSelected,
    bool? requestFocusOnTap,
    EdgeInsets? expandedInsets,
    required List<DropdownMenuEntry<T>> dropdownMenuEntries,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.validator,
  }) : super(
            initialValue: initialSelection,
            builder: (FormFieldState<T> field) {
              final _DropdownMenuFormFieldState<T> state =
                  field as _DropdownMenuFormFieldState<T>;
              void onSelectedHandler(T? value) {
                field.didChange(value);
                onSelected?.call(value);
              }

              return DropdownMenu<T>(
                key: key,
                enabled: enabled,
                width: width,
                menuHeight: menuHeight,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon,
                label: label,
                hintText: hintText,
                helperText: helperText,
                errorText: state.errorText,
                selectedTrailingIcon: selectedTrailingIcon,
                enableFilter: enableFilter,
                enableSearch: enableSearch,
                textStyle: textStyle,
                inputDecorationTheme: inputDecorationTheme,
                menuStyle: menuStyle,
                controller: controller,
                initialSelection: state.value,
                onSelected: onSelectedHandler,
                requestFocusOnTap: requestFocusOnTap,
                expandedInsets: expandedInsets,
                dropdownMenuEntries: dropdownMenuEntries,
              );
            });

  final ValueChanged<T?>? onSelected;

  final TextEditingController? controller;

  @override
  FormFieldState<T> createState() => _DropdownMenuFormFieldState<T>();
}

class _DropdownMenuFormFieldState<T> extends FormFieldState<T> {
  _DropdownMenuFormField<T> get _dropdownMenuFormField =>
      widget as _DropdownMenuFormField<T>;

  @override
  void didChange(T? value) {
    super.didChange(value);
    // _dropdownMenuFormField.onSelected!(value);
  }

  @override
  void didUpdateWidget(_DropdownMenuFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }

  @override
  void reset() {
    super.reset();
    _dropdownMenuFormField.onSelected!(value);
  }
}
