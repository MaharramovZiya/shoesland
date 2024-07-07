import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.onInitializationComplete});

  final VoidCallback onInitializationComplete;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4))
        .then((_) => widget.onInitializationComplete());
  }

  @override
  Widget build(BuildContext context) {
    final customSize = CustomSize(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: LocalStrings().splashTxt,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: Center(
          child: Container(
            width: customSize.width,
            height: customSize.height,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 4),
                ),
              ],
              image: const DecorationImage(
                  image: AssetImage(LocalImages.splash),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
            child: Center(
              child: GeneralTextWidget(LocalStrings().splashTxt,
                  textStyle: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colours.white)),
            ),
          ),
        ),
      ),
    );
  }
}
