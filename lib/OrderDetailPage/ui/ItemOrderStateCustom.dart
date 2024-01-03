import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Model/ItemOrderModel.dart';

// ignore: must_be_immutable
class ItemOrderStateCustom extends StatelessWidget {
  ItemOrderStateCustom(
      {super.key, required this.itemOrder, required this.statePayment});
  bool statePayment;

  final ItemOrderModel itemOrder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: double.infinity,
              child: CachedNetworkImage(
                imageUrl: itemOrder.item.img,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    itemOrder.item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    statePayment
                        ? const Expanded(
                            child: Text(
                            'Đã thanh toán',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ))
                        : const Expanded(
                            child: Text(
                              'Chưa thanh toán',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                    Text('X${itemOrder.amount}')
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
