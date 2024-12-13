import 'package:flutter/material.dart';
import 'package:pay_buddy/extension/sizing.dart';
import 'package:pay_buddy/extension/spacing.dart';

import '../const/color_const.dart';
import '../extension/color_exe.dart';
import '../extension/hex_color.dart';
import 'custom_image.dart';
import 'custom_text.dart';

@Deprecated('Use [CustomGOEButton]')
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.gradient,
      this.color,
      this.radius,
      this.minimumSize = const Size(88, 36),
      this.padding});

  final void Function()? onPressed;
  final Widget child;
  final Gradient? gradient;
  final Color? color;
  final double? radius;
  final Size? minimumSize;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return gradient != null
        ? DecoratedBox(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 16)),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: minimumSize,
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius ?? 16)),
                ),
              ),
              onPressed: onPressed,
              child: child,
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              surfaceTintColor: Colors.transparent,
              minimumSize: minimumSize,
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
              shape: radius != null
                  ? RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius!),
                    )
                  : null,
            ),
            onPressed: onPressed,
            child: child,
          );
  }
}

@Deprecated('Use [CustomGOEButton]')
class CustomOutLineButton extends StatelessWidget {
  const CustomOutLineButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.borderColor,
      this.backGroundColor,
      this.radius,
      this.minimumSize = const Size(88, 36),
      this.padding});

  final void Function()? onPressed;
  final Widget child;
  final Color? borderColor;
  final Color? backGroundColor;
  final double? radius;
  final Size? minimumSize;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          minimumSize: minimumSize,
          shape: radius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius!),
                )
              : null,
          side: borderColor != null ? BorderSide(color: borderColor!) : null,
          backgroundColor: backGroundColor),
      onPressed: onPressed,
      child: child,
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.color,
      this.padding});

  final Widget child;
  final void Function()? onPressed;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: color,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 4.0),
        ),
        onPressed: onPressed,
        child: child);
  }
}

