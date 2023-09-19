import 'package:flutter/material.dart';
import 'package:islami_app/models/details_screen_args.dart';
import 'package:islami_app/ui/Utilities/app_assets.dart';
import 'package:islami_app/ui/Utilities/app_colors.dart';
import 'package:islami_app/ui/Utilities/app_theme.dart';
import 'package:islami_app/ui/Utilities/constats.dart';
import 'package:islami_app/ui/screens/home/details_screen/details_screen.dart';

class AhatethTab extends StatelessWidget {
  List ahadethNames = List.generate(50, (index) {
    return '${index + 1} رقم الحديث';
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.ahadethTabLogo)),
        const Divider(
          color: AppColor.primary,
          thickness: 1,
        ),
        const Text(
          'Ahadeth Names',
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
            itemCount: ahadethNames.length,
            itemBuilder: (Context, index) {
              return TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, DetailsScreen.iD,
                      arguments: DetailsScreenArgs(
                        fileName: 'h${index + 1}.txt',
                        isQuranFile: false,
                        suraOrHadethName: Constants.suraNames[index],
                      ));
                },
                child: Text(
                  ahadethNames[index],
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
    ;
  }
}
