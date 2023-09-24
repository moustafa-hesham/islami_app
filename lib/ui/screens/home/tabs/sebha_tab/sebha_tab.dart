import 'package:flutter/material.dart';
import 'package:islami_app/ui/Utilities/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int sebhaCount = 0;
  int index = 0;
  List<String> tasabeehList = ['سبحان الله', "الحمد لله", " الله اكبر"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset('assets/images/head of seb7a.png'),
              RotationTransition(
                  turns: AlwaysStoppedAnimation(angle / 360),
                  child: Image.asset('assets/images/body of seb7a.png')),
            ],
          ),
          const Text('عدد التسبيحات'),
          GestureDetector(
            onTap: rotateImage,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: AppColor.primary,
                    ),
                    width: 69,
                    height: 81,
                    child: Center(
                      child: Text(
                        sebhaCount.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: AppColor.primary,
                  ),
                  width: 137,
                  height: 51,
                  child: Center(
                      child: Text(
                    tasabeehList[index],
                    style: const TextStyle(
                        color: AppColor.white, fontWeight: FontWeight.normal),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void rotateImage() {
    setState(() {
      if (sebhaCount <= 32) {
        sebhaCount++;
      } else {
        if (index < tasabeehList.length - 1) {
          index++;
          sebhaCount = 0;
        } else {
          index = 0;
          sebhaCount = 0;
        }
      }
      angle += 45.0;
    });
  }
}
