import 'package:flutter/material.dart';

import '../services/utils.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({super.key});

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  final TextEditingController? _quantityTextControler = TextEditingController();
  final FocusNode _searchTextFocusMode = FocusNode();
  @override
  void dispose() {
    _quantityTextControler!.dispose();
    _searchTextFocusMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: TextFormField(
          focusNode: _searchTextFocusMode,
          onChanged: (value) {
            print(value);
            setState(() {});
          },
          controller: _quantityTextControler,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Colors.greenAccent, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: Colors.greenAccent, width: 1),
              ),
              hintText: "What's in your mind",
              prefixIcon: const Icon(Icons.search),
              suffix: IconButton(
                  onPressed: () {
                    _quantityTextControler!.clear();
                    _searchTextFocusMode.unfocus();
                  },
                  icon: Icon(
                    Icons.close,
                    color:
                        _searchTextFocusMode.hasFocus ? Colors.red : colorText,
                  ))),
        ),
      ),
    );
  }
}
