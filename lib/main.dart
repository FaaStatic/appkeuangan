import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paymentapp/util/route_manager.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: Root()));
}

final GlobalKey<ScaffoldMessengerState> stateMessage = GlobalKey();

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, type) => MaterialApp.router(
              routerConfig: RouteManager().routeManager,
              scaffoldMessengerKey: stateMessage,
              theme: ThemeData(
                  useMaterial3: true,
                  scaffoldBackgroundColor: Colors.white,
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: HexColor("#2787BD"),
                      primary: HexColor("#2787BD"))),
            ));
  }
}
