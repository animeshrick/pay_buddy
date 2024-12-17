import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/modules/auth/widgets/header_section.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/router/router_name.dart';
import 'package:pay_buddy/utils/pop_up_items.dart';
import 'package:pay_buddy/utils/screen_utils.dart';
import 'package:pay_buddy/utils/text_utils.dart';
import 'package:pay_buddy/utils/validator.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_text_formfield.dart';
import 'package:pay_buddy/widget/custom_ui.dart';
import 'package:toastification/toastification.dart';

import '../widgets/terms_and_condition.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  bool isChecked = true;

  @override
  void dispose() {
    // phoneNo.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex(ColorConst.white),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeaderSection(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomTextEnum(
                          "Hi!",
                          // "Welcome to `${TextUtils.appTitle}` – Your smart companion for managing expenses effortlessly! Let's help you track, plan, and save smarter. Ready to take control of your finances? Let's get started!",
                          color: HexColor.fromHex(ColorConst.baseHexColor),
                          lineGapNeeded: true,
                        ).textBoldLG(),
                      ),
                    ),Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomTextEnum(
                          "We want to know about you a little bit.",
                          // "Welcome to `${TextUtils.appTitle}` – Your smart companion for managing expenses effortlessly! Let's help you track, plan, and save smarter. Ready to take control of your finances? Let's get started!",
                          color: HexColor.fromHex(ColorConst.baseHexColor),
                          lineGapNeeded: true,
                        ).textSemiboldSM(),
                      ),
                    ),
                    34.ph,
                    Container(
                      // width: ScreenUtils.aw * 0.7,
                      // height: isChecked == false ? 235 : 160,
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: HexColor.fromHex(ColorConst.white)),
                          color:
                              HexColor.fromHex(ColorConst.lighter_baseHexColor),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: HexColor.fromHex(ColorConst.grey4),
                                blurRadius: 5.0,
                                offset: const Offset(0, 2),
                                spreadRadius: 1),
                          ]),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            controller: fullName,
                            hintText: TextUtils.enter_full_name,
                            label: TextUtils.enter_full_name,
                            keyboardType: TextInputType.text,
                            errorText: null,
                            validator: (value) {
                              if ((value) != null) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          8.ph,
                          CustomTextFormField(
                            controller: email,
                            hintText: TextUtils.enter_email,
                            label: TextUtils.enter_email,
                            keyboardType: TextInputType.emailAddress,
                            errorText: null,
                            validator: (value) {
                              if (Validator().phoneNumberValidator(value) !=
                                  null) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          8.ph,

                          CustomTextFormField(
                            controller: username,
                            hintText: TextUtils.enter_username,
                            label: TextUtils.enter_username,
                            keyboardType: TextInputType.text,
                            errorText: null,
                            validator: (value) {
                              if ((value) != null) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          8.ph,
                          CustomTextFormField(
                            controller: pass1,
                            hintText: TextUtils.enter_password,
                            label: TextUtils.enter_password,
                            keyboardType: TextInputType.text,
                            errorText: null,
                            validator: (value) {
                              if ((value) != null) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          8.ph,
                          CustomTextFormField(
                            controller: pass2,
                            hintText: TextUtils.enter_confirm_password,
                            label: TextUtils.enter_confirm_password,
                            keyboardType: TextInputType.text,
                            errorText: null,
                            validator: (value) {
                              if ((value) != null) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          // if (isChecked == false) ...[
                          //   CustomTextFormField(
                          //       controller: password,
                          //       hintText: TextUtils.enter_password,
                          //       label: TextUtils.enter_password,
                          //       keyboardType: TextInputType.text,
                          //       validator: (value) {
                          //         if (Validator()
                          //                 .textValidatorAlphanumericWithSpacialCharacters(
                          //                     value: value, msg: "") !=
                          //             null) {
                          //           return '';
                          //         }
                          //         return null;
                          //       }),
                          //   8.ph,
                          // ],
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     CustomTextEnum(TextUtils.continue_with_code,
                          //             color: HexColor.fromHex(
                          //                 ColorConst.primaryDark))
                          //         .textSM(),
                          //     CustomCheckbox(
                          //       activeColor:
                          //           HexColor.fromHex(ColorConst.baseHexColor),
                          //       value: isChecked,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           isChecked = value!;
                          //         });
                          //       },
                          //     ),
                          //   ],
                          // ),
                          // 8.ph,
                        ],
                      ),
                    ),
                    // CustomContainer(
                    //     margin: const EdgeInsets.symmetric(
                    //         horizontal: 16, vertical: 16),
                    //     child: Row(
                    //       children: [
                    //         const Expanded(child: Divider()),
                    //         16.pw,
                    //         CustomTextEnum("Or").textSM(),
                    //         16.pw,
                    //         const Expanded(child: Divider()),
                    //       ],
                    //     )),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: CustomContainer(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 16, vertical: 16),
                    //       margin: const EdgeInsets.symmetric(horizontal: 16),
                    //       color:
                    //           HexColor.fromHex(ColorConst.lighter_baseHexColor),
                    //       borderRadius: BorderRadius.circular(12),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: HexColor.fromHex(ColorConst.grey4),
                    //             blurRadius: 5.0,
                    //             offset: const Offset(0, 2),
                    //             spreadRadius: 1),
                    //       ],
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(LucideIcons.mail,
                    //               color:
                    //                   HexColor.fromHex(ColorConst.primaryDark)),
                    //           12.pw,
                    //           CustomTextEnum("Try with Gmail",
                    //                   color: HexColor.fromHex(
                    //                       ColorConst.primaryDark))
                    //               .textMediumSM(),
                    //         ],
                    //       )),
                    // ),
                    // 22.ph,
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: CustomContainer(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 16, vertical: 16),
                    //       margin: const EdgeInsets.symmetric(horizontal: 16),
                    //       color:
                    //           HexColor.fromHex(ColorConst.lighter_baseHexColor),
                    //       borderRadius: BorderRadius.circular(12),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: HexColor.fromHex(ColorConst.grey4),
                    //             blurRadius: 5.0,
                    //             offset: const Offset(0, 2),
                    //             spreadRadius: 1),
                    //       ],
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(LucideIcons.facebook,
                    //               color:
                    //                   HexColor.fromHex(ColorConst.primaryDark)),
                    //           12.pw,
                    //           CustomTextEnum("Try with Facebook")
                    //               .textMediumSM(),
                    //         ],
                    //       )),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TermsAndConditions(),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                // color: HexColor.fromHex(ColorConst.lighter_baseHexColor),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: HexColor.fromHex(ColorConst.grey4),
                      blurRadius: 2.0,
                      offset: const Offset(0, 2),
                      spreadRadius: 1),
                ]),
            child: CustomGOEButton(
                backGroundColor: HexColor.fromHex(ColorConst.baseHexColor),
                radius: 12,
                size: Size(ScreenUtils.aw, 48),
                child: CustomTextEnum(
                        isChecked == true
                            ? TextUtils.sendCode
                            : TextUtils.Continue,
                        color: HexColor.fromHex(ColorConst.white))
                    .textSM(),
                onPressed: () {
                  bool? validateForm = formKey.currentState?.validate();

                  if (validateForm == true) {
                    CustomRoute().goto(RouteName.verification);
                  } else if (isChecked == false) {
                    PopUpItems().toastfy(
                        message: TextUtils.agree_TC,
                        color: HexColor.fromHex(ColorConst.warning100),
                        durationSeconds: 4,
                        type: ToastificationType.warning);
                  } else {
                    PopUpItems().toastfy(
                        message: TextUtils.missing_important_fields,
                        color: HexColor.fromHex(ColorConst.warning100),
                        durationSeconds: 4,
                        type: ToastificationType.warning);
                  }
                }),
          )
        ],
      ),
    );
  }
}
