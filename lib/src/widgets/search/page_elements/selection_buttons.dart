import 'package:flutter/material.dart';

class SelectionButtons extends StatelessWidget {
  const SelectionButtons(
      {Key? key,
      required this.data,
      this.selectedValue,
      required this.onSetSelected})
      : super(key: key);

  // value-label pairs
  final Map<dynamic, String> data;
  final dynamic selectedValue;
  final void Function(dynamic) onSetSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: data.entries
          .map((entry) => GestureDetector(
                onTap: () {
                  onSetSelected(entry.key);
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 8, right: 8),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    decoration: BoxDecoration(
                        color: (selectedValue == entry.key)
                            ? const Color(0xFFFFA800)
                            : const Color.fromARGB(0, 0, 0, 0),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: const Color(0xFFFFA800), width: 1.2)),
                    child: Text(entry.value,
                        style: TextStyle(
                          color: (selectedValue == entry.key)
                              ? Colors.white
                              : const Color(0xFFFFA800),
                          fontSize: 16,
                        ))),
              ))
          .toList(),
    );
  }
}
