import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paymentapp/component/appbar_custom.dart';
import 'package:paymentapp/component/top_navigation.dart';
import 'package:paymentapp/util/state/page_state.dart';
import 'package:paymentapp/view/menu/menu_first_screen.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  final PageController _control = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        appbarSize: Size(100.w, 160),
        title: "App Keuangan",
        usingBack: false,
        actionWidget: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/icon/ic_notif.svg",
                  width: 35,
                  height: 35,
                  color: Theme.of(context).colorScheme.primary,
                )),
          )
        ],
        bottomWidget: PreferredSize(
            preferredSize: Size(100.w, 200 - kToolbarHeight),
            child: const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: TopNavigation(),
            )),
      ),
      body: PageView(
        controller: _control,
        onPageChanged: (value) {
          ref.read(providerChangePage.notifier).changeState(value + 1);
        },
        children: const [
          MenuFirstScreen(),
        ],
      ),
    );
  }
}
