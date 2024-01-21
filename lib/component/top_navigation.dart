import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paymentapp/util/state/page_state.dart';
import 'package:sizer/sizer.dart';

final List<Map<String, dynamic>> imagePath = [
  {
    "index": 1,
    "path_on": "assets/icon/ic_home_on.svg",
    "path_off": "assets/icon/ic_home_off.svg",
    "title": "Home"
  },
  {
    "index": 2,
    "path_on": "assets/icon/ic_transaction_on.svg",
    "path_off": "assets/icon/ic_transaction_off.svg",
    "title": "Transaksi"
  },
  {
    "index": 3,
    "path_on": "assets/icon/ic_report_on.svg",
    "path_off": "assets/icon/ic_report_off.svg",
    "title": "Laporan"
  },
  {
    "index": 4,
    "path_on": "assets/icon/ic_setting_on.svg",
    "path_off": "assets/icon/ic_setting_off.svg",
    "title": "Tools"
  },
];

class TopNavigation extends ConsumerWidget {
  const TopNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var element in imagePath)
            GestureDetector(
              onTap: () {
                ref
                    .read(providerChangePage.notifier)
                    .changeState(element["index"] as int);
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    ref.watch(providerChangePage) == element["index"] as int
                        ? element["path_on"]
                        : element["path_off"],
                    width: 44,
                    height: 44,
                  ),
                  Text(
                    element["title"],
                    style: TextStyle(
                        fontSize: 10,
                        color: ref.read(providerChangePage) == element["index"]
                            ? Theme.of(context).colorScheme.primary
                            : HexColor("#C1DDED")),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
