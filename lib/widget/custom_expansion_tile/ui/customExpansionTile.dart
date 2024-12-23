import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/custom_expansion_tile_bloc.dart';

///
/// [contentPadding] is padding for title ,
/// [childrenPadding] is padding for children ,
/// [tilePadding] is padding for tile
///
class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.activeTrailing,
    this.inActiveTrailing,
    this.children,
    this.isExpanded,
    this.contentPadding,
    this.childrenPadding,
    this.tilePadding,
    this.childrenCrossAxisAlignment = CrossAxisAlignment.center,
    this.onChange,
  });

  final Widget? leading, title, subtitle, activeTrailing, inActiveTrailing;
  final List<Widget>? children;
  final bool? isExpanded;
  final EdgeInsetsGeometry? contentPadding, childrenPadding, tilePadding;
  final CrossAxisAlignment childrenCrossAxisAlignment;
  final void Function(bool value)? onChange;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomExpansionTileBloc()..add(ChangeExpanded(expanded: isExpanded)),
      child: BlocBuilder<CustomExpansionTileBloc, CustomExpansionTileState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: tilePadding,
                child: ListTile(
                  leading: leading,
                  title: title,
                  subtitle: subtitle,
                  contentPadding: contentPadding,
                  trailing: state.isExpanded
                      ? activeTrailing ?? const Icon(Icons.expand_less)
                      : inActiveTrailing ?? const Icon(Icons.expand_more),
                  onTap: () {
                    context
                        .read<CustomExpansionTileBloc>()
                        .add(ChangeExpanded(expanded: !state.isExpanded));
                    if (onChange != null) {
                      onChange!(!state.isExpanded);
                    }
                  },
                ),
              ),
              if (state.isExpanded)
                Container(
                  padding: childrenPadding,
                  child: Column(
                    crossAxisAlignment: childrenCrossAxisAlignment,
                    children: children ?? [],
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
