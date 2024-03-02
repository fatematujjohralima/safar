import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:safar/common/color_extension.dart';
import 'package:safar/common_widget/round_button.dart';
import 'package:safar/view/login/otp_view.dart';
//import 'package:taxi_driver/view/login/otp_view.dart';

class MobileNumberView extends StatefulWidget {
  const MobileNumberView({super.key});

  @override
  State<MobileNumberView> createState() => _MobileNumberViewState();
}

class _MobileNumberViewState extends State<MobileNumberView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  TextEditingController txtMobile = TextEditingController();
  late CountryCode countryCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.name == "Bangladesh");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "মোবাইল নাম্বার দিন",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    final code =
                        await countryCodePicker.showPicker(context: context);
                    if (code != null) {
                      countryCode = code;
                      setState(() {});
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 20,
                        child: countryCode.flagImage(),
                      ),
                      Text(
                        "  ${countryCode.dialCode}",
                        style:
                            TextStyle(color: TColor.primaryText, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: txtMobile,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "9876543210",
                    ),
                  ),
                )
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "নিশ্চিত করুন",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "শর্তাবলী",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 11,
                  ),
                ),
                Text(
                  " এবং ",
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 11,
                  ),
                ),
                Text(
                  "গোপনীয়তা",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            RoundButton(
              onPressed: () {
                // context.push(OTPView(
                //     number: txtMobile.text, code: countryCode.dialCode));
                context.push(const OTPView(number: "9876543210", code: "+880"));
              },
              //   title: "Login AS Driver",
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // RoundButton(
              //   onPressed: () {
              //     context.push(OTPView(
              //       number: txtMobile.text,
              //       code: countryCode.dialCode,
              //       isDriver: false,
              //     ));
              // },
              title: "ব্যবহারকারী লগইন",
            )
          ],
        ),
      ),
    );
  }
}
