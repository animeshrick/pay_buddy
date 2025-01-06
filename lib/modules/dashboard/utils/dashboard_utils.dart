import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/modules/account/view/account_view.dart';

import '../../friend/view/friends_view.dart';
import '../../group/view/group_view.dart';

class DashboardUtils {
  DashboardUtils._privateConstructor();

  static final DashboardUtils instance = DashboardUtils._privateConstructor();

  int currentPageIndex = 0;

  List<Widget> botton_nav_options = [
    const NavigationDestination(
      selectedIcon: Icon(LucideIcons.users,color: Colors.white),
      icon: Icon(LucideIcons.users),
      label: 'Groups',
    ),
    const NavigationDestination(
      selectedIcon: Icon(LucideIcons.handshake,color: Colors.white),
      icon: Icon(LucideIcons.handshake),
      label: 'Friends',
    ),
    const NavigationDestination(
      selectedIcon: Icon(LucideIcons.circleUser,color: Colors.white),
      icon: Icon(LucideIcons.circleUser),
      label: 'Account',
    ),
  ];
  List<Widget> pages = [GroupView(), FriendsView(), const AccountView()];
}
