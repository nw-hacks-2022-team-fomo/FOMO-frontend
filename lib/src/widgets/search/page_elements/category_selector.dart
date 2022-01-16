import 'package:flutter/material.dart';
import 'package:app_frontend/src/constants/tag_icons.dart' as tag_icons;

class CategorySquare extends StatelessWidget {
  const CategorySquare({Key? key, required this.name, required this.isSelected})
      : super(key: key);
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected
            ? const Color(0xFFFFA800)
            : const Color.fromARGB(0, 0, 0, 0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          Icon(
            tag_icons.iconMap[name],
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
          Text(name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontSize: 12,
              ))
        ],
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  const CategorySelector(
      {Key? key, required this.selected, required this.onSelect})
      : super(key: key);

  final Set<String> selected;
  final void Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
            children: tag_icons.tagList
                .sublist(0, tag_icons.tagList.length ~/ 2)
                .map((key) => GestureDetector(
                      onTap: () {
                        onSelect(key);
                      },
                      child: CategorySquare(
                        name: key,
                        isSelected: selected.contains(key),
                      ),
                    ))
                .toList()),
        TableRow(
            children: tag_icons.tagList
                .sublist(tag_icons.tagList.length ~/ 2)
                .map((key) => GestureDetector(
                      onTap: () {
                        onSelect(key);
                      },
                      child: CategorySquare(
                        name: key,
                        isSelected: selected.contains(key),
                      ),
                    ))
                .toList()),
      ],
    );
  }
}
