import 'package:flutter/material.dart';
import 'package:picturecollection/Shopping/Model/Products.dart';
import 'package:picturecollection/Shopping/detailView/component/ColorDot.dart';
import 'package:picturecollection/constans.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Color'),
            ColorListDot(),
          ],
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(color: kTextColor),
            children: [
              const TextSpan(
                text: "Size\n",
              ),
              TextSpan(
                text: '${product.size} cm',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorListDot extends StatefulWidget {
  ColorListDot({
    Key? key,
  }) : super(key: key);
  List<Color> colorList = [
    Color(0xFF356C95),
    Color(0xFFF8C078),
    Color(0xFFA29B9B)
  ];

  @override
  State<ColorListDot> createState() => _ColorListDotState();
}

class _ColorListDotState extends State<ColorListDot> {
  @override
  int selectIndex = 0;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        height: 30,
        width: 200,
        child: ListView.builder(
          itemBuilder: ((context, index) => ColorDot(
                color: widget.colorList[index],
                isSelected: index == selectIndex,
                press: () {
                  setState(() {
                    selectIndex = index;
                  });
                },
              )),
          itemCount: widget.colorList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
