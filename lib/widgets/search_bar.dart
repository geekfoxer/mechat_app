// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  SearchBar({
    @required this.controller,
    @required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Color(0xffe0e0e0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 2,
        ),
        child: Row(
          children: [
            ExcludeSemantics(
              child: Icon(
                CupertinoIcons.search,
                size: 18.0,
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
            ),
            Expanded(
              child: CupertinoTextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'NotoSans',
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                  ),
                  cursorColor: Color.fromRGBO(0, 122, 255, 1),
                ),
            ),
            GestureDetector(
              onTap: () {
                controller.clear();
              },
              child: Icon(
                CupertinoIcons.clear_thick_circled,
                size: 18.0,
                semanticLabel: 'Clear search terms',
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
