import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/data/bloc_data_model/dynamic_data.dart';
import 'package:pay_buddy/extension/hex_color.dart';
import 'package:pay_buddy/extension/spacing.dart';
import 'package:pay_buddy/modules/auth/widgets/header_section.dart';
import 'package:pay_buddy/service/value_handler.dart';
import 'package:pay_buddy/utils/pop_up_items.dart';
import 'package:pay_buddy/utils/screen_utils.dart';
import 'package:pay_buddy/utils/text_utils.dart';
import 'package:pay_buddy/utils/validator.dart';
import 'package:pay_buddy/widget/custom_button.dart';
import 'package:pay_buddy/widget/custom_text.dart';
import 'package:pay_buddy/widget/custom_text_formfield.dart';
import 'package:toastification/toastification.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/terms_and_condition.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController username = TextEditingController(text: "animeshapp");
  TextEditingController email = TextEditingController(text: "abc@gmail.com");
  TextEditingController fullName =
      TextEditingController(text: "Animesh Flutter");
  TextEditingController password = TextEditingController(text: "123456");


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: CustomTextEnum(
                                "Hi!",
                                // "Welcome to `${TextUtils.appTitle}` – Your smart companion for managing expenses effortlessly! Let's help you track, plan, and save smarter. Ready to take control of your finances? Let's get started!",
                                color:
                                    HexColor.fromHex(ColorConst.baseHexColor),
                                lineGapNeeded: true,
                              ).textBoldLG(),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: CustomTextEnum(
                                "We want to know about you a little bit.",
                                // "Welcome to `${TextUtils.appTitle}` – Your smart companion for managing expenses effortlessly! Let's help you track, plan, and save smarter. Ready to take control of your finances? Let's get started!",
                                color:
                                    HexColor.fromHex(ColorConst.baseHexColor),
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
                                color: HexColor.fromHex(
                                    ColorConst.lighter_baseHexColor),
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
                                    if (!ValueHandler()
                                        .isTextNotEmptyOrNull(value)) {
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
                                    if (Validator().emailValidator(value) !=
                                        null) {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                                8.ph,
                                CustomTextFormField(
                                  controller: password,
                                  hintText: TextUtils.enter_password,
                                  label: TextUtils.enter_password,
                                  keyboardType: TextInputType.text,
                                  errorText: null,
                                  validator: (value) {
                                    if (!ValueHandler()
                                        .isTextNotEmptyOrNull(value)) {
                                      return '';
                                    }
                                    return null;
                                  },
                                ),
                                8.ph,
                              ],
                            ),
                          ),
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: HexColor.fromHex(ColorConst.grey4),
                            blurRadius: 2.0,
                            offset: const Offset(0, 2),
                            spreadRadius: 1),
                      ]),
                  child: CustomGOEButton(
                      backGroundColor:
                          HexColor.fromHex(ColorConst.baseHexColor),
                      radius: 12,
                      size: Size(ScreenUtils.aw, 48),
                      onPressed: state.authResponse.status == Status.loading
                          ? null
                          : () {
                              bool? validateForm =
                                  formKey.currentState?.validate();

                              if (validateForm == true &&
                                  state.isCheckedTC.value == true) {
                                Map<String, dynamic> data = {
                                  "email": email.text.trim(),
                                  "fname": fullName.text.split(" ").first,
                                  "lname": fullName.text.split(" ").last,
                                  "password": password.text,
                                };
                                context
                                    .read<AuthBloc>()
                                    .add(Register(user: data));
                              } else if (state.isCheckedTC.value == false) {
                                PopUpItems().toastfy(
                                    message: TextUtils.agree_TC,
                                    color:
                                        HexColor.fromHex(ColorConst.warning100),
                                    durationSeconds: 4,
                                    type: ToastificationType.warning);
                              } else {
                                PopUpItems().toastfy(
                                    message: TextUtils.missing_important_fields,
                                    color:
                                        HexColor.fromHex(ColorConst.warning100),
                                    durationSeconds: 4,
                                    type: ToastificationType.warning);
                              }
                            },
                      child: state.authResponse.status == Status.loading
                          ? CircularProgressIndicator()
                          : CustomTextEnum(TextUtils.Continue,
                                  color: HexColor.fromHex(ColorConst.white))
                              .textSM()),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
