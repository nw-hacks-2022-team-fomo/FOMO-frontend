import 'package:flutter/material.dart';
import 'package:app_frontend/src/widgets/account.dart';
import 'package:app_frontend/src/widgets/home/home.dart';
import 'package:app_frontend/src/widgets/search.dart';

const List<Map<String, dynamic>> pages = [
  {'label': 'Search', 'icon': Icon(Icons.search), 'widget': Search()},
  {'label': 'Home', 'icon': Icon(Icons.home), 'widget': Home()},
  {'label': 'Account', 'icon': Icon(Icons.account_circle), 'widget': Account()},
];
