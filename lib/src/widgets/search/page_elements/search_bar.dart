import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key? key, required this.setSearch, required this.handleSearch})
      : super(key: key);

  final void Function(String search) setSearch;
  final void Function() handleSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 8, 0),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.search,
            color: Color(0xFFFFA800),
          ),
          onPressed: () => handleSearch(),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Looking for something?',
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      onChanged: setSearch,
    );
  }
}
