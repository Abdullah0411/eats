import 'package:eats_client/features/delivery_apps/presentation/widgets/delivery_app_item.dart';
import 'package:eats_client/utils/enums/delivery_app.dart';
import 'package:flutter/material.dart';

class SelectableDeliveryAppsList extends StatefulWidget {
  const SelectableDeliveryAppsList(
      {super.key, required this.children, required this.onChange});

  final List<DeliveryApp> children;
  final Function(DeliveryApp) onChange;

  @override
  State<SelectableDeliveryAppsList> createState() =>
      _SelectableDeliveryAppsListState();
}

class _SelectableDeliveryAppsListState
    extends State<SelectableDeliveryAppsList> {
  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children.map((deliveryApp) {
        int index = widget.children.indexOf(deliveryApp);
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
              widget.onChange(deliveryApp);
            });
          },
          child: DeliveryAppItem(
            deliveryApp: deliveryApp,
            isSelected: _selectedIndex == index,
          ),
        );
      }).toList(),
    );
  }
}
