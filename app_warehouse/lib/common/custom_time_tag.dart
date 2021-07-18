import 'package:app_warehouse/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';

class CustomTimeTag extends StatefulWidget {
  @override
  _CustomTimeTagState createState() => _CustomTimeTagState();
}

class _CustomTimeTagState extends State<CustomTimeTag> {
  List<Tag> _tags = [
    Tag(
      id: 1,
      title: "8am - 10am",
      active: false,
    ),
    Tag(
      id: 2,
      title: "10am - 12pm",
      active: false,
    ),
    Tag(
      id: 3,
      title: "12pm - 14pm",
      active: false,
    ),
    Tag(
      id: 4,
      title: "14pm - 16pm",
      active: false,
    ),
    Tag(
      id: 5,
      title: "16pm - 18pm",
      active: false,
    )
  ];
  void changeSelectTime(Tag tags) {
    for (var tag in _tags) {
      if (tag.id == tags.id) {
        setState(() {
          tag.active = true;
        });
      } else {
        setState(() {
          tag.active = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectableTags(
      tags: _tags,
      columns: 3, // default 4
      symmetry: true,
      activeColor: CustomColor.purple,
      onPressed: (tags) => {changeSelectTime(tags)},
    );
  }
}
