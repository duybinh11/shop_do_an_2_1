import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_do_an_2_1/Model/ItemOrderModel.dart';
import 'package:shop_do_an_2_1/OrderDetailPage/ui/OrderDetailPage.dart';

import '../../Model/ItemModel.dart';

// ignore: must_be_immutable
class ItemOrderCustom extends StatelessWidget {
  const ItemOrderCustom({super.key, required this.itemOrder});
  final ItemOrderModel itemOrder;
  @override
  Widget build(BuildContext context) {
    ItemModel itemModel = itemOrder.item;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, OrderDetailPage.routeName,
          arguments: {'order': itemOrder}),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
        height: 80,
        width: double.infinity,
        color: Colors.grey.withOpacity(0.2),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 100,
                height: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: itemModel.img,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  fit: BoxFit.cover,
                ),
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
                      itemModel.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ),
                  itemOrder.isShopConfirm
                      ? const Text(
                          'Đã Xác nhận',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w700),
                        )
                      : const Text(
                          'Chưa Xác nhận',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.w700),
                        ),
                  itemOrder.listStatusTransport.isNotEmpty
                      ? Text(
                          itemOrder.listStatusTransport.last.place,
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.w700),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
