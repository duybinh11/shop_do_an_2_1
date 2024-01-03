import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_do_an_2_1/OrderDetailPage/bloc/order_detail_bloc.dart';

import '../../Model/ItemOrderModel.dart';

class OrderDetailBottom extends StatelessWidget {
  OrderDetailBottom({super.key, required this.orderModel});
  final ItemOrderModel orderModel;
  TextEditingController addressCtl = TextEditingController();
  void clickConfirm(BuildContext context) {
    context
        .read<OrderDetailBloc>()
        .add(EOrderDetailConfirmShop(idOrder: orderModel.id));
  }

  void clickUpdateAddress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              TextField(
                controller: addressCtl,
                decoration: const InputDecoration(label: Text('Địa chỉ mới')),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
              onPressed: () => context.read<OrderDetailBloc>().add(
                  EOrderDetailUpdateAddress(
                      idOrder: orderModel.id, place: addressCtl.text)),
              child: const Text(
                'Cập nhật',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailBloc, OrderDetailState>(
      listener: (context, state) {
        if (state is SOrderDetailConfirmSuccess) {
          orderModel.isShopConfirm = true;
        }
        if (state is SOrderDetailUpdateAddressSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is SOrderDetailConfirmLoading) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const CircularProgressIndicator()),
          );
        }
        if (!orderModel.isShopConfirm) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => clickConfirm(context),
                child: const Text(
                  'Xác nhận đơn hàng',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )),
          );
        } else if (orderModel.listStatusTransport.last.place ==
            'Đã nhận hàng') {
          return const Text('Đơn hàng hoàn tất');
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                onPressed: () => clickUpdateAddress(context),
                child: const Text(
                  'Cập nhật đơn hàng',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )),
          );
        }
      },
    );
  }
}
