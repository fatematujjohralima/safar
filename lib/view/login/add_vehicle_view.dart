import 'package:flutter/material.dart';
import 'package:safar/common/color_extension.dart';
import 'package:safar/common/line_text_field.dart';
import 'package:safar/common_widget/round_button.dart';
import 'package:safar/view/login/vehicle_document_view.dart';

class AddVehicleView extends StatefulWidget {
  const AddVehicleView({super.key});

  @override
  State<AddVehicleView> createState() => _AddVehicleViewState();
}

class _AddVehicleViewState extends State<AddVehicleView> {
  TextEditingController txtServiceType = TextEditingController();
  TextEditingController txtBrandName = TextEditingController();
  TextEditingController txtModelName = TextEditingController();
  TextEditingController txtManufacturer = TextEditingController();
  TextEditingController txtNumberPlate = TextEditingController();
  TextEditingController txtColor = TextEditingController();

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
          "আপনার রিকশা যোগ করুন",
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
                  title: "পরিষেবার ধরন",
                  hintText: "পায়ে চালিত রিকশা/ ইঞ্জিন চালিত রিকশা",
                  controller: txtServiceType,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                  title: "Brand (Auto Suggestion)",
                  hintText: "BMW",
                  controller: txtBrandName,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                  title: "Model (Auto Suggestion)",
                  hintText: "ABC",
                  controller: txtModelName,
                ),
                const SizedBox(
                  height: 8,
                ),
                LineTextField(
                  title: "Manufacturer (Auto Suggestion)",
                  hintText: "BMW",
                  controller: txtManufacturer,
                ),
                const SizedBox(
                  height: 15,
                ),
                LineTextField(
                  title: "নাম্বার প্লেট",
                  hintText: "খুলনা-ট২৫৮",
                  controller: txtNumberPlate,
                ),
                const SizedBox(
                  height: 15,
                ),
                LineTextField(
                  title: "কালার",
                  hintText: "লাল/নীল/সবুজ",
                  controller: txtColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundButton(
                  onPressed: () {
                    context.push(const VehicleDocumentUploadView());
                    //(
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
