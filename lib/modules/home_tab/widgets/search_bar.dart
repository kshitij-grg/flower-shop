import 'package:flutter/material.dart';
import 'package:nomadic_florist/constants.dart';

import 'flower_search_delegate.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSearch(context: context, delegate: FlowerSearchDelegate());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: sixthColor,
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Search for flowers',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
