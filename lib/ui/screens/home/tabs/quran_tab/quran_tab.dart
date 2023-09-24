import 'package:flutter/material.dart';
import 'package:islami_app/models/details_screen_args.dart';
import 'package:islami_app/ui/Utilities/app_assets.dart';

import 'package:islami_app/ui/Utilities/constats.dart';
import 'package:islami_app/ui/screens/home/details_screen/details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.quranTabLogo)),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.suraname,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        const Divider(),
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
