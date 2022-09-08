import 'package:cached_network_image/cached_network_image.dart';
import 'package:currencyapp/core/constants/url_const.dart';
import 'package:currencyapp/model/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyItemCard extends StatelessWidget {
  CurrencyModel currencyModel;
  CurrencyItemCard({Key? key, required this.currencyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "${UrlConst.imageUrl}${currencyModel.code![0]}${currencyModel.code![1]}"),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currencyModel.code!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("1 ${currencyModel.title}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  )),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(currencyModel.cbPrice!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text("2.96%",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
