import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/details_screen_args.dart';
import 'package:islami_app/ui/Utilities/app_assets.dart';
import 'package:islami_app/ui/Utilities/app_colors.dart';
import 'package:islami_app/ui/Utilities/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const String iD = 'Details screen';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;
  String fileContent = '';
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (fileContent.isEmpty) {
      readFile();
    }
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          AppAssets.background,
        ),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            arguments.suraOrHadethName,
            style: AppTheme.appBarTitleTextStyle,
          ),
        ),
        backgroundColor: AppColor.transparent,
        body: fileContent.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    fileContent,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      color: AppColor.accent,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void readFile() async {
    String file = await rootBundle.loadString(
        'assets/files/${arguments.isQuranFile ? "quran" : 'ahadeth'}/${arguments.fileName}');
    fileContent = file;
    List<String> fileLines = file.split('\n');
    for (int i = 0; i < fileLines.length; i++) {
      fileLines[i] += arguments.isQuranFile ? "(${i + 1})" : "  ";
    }
    fileContent = fileLines.join();
    setState(() {});
  }
}
