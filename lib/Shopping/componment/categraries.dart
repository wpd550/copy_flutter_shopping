import 'package:flutter/material.dart';
import 'package:picturecollection/constans.dart';

class CatograyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CatograyListState();
}

class _CatograyListState extends State<CatograyList> {
  List<String> categories = [
    "one",
    'secord',
    'three',
    'four',
    "one",
    'secord',
    'three',
    'four'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => BuildCateItem(index),
        ),
      ),
    );
  }

  Widget BuildCateItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? kTextColor : kTextLightColor),
            ),
            Container(
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
              margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
            ),
          ],
        ),
      ),
    );
  }
}
