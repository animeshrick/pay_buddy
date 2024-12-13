import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pay_buddy/const/color_const.dart';
import 'package:pay_buddy/extension/hex_color.dart';

import '../../../widget/custom_button.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By proceeding, you agree to our ',
              style: TextStyle(color: HexColor.fromHex(ColorConst.primaryDark)),
              children: [
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyle(
                      color: HexColor.fromHex(ColorConst.baseHexColor),
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle Terms and Conditions click
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Terms and Conditions'),
                          content: const Text(
                              'Details about Terms and Conditions go here.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(
                      color: HexColor.fromHex(ColorConst.primaryDark)),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                      color: HexColor.fromHex(ColorConst.baseHexColor),
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle Privacy Policy click
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Privacy Policy'),
                          content: const Text(
                              'Details about Privacy Policy go here.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                      color: HexColor.fromHex(ColorConst.primaryDark)),
                ),
              ],
            ),
          ),
        ),
        Container(
          // decoration: BoxDecoration(
          //   // color:  HexColor.fromHex(ColorConst.baseHexColor),
          //   boxShadow: [
          //     BoxShadow(
          //       color:  HexColor.fromHex(ColorConst.lighter_baseHexColor), // Shadow color
          //       spreadRadius: 0.1, // Spread radius
          //       blurRadius: 0.4, // Blur radius
          //       offset: const Offset(0.1, 0.2), // Shadow position (x, y)
          //     ),
          //   ],
          //   borderRadius: BorderRadius.circular(0), // Match checkbox's corner radius
          // ),
          child: CustomCheckbox(
            activeColor: HexColor.fromHex(ColorConst.baseHexColor),

            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
