import 'package:flutter/material.dart';
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
import 'package:sms_autofill/sms_autofill.dart';
import 'package:toastification/toastification.dart';

import '../widgets/terms_and_condition.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController phoneNo = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isChecked = true;

  // late TextEditingController _otpController;
  // String? _phoneNumber;

  @override
  void initState() {
    super.initState();
    // _otpController = TextEditingController();
    _getPhoneNumberHints(); // Get phone number hints
  }

  // Get phone number hints using SmsAutoFill
  Future<void> _getPhoneNumberHints() async {
    try {
      String? phoneNumber = await SmsAutoFill().hint;
      setState(() {
        phoneNo.text = (phoneNumber ?? "").replaceAll("+91", "");
      });
    } catch (e) {
      print("Error fetching phone number hints: $e");
    }
  }

  // Autofill OTP when received
  Future<void> _startListeningForOTP() async {
    await SmsAutoFill().listenForCode; // Start listening for OTP code
  }

  @override
  void dispose() {
    phoneNo.dispose();
    super.dispose();
  }

  // String _code = "";
  // String _app_signature = "{{ app signature }}";
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _init();
  //   SmsAutoFill().getAppSignature.then((signature) {
  //     setState(() {
  //       _app_signature = signature;
  //       // appSignature = signature;
  //     });
  //   });
  // }
  //
  // // Async initialization method
  // Future<void> _init() async {
  //   await SmsAutoFill().listenForCode();
  //   _app_signature = await SmsAutoFill().getAppSignature;
  //   setState(() {});
  // }
  //
  // @override
  // void dispose() {
  //   SmsAutoFill().unregisterListener();
  //   super.dispose();
  // }

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
              child: Column(
                children: [
                  HeaderSection(),
                  Center(
                    child: CustomTextEnum(
                      TextUtils.your_phone_number,
                      color: HexColor.fromHex(ColorConst.baseHexColor),
                    ).textSemiboldXL(),
                  ),
                  34.ph,
                  Container(
                    // width: ScreenUtils.aw * 0.7,
                    height: isChecked == false ? 235 : 160,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: HexColor.fromHex(ColorConst.white)),
                        color:
                            HexColor.fromHex(ColorConst.lighter_baseHexColor),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: HexColor.fromHex(ColorConst.grey4),
                              blurRadius: 5.0,
                              offset: Offset(0, 2),
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
                          controller: phoneNo,
                          maxLength: 10,
                          hintText: "Enter Phone Number",
                          label: TextUtils.enter_phone_number,
                          keyboardType: TextInputType.phone,
                          errorText: null,
                          validator: (value) {
                            if (Validator().phoneNumberValidator(value) !=
                                null) {
                              return '';
                            }
                            return null;
                          },
                          prefix: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomTextEnum('+91',
                                        color: HexColor.fromHex(
                                            ColorConst.primaryDark))
                                    .textSM(),
                                CustomTextEnum(' | ',
                                        color: HexColor.fromHex(
                                            ColorConst.primaryDark))
                                    .textSM(),
                              ],
                            ),
                          ),
                        ),
                        4.ph,
                        if (isChecked == false) ...[
                          CustomTextFormField(
                              controller: password,
                              hintText: TextUtils.enter_password,
                              label: TextUtils.enter_password,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (Validator()
                                        .textValidatorAlphanumericWithSpacialCharacters(
                                            value: value, msg: "") !=
                                    null) {
                                  return '';
                                }
                                return null;
                              }),
                          8.ph,
                        ],
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextEnum(TextUtils.continue_with_code,
                                    color: HexColor.fromHex(
                                        ColorConst.primaryDark))
                                .textSM(),
                            CustomCheckbox(
                              activeColor:
                                  HexColor.fromHex(ColorConst.baseHexColor),
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        8.ph,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      offset: Offset(0, 2),
                      spreadRadius: 1),
                ]),
            child: CustomGOEButton(
                backGroundColor: HexColor.fromHex(ColorConst.baseHexColor),
                radius: 12,
                size: Size(ScreenUtils.aw, 48),
                child: CustomTextEnum(isChecked == true?TextUtils.sendCode: TextUtils.Continue,
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
