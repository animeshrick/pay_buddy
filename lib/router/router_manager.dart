import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pay_buddy/modules/auth/ui/verification_view.dart';
import 'package:pay_buddy/modules/dashboard/ui/dashboard_view.dart';
import 'package:pay_buddy/modules/group/modules/add_new_group/add_new_group.dart';
import 'package:pay_buddy/modules/group/modules/group_settings/view/group_settings_view.dart';
import 'package:pay_buddy/modules/search/modules/friends_search/view/friends_search_view.dart';
import 'package:pay_buddy/modules/search/modules/group_search/view/group_search_view.dart';

import '../const/color_const.dart';
import '../extension/hex_color.dart';
import '../modules/auth/ui/auth.dart';
import '../modules/splash/splash.dart';
import '../utils/text_utils.dart';
import '../widget/custom_text.dart';
import '../widget/error_widget.dart';
import 'custom_router/custom_route.dart';
import 'router_name.dart';

class RouterManager {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final RouterManager _singleton = RouterManager._internal();

  RouterManager._internal();

  //This is what's used to retrieve the instance through the app
  static RouterManager getInstance = _singleton;

  GoRouter get router => _router;
  final GoRouter _router = GoRouter(
    redirectLimit: 30,
    routes: <RouteBase>[
      GoRoute(
        name: RouteName.initialView,
        path: RouteName.initialView,
        builder: (BuildContext context, GoRouterState state) {
          return Splash();
        },
      ),
      GoRoute(
        name: RouteName.auth,
        path: RouteName.auth,
        builder: (BuildContext context, GoRouterState state) {
          return Auth();
        },
      ),
      GoRoute(
        name: RouteName.verification,
        path: "${RouteName.verification}/:email",
        builder: (BuildContext context, GoRouterState state) {
          if (state.pathParameters["email"]?.isNotEmpty == true) {
            return VerificationView(email: state.pathParameters["email"] ?? "",);
          }
          return errorRoute();
        },
      ),
      GoRoute(
        name: RouteName.dashboardView,
        path: RouteName.dashboardView,
        builder: (BuildContext context, GoRouterState state) {
          return DashboardView();
          // return DashboardView();
        },
      ),
      GoRoute(
        name: RouteName.groupSettings,
        path: RouteName.groupSettings,
        builder: (BuildContext context, GoRouterState state) {
          return GroupSettingsView();
        },
      ),
      GoRoute(
        name: RouteName.friends_search,
        path: RouteName.friends_search,
        builder: (BuildContext context, GoRouterState state) {
          return FriendsSearchView();
        },
      ),
      GoRoute(
        name: RouteName.group_search,
        path: RouteName.group_search,
        builder: (BuildContext context, GoRouterState state) {
          return GroupSearchView();
        },
      ),
      GoRoute(
        name: RouteName.addNewGroup,
        path: RouteName.addNewGroup,
        builder: (BuildContext context, GoRouterState state) {
          return AddNewGroup();
        },
      ),
      // GoRoute(
      //   name: RouteName.bookingReschedule,
      //   path: "${RouteName.bookingReschedule}/:booking_no",
      //   builder: (BuildContext context, GoRouterState state) {
      //     if (state.pathParameters["booking_no"]?.isNotEmpty == true) {
      //       return BookingReschedule(
      //         bookingNo: state.pathParameters["booking_no"] ?? "",
      //       );
      //     }
      //     return errorRoute();
      //   },
      // ),
      // GoRoute(
      //   name: RouteName.consultationSuccess,
      //   path: RouteName.consultationSuccess,
      //   builder: (BuildContext context, GoRouterState state) {
      //     if (state.extra != null && state.extra is FreeFollowUpResponse) {
      //       return FreeFollowUpSuccess(
      //         freeFollowUpResponse: state.extra as FreeFollowUpResponse,
      //       );
      //     } else {
      //       return FreeFollowUpSuccess();
      //     }
      //   },
      // ),
      // GoRoute(
      //   name: RouteName.consultationPatientInfo,
      //   path: "${RouteName.consultationPatientInfo}/:booking_id/:patient_id",
      //   builder: (BuildContext context, GoRouterState state) {
      //     Map<String, String> queryParameters = state.uri.queryParameters;
      //     if (state.pathParameters["booking_id"]?.isNotEmpty == true &&
      //         state.pathParameters["patient_id"]?.isNotEmpty == true) {
      //       return ConsultationPatientInfo(
      //         bookingId: state.pathParameters["booking_id"] ?? "",
      //         patientId: state.pathParameters["patient_id"] ?? "",
      //         isPayment: queryParameters["isPayment"] == "true",
      //       );
      //     } else {
      //       return errorRoute();
      //     }
      //   },
      // ),
    ],
  );

  static Scaffold errorRoute() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: getInstance.router.canPop()
            ? IconButton(
                color: HexColor.fromHex(ColorConst.primaryDark),
                iconSize: 30,
                onPressed: () {
                  CustomRoute().back();
                },
                icon: const Icon(Icons.clear))
            : Container(),
        title: CustomTextEnum(TextUtils.notFound,
                color: HexColor.fromHex(ColorConst.primaryDark))
            .textMD(),
      ),
      body: Center(
        child: CustomErrorWidget(),
      ),
    );
  }
}
