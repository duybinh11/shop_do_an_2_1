
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Login/bloc/login_bloc.dart';
import '../../Model/AddressHistory.dart';
import '../../Model/UserModel.dart';

// ignore: must_be_immutable
class UserCustom extends StatefulWidget {
  UserCustom({super.key, required this.address, required this.userModel});
  AddressHistory address;
  final UserModel userModel;

  @override
  State<UserCustom> createState() => _UserCustomState();
}

class _UserCustomState extends State<UserCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration:
            BoxDecoration(border: Border.all(width: 3, color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Địa chỉ nhận hàng'),
                Icon(
                  Icons.place,
                  color: Colors.red,
                  size: 20,
                ),
              ],
            ),
            Text('${widget.userModel.username} | ${widget.userModel.phone}'),
            Text(
              widget.address.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
