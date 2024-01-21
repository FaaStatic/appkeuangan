import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:paymentapp/component/line_dotted.dart';
import 'package:paymentapp/model/money_enum.dart';
import 'package:sizer/sizer.dart';

class ItemDetailOutlet extends StatelessWidget {
  final MoneyEnum type;
  final double countMoney;
  const ItemDetailOutlet(
      {super.key, required this.type, required this.countMoney});

  Widget statusMoney() {
    switch (type) {
      case MoneyEnum.idr:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icon/ic_idr.svg", width: 20, height: 14),
            const Gap(14),
            const Text(
              'IDR',
              style: TextStyle(
                color: Color(0xFF6E6E6E),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        );
      case MoneyEnum.sgd:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icon/ic_sgd.svg", width: 20, height: 14),
            const Gap(14),
            const Text(
              'SGD',
              style: TextStyle(
                color: Color(0xFF6E6E6E),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        );
      case MoneyEnum.eur:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icon/ic_euro.svg", width: 20, height: 14),
            const Gap(14),
            const Text(
              'EUR',
              style: TextStyle(
                color: Color(0xFF6E6E6E),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        );
      case MoneyEnum.usd:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icon/ic_dollar.svg",
                width: 20, height: 14),
            const Gap(14),
            const Text(
              'USD',
              style: TextStyle(
                color: Color(0xFF6E6E6E),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        );

      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icon/ic_idr.svg", width: 20, height: 14),
            const Gap(14),
            const Text(
              'IDR',
              style: TextStyle(
                color: Color(0xFF6E6E6E),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            )
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: statusMoney()),
          const Gap(14),
          Expanded(
            child: CustomPaint(
              painter: LineDotted(),
            ),
          ),
          const Gap(30),
          Flexible(
              child: Text(
            countMoney.toString(),
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xFF2787BD),
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ))
        ],
      ),
    );
  }
}
