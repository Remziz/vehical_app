import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehical_app/blocs/transport_bloc/transport_bloc.dart';
import 'package:vehical_app/design/demensions.dart';
import 'package:vehical_app/design/dialog/error_dialog.dart';
import 'package:vehical_app/design/utils/size_utils.dart';
import 'package:vehical_app/design/widgets/accent_button.dart';
import 'package:vehical_app/pages/driver/driver_page.dart';
import 'package:vehical_app/pages/vehical/vehical_item.dart';
import 'package:vehical_app/pages/vehical_state/vehical_state_page.dart';

class VehicalList extends StatelessWidget {
  const VehicalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _list(context),
        Align(
          alignment: Alignment.bottomCenter,
          child: _updateButton(context),
        ),
      ],
    );
  }

  Widget _list(BuildContext context) {
    return BlocBuilder<TransportBloc, TransportState>(
        builder: (context, state) {
      if (state is TransportLoaded) {
        return ListView.separated(
          itemCount: state.transportData.length,
          padding: EdgeInsets.only(
            left: padding16,
            right: padding16,
            top: padding16,
            bottom: getListBottomPadding(context),
          ),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: height8,
            );
          },
          itemBuilder: (context, index) {
            final transport = state.transportData[index];
            return VehicalItem(
              onTap: () async {
                await _showDriverPage(context);
              },
              onStateTap: () async {
                await _showVehicalStatePage(context, transport.driver);
              },
              model: transport.model,
              driver: transport.driver,
              status: transport.status,
            );
          },
        );
      } else {
        return Container();
      }
    });
  }

  Widget _updateButton(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: padding16,
          left: padding16,
          right: padding16,
        ),
        child: AccentButton(
          title: 'Обновить',
          onTap: () {
            _showErrorDialog(context);
          },
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ErrorDialog(
            desription: 'Сервер недоступен. Попробуйте обратиться позже');
      },
    );
  }

  Future<void> _showDriverPage(BuildContext context) async {
    await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return const DriverPage();
    }));
  }

  Future<void> _showVehicalStatePage(
      BuildContext context, String driver) async {
    await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return VehicalStatePage(
        driver: driver,
      );
    }));
  }
}
