import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import 'CustomSearchTextField.dart';
import 'SeachResultListView.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          CustomSearchTextField(),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Results",
                style: Styles.TimesNewRoman,
              ),
            ),
          ),
          Expanded(child: SeachResultListView())
        ],
      ),
    );
  }
}
