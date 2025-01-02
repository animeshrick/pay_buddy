import '../../../router/router_manager.dart';
import '../../../router/router_name.dart';

class LandingUtils {
  static void redirect(int index) {
    switch (index) {
      case 0:
        RouterManager.getInstance.router.goNamed(RouteName.initialView);
        break;
      case 1:
        RouterManager.getInstance.router.goNamed(RouteName.dashboardView);
        break;
      case 2:
        RouterManager.getInstance.router.goNamed(RouteName.settings);
        break;
    }
  }
}
