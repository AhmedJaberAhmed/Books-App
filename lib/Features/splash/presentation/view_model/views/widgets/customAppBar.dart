import 'package:bookly/Core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/utils/AssetsImage.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 20, top: 40,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            Assetsimagee.logo,
            height: 25,
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kSearchView);
              },
              icon: const Icon(
                FontAwesomeIcons.search,
                size: 30,
              ))
        ],
      ),
    );
  }
}
