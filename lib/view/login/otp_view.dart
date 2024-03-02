import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:safar/common/color_extension.dart';
import 'package:safar/common_widget/round_button.dart';

class OTPView extends StatefulWidget {
  final String number;
  final String code;

  const OTPView({super.key, required this.number, required this.code});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
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
              "ওটিপি দিন",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "ছয় অক্ষরের কোড দিন",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${widget.code} ${widget.number}",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    "এডিট",
                    style: TextStyle(
                      color: TColor.secondary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: TColor.placeholder,
              focusedBorderColor: TColor.primary,
              textStyle: TextStyle(
                color: TColor.primaryText,
                fontSize: 16,
              ),
              showFieldAsBox: false,
              borderWidth: 1.0,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                // otpCode = code;
                //handle validation or checks here if necessary
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                // otpCode = verificationCode;
                // smsVerification();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              onPressed: () {},
              title: "সাবমিট",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpTimerButton(
                  height: 60,
                  onPressed: () {
                    // onSendSms();
                  },
                  text: const Text(
                    'পুনরায় প্রদান',
                    style: TextStyle(fontSize: 16),
                  ),
                  buttonType: ButtonType.text_button,
                  backgroundColor: TColor.primaryText,
                  duration: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
