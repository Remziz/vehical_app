import 'package:flutter/material.dart';
import 'package:vehical_app/design/colors.dart';
import 'package:vehical_app/design/styles.dart';
import 'package:vehical_app/pages/vehical_state/vehcial_state_list.dart';

class VehicalStatePage extends StatelessWidget {
  const VehicalStatePage({
    super.key,
    required this.driver,
    required this.id,
    required this.transportModel,
  });
  final int id;
  final String driver;
  final String transportModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Обновить статус водителя',
          style: primaryTextStyle,
        ),
        centerTitle: true,
        backgroundColor: surfaceColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: VehicalStateList(
          id: id,
          driver: driver,
          transportModel: transportModel,
        ),
      ),
    );
  }
}
