import 'package:app_warehouse/common/custom_app_bar.dart';
import 'package:app_warehouse/common/custom_button.dart';
import 'package:app_warehouse/common/custom_color.dart';
import 'package:app_warehouse/common/custom_sizebox.dart';
import 'package:app_warehouse/common/custom_text.dart';
import 'package:app_warehouse/pages/owner_screens/choose_shelf/choose_shelf_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ShelfDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  ShelfDetailScreen({this.data});
  int staggeredTileBuilderIndex = 0;

  void sortList(List<Map<String, dynamic>> list) {
    list.sort((a, b) {
      return a['formatedPosition']
          .toLowerCase()
          .compareTo(b['formatedPosition'].toLowerCase());
    });
    list = list.reversed.toList();
  }

  void formatData(List<Map<String, dynamic>> listBox) {
    sortList(listBox);
    int numberLargeBox = 0;
    listBox.forEach((element) {
      int position = int.parse(element['formatedPosition']);
      element['formatedPosition'] = (position - numberLargeBox).toString();
      if (element['type'] == 'large') {
        numberLargeBox++;
      }
    });
  }

  Widget _buildBox({
    @required int index,
    @required Color color,
  }) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }

  int checkIsLargeType(int index, List<Map<String, dynamic>> listBox) {
    final box = listBox[staggeredTileBuilderIndex];
    if (box['formatedPosition'] == index.toString()) {
      if (box['type'] == 'large') {
        return 2;
      }
    }
    return 1;
  }

  Widget _buildNoteForIcon(
      {@required String name,
      @required Color color,
      @required Size deviceSize,
      @required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: deviceSize.width / 12,
          width: deviceSize.width / 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        CustomSizedBox(
          context: context,
          width: 8,
        ),
        CustomText(
            text: name,
            color: CustomColor.black,
            fontWeight: FontWeight.bold,
            context: context,
            fontSize: 14)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int indexItem = 0;
    final deviceSize = MediaQuery.of(context).size;
    List<Map<String, dynamic>> listBox = [...data['listBox']];

    List<String> numbers = ['1', '2', '3', '4'];
    int totalItem = 12;
    listBox.forEach((element) {
      String position = element['position'];

      element.putIfAbsent('formatedPosition', () {
        int result;
        int dozen;
        switch (position[0]) {
          case 'A':
            {
              dozen = 0;
              break;
            }
          case 'B':
            {
              dozen = 4;
              break;
            }
          default:
            {
              dozen = 8;
            }
        }
        result = dozen + int.parse(position[1]) - 1;

        return result.toString();
      });

      if (element['type'] == 'large') {
        totalItem--;
      }
    });
    formatData(listBox);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            CustomAppBar(
              isHome: false,
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomText(
              text: data['name'],
              color: CustomColor.black,
              context: context,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            CustomSizedBox(
              context: context,
              height: 32,
            ),
            Container(
              width: deviceSize.width,
              height: deviceSize.height / 20,
              child: Row(
                children: [
                  CustomSizedBox(
                    context: context,
                    width: 46,
                  ),
                  Container(
                    width: deviceSize.width / 1.4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: numbers.length,
                      itemBuilder: (_, index) => Container(
                        margin: index == 3
                            ? const EdgeInsets.only(right: 0)
                            : EdgeInsets.only(right: deviceSize.width / 6.3),
                        child: CustomText(
                          text: numbers[index],
                          color: CustomColor.black,
                          context: context,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(children: [
                Container(
                  height: deviceSize.height / 3.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'A',
                          color: CustomColor.black,
                          fontWeight: FontWeight.bold,
                          context: context,
                          fontSize: 24),
                      CustomSizedBox(
                        context: context,
                        height: 24,
                      ),
                      CustomText(
                          text: 'B',
                          color: CustomColor.black,
                          fontWeight: FontWeight.bold,
                          context: context,
                          fontSize: 24),
                      CustomSizedBox(
                        context: context,
                        height: 24,
                      ),
                      CustomText(
                          text: 'C',
                          color: CustomColor.black,
                          fontWeight: FontWeight.bold,
                          context: context,
                          fontSize: 24),
                      CustomSizedBox(
                        context: context,
                        height: 24,
                      ),
                    ],
                  ),
                ),
                CustomSizedBox(
                  context: context,
                  width: 14,
                ),
                Container(
                  height: deviceSize.height / 2.8,
                  width: deviceSize.width / 1.4,
                  child: StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: totalItem,
                    itemBuilder: (BuildContext context, int index) {
                      if (indexItem >= listBox.length) {
                        return _buildBox(
                          index: index,
                          color: CustomColor.black[3],
                        );
                      }

                      final box = listBox[indexItem];
                      if (box['formatedPosition'] == index.toString()) {
                        if (box['type'] == 'large') {
                          ++indexItem;
                          return _buildBox(
                            index: index,
                            color: CustomColor.lightBlue,
                          );
                        } else {
                          ++indexItem;
                          return _buildBox(
                            index: index,
                            color: CustomColor.purple,
                          );
                        }
                      }
                      return _buildBox(
                        index: index,
                        color: CustomColor.black[3],
                      );
                    },
                    staggeredTileBuilder: (int index) {
                      if (staggeredTileBuilderIndex >= listBox.length) {
                        return new StaggeredTile.count(1, 1);
                      }

                      final box = listBox[staggeredTileBuilderIndex];

                      StaggeredTile staggeredTile = new StaggeredTile.count(
                          checkIsLargeType(index, listBox), 1);

                      if (box['formatedPosition'] == index.toString()) {
                        staggeredTileBuilderIndex++;
                      }
                      return staggeredTile;
                    },
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 12.0,
                  ),
                ),
              ]),
            ),
            Row(
              children: [
                CustomSizedBox(
                  context: context,
                  width: deviceSize.width / 12,
                ),
                Container(
                  width: deviceSize.width / 2.8,
                  child: Column(
                    children: [
                      _buildNoteForIcon(
                          name: 'Available',
                          color: CustomColor.black[3],
                          deviceSize: deviceSize,
                          context: context),
                      CustomSizedBox(
                        context: context,
                        height: 16,
                      ),
                      _buildNoteForIcon(
                          name: '0.5m x 1m x 1m',
                          color: CustomColor.purple,
                          deviceSize: deviceSize,
                          context: context),
                      CustomSizedBox(
                        context: context,
                        height: 16,
                      ),
                      _buildNoteForIcon(
                          name: '1m x 1m x 1m',
                          color: CustomColor.lightBlue,
                          deviceSize: deviceSize,
                          context: context),
                    ],
                  ),
                ),
                CustomSizedBox(
                  context: context,
                  width: 4,
                ),
                Container(
                  height: deviceSize.height / 4,
                  width: deviceSize.width / 3,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: CustomColor.black, width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Order Id',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomSizedBox(
                        context: context,
                        height: 4,
                      ),
                      CustomText(
                        text: 'R001',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 14,
                      ),
                      CustomSizedBox(
                        context: context,
                        height: 16,
                      ),
                      CustomText(
                        text: 'Time remain',
                        color: CustomColor.black,
                        context: context,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomSizedBox(
                        context: context,
                        height: 4,
                      ),
                      CustomText(
                        text: '1 Month - 1 Week - 4 Days',
                        color: CustomColor.black,
                        context: context,
                        maxLines: 2,
                        fontSize: 14,
                      ),
                    ],
                  ),
                )
              ],
            ),
            CustomSizedBox(
              context: context,
              height: 16,
            ),
            CustomButton(
                height: 32,
                text: 'Move',
                width: double.infinity,
                textColor: CustomColor.green,
                onPressFunction: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ChooseSelfScreen()));
                },
                buttonColor: CustomColor.lightBlue,
                borderRadius: 4),
            CustomSizedBox(
              context: context,
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
