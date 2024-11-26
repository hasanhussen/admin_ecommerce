import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';

class CustomdropdownSearch extends StatefulWidget {
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelectedName;
  final TextEditingController dropdownSelectedID;
  const CustomdropdownSearch(
      {super.key,
      required this.listdata,
      required this.dropdownSelectedName,
      required this.dropdownSelectedID});

  @override
  State<CustomdropdownSearch> createState() => _CustomdropDownSearchState();
}

class _CustomdropDownSearchState extends State<CustomdropdownSearch> {
  void showDropdownSearch() {
    DropDownState(DropDown(
      data: widget.listdata,
      selectedItems: (List<dynamic> selectedList) {
        SelectedListItem selectedListItem = selectedList[0];
        widget.dropdownSelectedName.text = selectedListItem.name;
        widget.dropdownSelectedID.text = selectedListItem.value!;
      },
    )).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
          onTap: () {
            FocusScope.of(context).unfocus();
            showDropdownSearch();
          },
          style: const TextStyle(color: Colors.white),
          controller: widget.dropdownSelectedName,
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 8, bottom: 0, top: 10, right: 15),
              filled: true,
              fillColor: Color.fromARGB(255, 66, 65, 65),
              hintText: 'choose category for this item',
              hintStyle: TextStyle(color: Colors.white),
              suffixIcon: Icon(
                Icons.arrow_drop_down,
                size: 20,
              ))),
    );
  }
}
