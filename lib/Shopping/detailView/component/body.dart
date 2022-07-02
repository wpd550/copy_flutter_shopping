import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:picturecollection/Shopping/Model/Products.dart';
import 'package:picturecollection/Shopping/detailView/component/ColorAndSize.dart';
import 'package:picturecollection/Shopping/detailView/component/Count_Fav.dart';
import 'package:picturecollection/Shopping/detailView/component/Descriteble.dart';
import 'package:picturecollection/Shopping/detailView/component/productTilteAndImage.dart';
import 'package:picturecollection/constans.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            //堆叠视图
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      Descritble(product: product),
                      const SizedBox(
                        height: kDefaultPaddin,
                      ),
                      CountAndFav(),
                      const SizedBox(
                        height: kDefaultPaddin,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 50,
                              child: TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(color: product.color, width: 1),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/cart.svg',
                                  color: product.color,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: kDefaultPaddin),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        product.color),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'BUY NOW',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ProductTitleAndImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
