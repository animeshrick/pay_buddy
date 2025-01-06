import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/modules/dashboard/utils/dashboard_utils.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/router/router_name.dart';
import 'package:pay_buddy/widget/custom_button.dart';

import '../bloc/dashboard_bloc.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                if (DashboardUtils.instance.currentPageIndex != 2) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CustomIconButton(
                        icon: Icon(
                          LucideIcons.search,
                          color: HexColor.fromHex(ColorConst.gray500),
                        ),
                        onPressed: () {
                          switch (DashboardUtils.instance.currentPageIndex) {
                            case 0:
                              CustomRoute().goto(RouteName.group_search);
                              break;
                            case 1:
                              CustomRoute().goto(RouteName.friends_search);
                              break;
                          }
                        }),
                  )
                ],
              ],
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                context
                    .read<DashboardBloc>()
                    .add(PageChangeEvent(index: index));
              },
              indicatorColor: HexColor.fromHex(ColorConst.baseHexColor_shade_2),
              selectedIndex: DashboardUtils.instance.currentPageIndex,
              destinations: DashboardUtils.instance.botton_nav_options,
            ),
            body: DashboardUtils.instance.pages
                .elementAt(DashboardUtils.instance.currentPageIndex),
          );
        },
      ),
    );
  }
}
