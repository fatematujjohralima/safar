import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safar/common/color_extension.dart';
import 'package:safar/view/home/home_view.dart';
import 'package:safar/view/login/change_language_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
    load();
  }

  void load() async {
    await Future.delayed(const Duration(seconds: 3));
    loadNextScreen();
  }

  void loadNextScreen() {
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const ChangeLanguageView()));
    context.push(const HomeView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: TColor.primary,
          ),
          Image.asset(
            "assets/img/app_logo.png",
            width: context.width * 0.5,
          )
        ],
      ),
    );
  }
}
