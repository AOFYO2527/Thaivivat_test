import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';


class MyDropdown extends StatelessWidget {
  final items;
  final Object? selectedItem;
  final void Function(Object?) onChanged;
  final String hintText;
  final bool isReadOnly;

  const MyDropdown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.hintText,
    this.isReadOnly = false,
  }) : super(key: key);

  //ดูตัวอย่างการใช้งาน หน้า CheckHistoryDrugPage.dart

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
          hintText,
          style: TextStyle(color: Colors.black26),
          overflow: TextOverflow.ellipsis,
        ),
        items: items,
        value: selectedItem,
        onChanged: isReadOnly == true ? null : onChanged,
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down),
        ),
        buttonStyleData: ButtonStyleData(
          height: 45,
          width: 180,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black12,
            ),
            color: Colors.white,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          // width: 180,
          elevation: 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
