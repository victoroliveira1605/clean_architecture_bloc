import 'package:clean_architecture_triple/core/constants/app_color.dart';
import 'package:clean_architecture_triple/core/constants/strings.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final int selected;
  final Function(int) onSelectChange;

  const Category({required this.selected, required this.onSelectChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () => onSelectChange(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              [
                "Em exibição",
                "Em breve",
              ][index],
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selected
                        ? whiteColor
                        : whiteColor.withOpacity(0.4),
                  ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selected ? whiteColor : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
