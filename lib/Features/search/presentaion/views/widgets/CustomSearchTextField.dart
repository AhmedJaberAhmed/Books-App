
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search books, authors, or topics',
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 16,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
                 //todo
            },
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
              color: Colors.grey.shade800,
            ),
          ),
        ),
        cursorColor: Theme.of(context).primaryColor,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
