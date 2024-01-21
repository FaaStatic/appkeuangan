import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paymentapp/component/custom_shape.dart';
import 'package:paymentapp/component/list_item_outlet.dart';
import 'package:sizer/sizer.dart';

final dataCek = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class MenuFirstScreen extends ConsumerStatefulWidget {
  const MenuFirstScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MenuFirstScreenState();
}

class _MenuFirstScreenState extends ConsumerState<MenuFirstScreen>
    with TickerProviderStateMixin {
  late AnimationController _controler;
  late Animation<double> rotateRef;
  ScrollController _control = ScrollController();
  @override
  void initState() {
    _controler = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    rotateRef = Tween<double>(begin: 0, end: -15)
        .animate(CurvedAnimation(parent: _controler, curve: Curves.ease));
    super.initState();
  }

  @override
  void dispose() {
    _control.dispose();
    _controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          Positioned.fill(
              child: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 100.h,
              width: 100.w,
              padding: const EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                    0.1,
                    0.5,
                    1,
                  ],
                      colors: [
                    HexColor("#2787BD"),
                    HexColor("#2787BD"),
                    HexColor("#2787BD"),
                  ])),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  controller: _control,
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dataCek.length,
                          itemBuilder: (context, index) =>
                              const ListItemOutlet())
                    ],
                  ),
                ),
              ),
            ),
          )),
          Positioned(
              top: 0,
              left: 45.w,
              child: SizedBox(
                width: 17.w,
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                        animation: _controler,
                        builder: (context, _) {
                          return GestureDetector(
                            onTap: () {
                              _controler.forward();
                            },
                            child: AnimatedRotation(
                              turns: rotateRef.value,
                              duration: const Duration(milliseconds: 5000),
                              child: SvgPicture.asset(
                                "assets/icon/ic_refresh.svg",
                                width: 23,
                                height: 23,
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
