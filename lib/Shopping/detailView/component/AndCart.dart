import 'package:flutter/material.dart';
import 'package:picturecollection/constans.dart';

class AnntoCard extends StatefulWidget {
  const AnntoCard({Key? key}) : super(key: key);

  @override
  State<AnntoCard> createState() => AnntoCardState();
}

class AnntoCardState extends State<AnntoCard> {
  int counts = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildOutlineButton(const Icon(Icons.remove), () {
          if (counts > 1) {
            setState(() {
              counts--;
            });
          }
        }),
        const SizedBox(
          width: kDefaultPaddin,
        ),
        Text(
          counts.toString().padLeft(2, '0'),
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          width: kDefaultPaddin,
        ),
        BuildOutlineButton(const Icon(Icons.add), () {
          setState(() {
            counts++;
          });
        }),
      ],
    );
  }

  SizedBox BuildOutlineButton(Icon icon, Function()? press) {
    return SizedBox(
      height: 40,
      width: 40,
      child: OutlinedButton(
        onPressed: press,
        child: icon,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}
