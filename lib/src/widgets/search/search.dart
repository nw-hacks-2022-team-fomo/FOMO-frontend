import 'package:flutter/material.dart';
import 'package:app_frontend/src/widgets/search/page_elements/search_bar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String search = '';

  void handleSearch() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('Search',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                )),
          ),
          SearchBar(
            setSearch: (search) => setState(() {
              search = search;
            }),
            handleSearch: handleSearch,
          ),
        ],
      ),
    );
  }
}
