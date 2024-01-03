import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/ItemOrderModel.dart';
import '../../Model/StatusTransport.dart';
import '../bloc/order_detail_bloc.dart';

class StateAddressCustom extends StatelessWidget {
  const StateAddressCustom({
    super.key,
    required this.itemOrderModel,
  });

  final ItemOrderModel itemOrderModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailBloc, OrderDetailState>(
      listener: (context, state) {
        if (state is SOrderDetailConfirmSuccess) {
          itemOrderModel.listStatusTransport.add(StatusTransport(
              id: 0,
              place: 'Chuẩn bị hàng',
              createdAt: DateTime.parse('2023-12-19 00:20:57.000000')));
        }
        if (state is SOrderDetailUpdateAddressSuccess) {
          itemOrderModel.listStatusTransport.add(state.address);
        }
      },
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            itemOrderModel.listStatusTransport.length,
            (index) => Container(
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  margin: const EdgeInsets.all(5),
                  height: 40,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            itemOrderModel.listStatusTransport[index].place,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          itemOrderModel.listStatusTransport[index].createdAt
                              .toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
