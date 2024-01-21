import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paymentapp/component/item_detail_outlet.dart';
import 'package:paymentapp/component/line_dotted.dart';
import 'package:paymentapp/component/menu_custom.dart';
import 'package:paymentapp/model/money_enum.dart';
import 'package:paymentapp/view/menu/menu_first_screen.dart';
import 'package:sizer/sizer.dart';

class ListItemOutlet extends StatefulWidget {
  const ListItemOutlet({super.key});

  @override
  State<ListItemOutlet> createState() => _ListItemOutletState();
}

class _ListItemOutletState extends State<ListItemOutlet>
    with TickerProviderStateMixin {
  late AnimationController _control;
  late Animation<double> postionItem;
  late Animation<double> opacityItem;
  bool openSlide = false;
  @override
  void initState() {
    _control = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    postionItem = Tween<double>(begin: -90.w, end: -20.w)
        .animate(CurvedAnimation(parent: _control, curve: Curves.bounceIn));
    super.initState();
    opacityItem = Tween<double>(begin: 0, end: 0.5)
        .animate(CurvedAnimation(parent: _control, curve: Curves.easeIn));
    super.initState();
  }

  @override
  void dispose() {
    _control.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> iconList = [
    {"title": "Masuk", "path_image": "assets/icon/ic_input.svg"},
    {"title": "Keluar", "path_image": "assets/icon/ic_output.svg"},
    {"title": "Pindah", "path_image": "assets/icon/ic_move.svg"},
    {"title": "Mutasi", "path_image": "assets/icon/ic_mutation.svg"},
    {"title": "Kurs", "path_image": "assets/icon/ic_kurs.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Container(
          height: 160,
          width: 100.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: AnimatedBuilder(
              animation: _control,
              builder: (context, child) => Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Nama Outlet',
                            style: TextStyle(
                              color: Color(0xFF2787BD),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Gap(8),
                          Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(left: 14),
                                  itemCount: dataCek.length,
                                  itemBuilder: (context, _) {
                                    return const ItemDetailOutlet(
                                        type: MoneyEnum.idr,
                                        countMoney: 400000);
                                  }))
                        ],
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: AnimatedOpacity(
                    opacity: opacityItem.value,
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      color: Colors.white,
                    ),
                  )),
                  AnimatedPositioned(
                      right: postionItem.value,
                      top: 0,
                      bottom: 0,
                      duration: const Duration(milliseconds: 1000),
                      child: ClipPath(
                        clipper: MenuCustom(),
                        child: Container(
                          color: HexColor("#C1DDED"),
                          width: 100.w,
                          height: double.infinity,
                          child: Stack(children: [
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 14,
                                child: SizedBox(
                                    height: double.infinity,
                                    width: 24,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () {
                                            if (openSlide) {
                                              setState(() {
                                                openSlide = false;
                                              });
                                              _control.reverse();
                                            } else {
                                              setState(() {
                                                openSlide = true;
                                              });
                                              _control.forward();
                                            }
                                          },
                                          child: Center(
                                            child: SvgPicture.asset(
                                              openSlide
                                                  ? "assets/icon/ic_btn_close.svg"
                                                  : "assets/icon/ic_btn_plus.svg",
                                              width: 18,
                                              height: 18,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                        )
                                      ],
                                    ))),
                            Positioned.fill(
                                left: 28,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  padding: EdgeInsets.only(
                                    left: 14,
                                    right: 20.w + 14,
                                    top: 14,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Flexible(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          for (var element in iconList)
                                            Flexible(
                                                child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: SvgPicture.asset(
                                                    element["path_image"],
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                                const Gap(4),
                                                Center(
                                                    child: Text(
                                                  element["title"],
                                                  style: const TextStyle(
                                                    color: Color(0xFF2787BD),
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w700,
                                                    height: 0,
                                                  ),
                                                ))
                                              ],
                                            ))
                                        ],
                                      )),
                                      const Gap(20),
                                      Expanded(
                                          child: Container(
                                              height: 100.h,
                                              padding: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                  color: Colors.white),
                                              child: SingleChildScrollView(
                                                child: SizedBox(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Flexible(
                                                        child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Flexible(
                                                            child: Text(
                                                          'Jumlah Barang',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF6E6E6E),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 0,
                                                          ),
                                                        )),
                                                        const Gap(14),
                                                        Expanded(
                                                          child: CustomPaint(
                                                            painter:
                                                                LineDotted(),
                                                          ),
                                                        ),
                                                        const Gap(35),
                                                        const Flexible(
                                                            child: Text(
                                                          '16',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF6E6E6E),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            height: 0,
                                                          ),
                                                        ))
                                                      ],
                                                    )),
                                                    const Gap(4),
                                                    Flexible(
                                                        child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Flexible(
                                                            child: Text(
                                                          'Total IDR',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        )),
                                                        const Gap(14),
                                                        Expanded(
                                                          child: CustomPaint(
                                                            painter:
                                                                LineDotted(),
                                                          ),
                                                        ),
                                                        const Gap(60),
                                                        const Flexible(
                                                            child: Text(
                                                          'Rp 100.000.000',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ))
                                                      ],
                                                    )),
                                                    const Gap(4),
                                                    Flexible(
                                                        child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Flexible(
                                                            child: Text(
                                                          'Total USD',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        )),
                                                        const Gap(14),
                                                        Expanded(
                                                          child: CustomPaint(
                                                            painter:
                                                                LineDotted(),
                                                          ),
                                                        ),
                                                        const Gap(60),
                                                        const Flexible(
                                                            child: Text(
                                                          '\$ 2.000',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ))
                                                      ],
                                                    )),
                                                    const Gap(4),
                                                    Flexible(
                                                        child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Flexible(
                                                            child: Text(
                                                          'Total EUR',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        )),
                                                        const Gap(14),
                                                        Expanded(
                                                          child: CustomPaint(
                                                            painter:
                                                                LineDotted(),
                                                          ),
                                                        ),
                                                        const Gap(60),
                                                        const Flexible(
                                                            child: Text(
                                                          '2000',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ))
                                                      ],
                                                    )),
                                                    const Gap(4),
                                                    Flexible(
                                                        child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const Flexible(
                                                            child: Text(
                                                          'Total SGD',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        )),
                                                        const Gap(14),
                                                        Expanded(
                                                          child: CustomPaint(
                                                            painter:
                                                                LineDotted(),
                                                          ),
                                                        ),
                                                        const Gap(60),
                                                        const Flexible(
                                                            child: Text(
                                                          'SGD 100000',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF2787BD),
                                                            fontSize: 8,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0,
                                                          ),
                                                        ))
                                                      ],
                                                    )),
                                                    const Gap(4),
                                                  ],
                                                )),
                                              )))
                                    ],
                                  ),
                                ))
                          ]),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
