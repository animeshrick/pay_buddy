import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/data/bloc_data_model/dynamic_data.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/service/value_handler.dart';
import 'package:pay_buddy/utils/screen_utils.dart';
import 'package:pay_buddy/utils/text_utils.dart';
import 'package:pay_buddy/utils/validator.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../const/color_const.dart';
import '../../../extension/hex_color.dart';
import '../../../widget/custom_text.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/header_section.dart';

class VerificationView extends StatefulWidget {
  final String email;

  const VerificationView({super.key, required this.email});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  Widget build(_) {
    TextEditingController otp = TextEditingController();
    StreamController<ErrorAnimationType>? errorController;

    bool hasError = false;
    String currentText = "";
    final formKey = GlobalKey<FormState>();

    @override
    void initState() {
      errorController = StreamController<ErrorAnimationType>();
      super.initState();
    }

    @override
    void dispose() {
      errorController!.close();

      super.dispose();
    }

    final myBloc = AuthBloc();

    return BlocProvider.value(
      value: myBloc,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: HexColor.fromHex(ColorConst.white),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      HeaderSection(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButton(
                                icon: Icon(
                                  LucideIcons.undo,
                                  size: 26,
                                  color:
                                      HexColor.fromHex(ColorConst.baseHexColor),
                                ),
                                onPressed: () {
                                  CustomRoute().back();
                                }),
                            Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.passthrough,
                              children: [
                                Container(
                                  width: ScreenUtils.aw * 0.6,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color:
                                        HexColor.fromHex(ColorConst.baseHexColor),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: HexColor.fromHex(ColorConst.grey4),
                                        blurRadius: 2.0,
                                        offset: const Offset(0, 2),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 4),
                                    child: CustomTextEnum(
                                      TextUtils.verification_code_des.replaceAll(
                                          "##",
                                          ValueHandler()
                                                  .stringify(widget.email) ??
                                              ""),
                                      color: HexColor.fromHex(ColorConst.white),
                                    ).textSM(),
                                  ),
                                ),
                                Positioned(
                                  // top: 30,
                                  left: -20,
                                  child: CircleAvatar(
                                    backgroundColor:
                                        HexColor.fromHex(ColorConst.light_green),
                                    radius: 20,
                                    child: Icon(LucideIcons.check,
                                        color:
                                            HexColor.fromHex(ColorConst.white)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      24.ph,
                      CustomTextEnum(
                        TextUtils.fill_code,
                        color: HexColor.fromHex(ColorConst.baseHexColor),
                      ).textXL(),
                      16.ph,
                      Form(
                        key: formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: PinCodeTextField(
                            appContext: context,
                            autoFocus: true,

                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 6,
                            // obscureText: true,
                            // obscuringCharacter: '*',
                            // obscuringWidget: const FlutterLogo(
                            //   size: 24,
                            // ),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              return Validator().otpValidator(v);
                            },
                            pinTheme: PinTheme(
                              inactiveColor: HexColor.fromHex(
                                  ColorConst.lighter_baseHexColor),
                              inactiveFillColor: HexColor.fromHex(
                                  ColorConst.lighter_baseHexColor),
                              activeColor: HexColor.fromHex(
                                  ColorConst.baseHexColor_shade_2),
                              selectedColor: HexColor.fromHex(ColorConst.white),
                              selectedFillColor: HexColor.fromHex(
                                  ColorConst.baseHexColor_shade_2),
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 50,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: otp,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              debugPrint("Completed");
                            },
                            onChanged: (value) {
                              debugPrint(value);
                              // setState(() {
                              //   currentText = value;
                              // });
                            },
                            beforeTextPaste: (text) {
                              debugPrint("Allowing to paste $text");
                              return true;
                            },
                          ),
                        ),
                      ),
                      12.ph,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextEnum(
                              TextUtils.code_not_received,
                              color: HexColor.fromHex(ColorConst.baseHexColor),
                            ).textMD(),
                            CustomGOEButton(
                                backGroundColor:
                                    HexColor.fromHex(ColorConst.baseHexColor),
                                radius: 12,
                                size: Size(100, 48),
                                child: CustomTextEnum(TextUtils.resend,
                                        color: HexColor.fromHex(ColorConst.white))
                                    .textSM(),
                                onPressed: () {
                                  // CustomRoute().goto(RouteName.verification);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      // color: HexColor.fromHex(ColorConst.lighter_baseHexColor),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: HexColor.fromHex(ColorConst.grey4),
                            blurRadius: 2.0,
                            offset: Offset(0, 2),
                            spreadRadius: 1),
                      ]),
                  child: CustomGOEButton(
                      backGroundColor: HexColor.fromHex(ColorConst.baseHexColor),
                      radius: 12,
                      size: Size(ScreenUtils.aw, 48),
                      onPressed: state.verifyOTPResponse.status == Status.loading
                          ? null
                          : () {
                        bool? validateForm = formKey.currentState?.validate();
                        if (validateForm == true) {
                          Map<String, String> data = {
                            "email": widget.email,
                            "otp": otp.text
                          };
                          context.read<AuthBloc>().add(VerifyOTP(request: data));
                        }
                      },
                      child: state.verifyOTPResponse.status==Status.loading?CircularProgressIndicator() :CustomTextEnum(
                        TextUtils.verify,
                        color: HexColor.fromHex(ColorConst.white),
                      ).textSM()),
                )
              ],
            ),
          );
        },
      ),
);
  }
}
