import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:safar/common/color_extension.dart';
import 'package:safar/common/line_text_field.dart';
import 'package:safar/common_widget/round_button.dart';
import 'package:safar/view/login/bank_detail_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtHomeAddress = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  late CountryCode countryCode;
  TextEditingController txtPassword = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "প্রোফাইল তৈরী করুন",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 30,
                ),
                LineTextField(
                  title: "প্রথম নাম",
                  hintText: "ফাতেমা",
                  controller: txtFirstName,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                  title: "শেষ নাম",
                  hintText: "লিমা",
                  controller: txtLastName,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "মোবাইল নাম্বার",
                  style: TextStyle(color: TColor.placeholder, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        final code = await countryCodePicker.showPicker(
                            context: context);
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
                            style: TextStyle(
                                color: TColor.primaryText, fontSize: 16),
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
                LineTextField(
                  title: "ঠিকানা",
                  hintText: "রোড, এলাকা, শহর",
                  controller: txtHomeAddress,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                    title: "পাসওয়ার্ড",
                    hintText: "******",
                    controller: txtPassword,
                    obscureText: true,
                    right: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/password_show.png",
                          width: 25,
                          height: 25,
                        ))),
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
                    context.push(const BankDetailView());
                    // context.push(OTPView(
                    //     number: txtMobile.text, code: countryCode.dialCode));
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
                  title: "রেজিস্ট্রেশন করুন",
                ),
              ],
            )),
      ),
    );
  }
}
