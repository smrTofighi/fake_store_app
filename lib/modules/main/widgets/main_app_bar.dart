import 'package:fake_store_app/core/constant/colors.dart';
import 'package:fake_store_app/core/constant/dimens.dart';
import 'package:fake_store_app/gen/fonts.gen.dart';
import 'package:fake_store_app/modules/main/widgets/cart_badge.dart';
import 'package:fake_store_app/modules/main/widgets/icon_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:fake_store_app/core/utils/extension.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  PreferredSize build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.medium),
        width: AppDimens.sizeOfDevice(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [LightColors.primary300, LightColors.primary100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const IconAppBar(
                      icon: EvaIcons.menu,
                    ),
                    AppDimens.medium.width,
                    const IconAppBar(
                      icon: EvaIcons.search_outline,
                    )
                  ],
                ),
                const CartBadge()
              ],
            ),
            AppDimens.medium.height,
            const WelcomeUserName()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}



class WelcomeUserName extends StatelessWidget {
  const WelcomeUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.left,
            'Welcome,',
            style: TextStyle(fontSize: 24, fontFamily: FontFamily.poppins),
          ),
          Text(
            textAlign: TextAlign.left,
            'Mohammad',
            style: TextStyle(fontSize: 24, fontFamily: FontFamily.poppins),
          ),
        ],
      ),
    );
  }
}
