import 'package:flutter/material.dart';
import 'package:islami_app/models/details_screen_args.dart';
import 'package:islami_app/ui/Utilities/app_assets.dart';
import 'package:islami_app/ui/Utilities/app_colors.dart';
import 'package:islami_app/ui/Utilities/app_theme.dart';
import 'package:islami_app/ui/Utilities/constats.dart';
import 'package:islami_app/ui/screens/home/details_screen/details_screen.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranTabLogo)),
        const Divider(
          color: AppColor.primary,
          thickness: 1,
        ),
        const Text(
          'Soura Name',
          style: AppTheme.quranTabTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        const Divider(
          color: AppColor.primary,
          thickness: 1,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: Constants.suraNames.length,
            itemBuilder: (Context, index) {
              return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailsScreen.iD,
                      arguments: DetailsScreenArgs(
                        fileName: '${index + 1}.txt',
                        isQuranFile: true,
                        suraOrHadethName: Constants.suraNames[index],
                      ));
                },
                child: Text(
                  Constants.suraNames[index],
                  textAlign: TextAlign.center,
                  style: AppTheme.quranTabTitleTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
