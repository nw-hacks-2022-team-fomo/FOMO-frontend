import 'package:flutter/material.dart';
import 'package:app_frontend/src/widgets/search/page_elements/search_bar.dart';
import 'package:app_frontend/src/widgets/search/page_elements/sub_heading.dart';
import 'package:app_frontend/src/widgets/search/page_elements/category_selector.dart';
import 'package:app_frontend/src/widgets/search/page_elements/selection_buttons.dart';
import 'package:app_frontend/src/constants/filter_options.dart'
    as filter_options;

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String search = '';
  Set<String> selectedCategories = {};
  int selectedPrice = 0;
  int selectedDistance = 0;
  int selectedDate = 0;

  void handleSelectCategory(String category) {
    if (selectedCategories.contains(category)) {
      setState(() {
        selectedCategories.remove(category);
      });
    } else {
      setState(() {
        selectedCategories.add(category);
      });
    }
  }

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
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                )),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom:
                        BorderSide(width: 1.5, color: Colors.grey.shade300))),
            child: SearchBar(
              setSearch: (search) => setState(() {
                search = search;
              }),
              handleSearch: handleSearch,
            ),
          ),
          const SubHeading(
              main: '1. Search by Category',
              sub: "Select categories you're interested in"),
          CategorySelector(
              selected: selectedCategories, onSelect: handleSelectCategory),
          const SubHeading(main: '2. Price', sub: "Select your budget"),
          SelectionButtons(
            data: filter_options.prices,
            onSetSelected: (selection) {
              setState(() {
                selectedPrice = selection;
              });
            },
            selectedValue: selectedPrice,
          ),
          const SubHeading(
              main: '3. Location', sub: "Search by event distance"),
          SelectionButtons(
            data: filter_options.distances,
            onSetSelected: (selection) {
              setState(() {
                selectedDistance = selection;
              });
            },
            selectedValue: selectedDistance,
          ),
          const SubHeading(
              main: '4. Dates', sub: "Search by event date(s) within"),
          SelectionButtons(
            data: filter_options.dates,
            onSetSelected: (selection) {
              setState(() {
                selectedDate = selection;
              });
            },
            selectedValue: selectedDate,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 32, left: 40, right: 40),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFA800),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 4,
                          color: Color.fromRGBO(0, 0, 0, 0.15))
                    ],
                    border:
                        Border.all(color: const Color(0xFFFFA800), width: 1.2)),
                child: const Text("Apply Filters and Find Events!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ))),
          )
        ],
      ),
    );
  }
}
