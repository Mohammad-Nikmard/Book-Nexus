import 'package:book_nexsus/widgets/page_tag_widget.dart';
import 'package:flutter/material.dart';

class TagListView extends StatefulWidget {
  const TagListView({
    super.key,
    required this.selectedIndex,
    required this.tagNameList,
    required this.iconList,
  });
  final ValueChanged<int> selectedIndex;
  final List<String> tagNameList;
  final List<String> iconList;

  @override
  State<TagListView> createState() => _TagListViewState();
}

class _TagListViewState extends State<TagListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;

                widget.selectedIndex(index);
              },
              child: PageTagWidget(
                isTagTapped: selectedIndex == index,
                tag: widget.tagNameList[index],
                image: widget.iconList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
