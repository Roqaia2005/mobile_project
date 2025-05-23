// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mobile_final_project/features/search/presentation/views/search_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    required this.isSearch,
  });

  final String title;
  final Widget? leading;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontFamily: "Amaranth-Regular",
        ),
      ),
      backgroundColor: Color(0xff576CD6),
      actions: [
        isSearch
            ? SizedBox()
            : IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchView()),
                  ),
            ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
