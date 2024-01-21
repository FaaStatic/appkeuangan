import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icon/ic_sign_dollar.svg",
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "App Keuangan",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          const Gap(18),
        ],
      ),
    );
  }
}