///The CustomIconButton is a versatile and customizable icon button widget in Flutter. Here’s a brief explanation of its variables:
/// [icon]
/// The icon to display inside the button. Allows the caller to pass a custom icon.
/// [color]The color of the icon. Enables the customization of the icon's color.
/// [backgroundColor]
/// The background color of the button. Allows the button to have a custom background color.
/// [iconSize]
/// The size of the icon. Lets the caller specify the size of the icon.
/// [onPressed]
/// The callback function that is triggered when the button is pressed. Ensures that the button has the necessary functionality.
/// [padding]
/// The padding around the icon inside the button. Allows for custom padding to be applied.
class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.icon,
      this.color,
      this.splashColor,
      this.highlightColor,
      this.backgroundColor,
      this.iconSize,
      required this.onPressed,
      this.padding});

  final Widget icon;
  final Color? color, backgroundColor, highlightColor, splashColor;
  final double? iconSize;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        splashColor: splashColor,
        // No splash color
        highlightColor: highlightColor,
        // No highlight color
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: backgroundColor,
          ),
          padding: padding ?? const EdgeInsets.all(4.0),
          child: IconTheme.merge(
            data: IconThemeData(
              size: iconSize,
              color: color,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}

/// Gradient Outline Evaluator Button ([CustomGOEButton] Button)
///
/// The [CustomGOEButton] Button combines modern design with functional interactivity. Key features include:
/// Gradient: Smooth color transitions for a dynamic look.
/// Outline: Sharp, defined borders for enhanced visibility.
/// Evaluator: Built-in functionality for actions, calculations, or validations.
/// Perfect for web pages, mobile apps, or software interfaces, the GOE Button elevates user experience with its stylish and practical design.
/// [onPressed]
/// Callback function triggered when the button is pressed.
/// [child]
/// Content of the button, typically a Text or Icon widget.
/// [borderColor]
/// Specifies the color of the button's border (optional).
/// [backGroundColor]
/// Sets the background color of the button (optional, overridden by gradient if provided).
/// [radius]
/// Defines the corner radius of the button (defaults to 16 if not specified).
/// [size]
/// Sets the minimum width and height of the button (defaults to Size(88, 36)).
/// [gradient]
/// Applies a gradient background to the button (optional, overrides backGroundColor).
/// [padding]
/// Specifies the internal padding of the button's content (defaults to EdgeInsets.symmetric(horizontal: 16)).
class CustomGOEButton extends StatelessWidget {
  const CustomGOEButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.borderColor,
      this.backGroundColor,
      this.radius,
      this.size = const Size(88, 36),
      this.gradient,
      this.padding});

  final void Function()? onPressed;
  final Widget child;
  final Color? borderColor;
  final Color? backGroundColor;
  final double? radius;
  final Size? size;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // Determine the effective background color and gradient when disabled
    final Color? effectiveBackgroundColor =
        onPressed == null && (backGroundColor != null || gradient != null)
            ? HexColor.fromHex(ColorConst.grey4) // Disabled background color
            : backGroundColor;
    final Gradient? effectiveGradient = onPressed == null ? null : gradient;

    final Color? effectiveBorderColor = onPressed == null && borderColor != null
        ? Colors.grey.shade400 // Disabled border color
        : borderColor;

    // Determine splash, highlight, and hover colors based on background or gradient
    Color? sHlHColor = effectiveGradient != null
        ? ColorExe.mixColors(effectiveGradient.colors)?.withOpacity(0.3)
        : effectiveBackgroundColor ?? effectiveBorderColor?.withOpacity(0.075);

    final Color? splashColor =
        sHlHColor != null ? ColorExe.darken(sHlHColor, 0.05) : null;
    final Color? highlightColor =
        sHlHColor != null ? ColorExe.darken(sHlHColor, 0.0125) : null;
    final Color? hoverColor =
        sHlHColor != null ? ColorExe.darken(sHlHColor, 0.025) : null;

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: effectiveGradient,
          borderRadius: BorderRadius.circular(radius ?? 16),
          color: effectiveGradient == null ? effectiveBackgroundColor : null,
          border: effectiveBorderColor != null
              ? Border.all(
                  color: effectiveBorderColor,
                )
              : null,
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
          onTap: onPressed,
          // Disable onTap if disabled
          splashColor: splashColor,
          highlightColor: highlightColor,
          hoverColor: hoverColor,
          child: Container(
            height: size?.height,
            width: size?.width,
            alignment: Alignment.center,
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.value,
    this.isRounded,
    this.activeColor,
    required this.onChanged,
  });

  final bool? value, isRounded;
  final void Function(bool?)? onChanged;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      activeColor: activeColor ?? HexColor.fromHex(ColorConst.baseHexColor),
      side: BorderSide(
          color:
              HexColor.fromHex(ColorConst.baseHexColor),
          width: 2),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: value,
      shape: isRounded == true
          ? const CircleBorder()
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onChanged: onChanged,
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: value ? activeColor : Colors.grey, width: 1),
          color: Colors.transparent, // Keep transparent when not selected
        ),
        child: value
            ? Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeColor, // Inner dot color
                  ),
                ),
              )
            : null, // Show nothing when not selected
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final String title;
  final String assetName;
  final void Function() onTap;
  final bool isSelected;

  const GenderButton({
    super.key,
    required this.title,
    required this.assetName,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          isSelected
              ? CustomTextEnum(
                  title,
                  color: HexColor.fromHex(ColorConst.brand600),
                ).textSemiboldSM()
              : CustomTextEnum(
                  title,
                  color: HexColor.fromHex(ColorConst.brand800),
                ).textSM(),
          4.ph,
          CustomAssetImageView(
            height: 32.fs,
            color: isSelected
                ? HexColor.fromHex(ColorConst.brand600)
                : HexColor.fromHex(ColorConst.gray400),
            path: assetName,
          ),
        ],
      ),
    );
  }
}
