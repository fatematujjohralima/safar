import 'package:flutter/material.dart';
import 'package:safar/common/color_extension.dart';
import 'package:safar/common/line_text_field.dart';
import 'package:safar/common_widget/round_button.dart';
import 'package:safar/view/login/document_upload_view.dart';

class BankDetailView extends StatefulWidget {
  const BankDetailView({super.key});

  @override
  State<BankDetailView> createState() => _BankDetailViewState();
}

class _BankDetailViewState extends State<BankDetailView> {
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtAccountHolderName = TextEditingController();
  TextEditingController txtAccountNumber = TextEditingController();
  TextEditingController txtSwiftCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
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
        centerTitle: true,
        title: Text(
          "ব্যাংক ডিটেইলস",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                LineTextField(
                  title: "ব্যাংকের নাম",
                  hintText: "একাউন্ট রয়েছে এমন যেকোনো ব্যাংক",
                  controller: txtBankName,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                  title: "গ্রাহকের নাম",
                  hintText: "লিমা",
                  controller: txtAccountHolderName,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                  title: "একাউন্ট নাম্বার",
                  hintText: "12345678945245",
                  controller: txtAccountNumber,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                  title: "Swift/IFIC Code",
                  hintText: "YT123C",
                  controller: txtSwiftCode,
                ),
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
                    context.push(
                      const DocumentUploadView(title: "ব্যক্তিগত তথ্য"),
                    );
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
                  title: "পরবর্তী",
                ),
              ],
            )),
      ),
    );
  }
}
