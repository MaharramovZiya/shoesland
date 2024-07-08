import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      surfaceTintColor: WidgetStateColor.transparent,
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateColor.resolveWith(
        (states) => Colours.white,
      ),
      leading: const Icon(Icons.search),
      hintText: LocalStrings().lookforShoes,
    );
  }
}
