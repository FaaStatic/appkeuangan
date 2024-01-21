import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Size appbarSize;
  final PreferredSize? bottomWidget;
  final List<Widget>? actionWidget;
  final String title;
  final bool usingBack;
  const AppbarCustom(
      {super.key,
      required this.appbarSize,
      required this.title,
      required this.usingBack,
      this.bottomWidget,
      this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: usingBack,
      leading: usingBack
          ? SizedBox(
              width: 16,
              height: 16,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.chevron_left,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      actions: actionWidget,
      bottom: bottomWidget,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => appbarSize;
}
