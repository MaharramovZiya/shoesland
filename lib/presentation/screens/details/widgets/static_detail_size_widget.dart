import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class DetailSizeTitleWidget extends StatelessWidget {
  const DetailSizeTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralTextWidget(
          LocalStrings().size,
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            GeneralTextWidget(
              LocalStrings().eu,
              textStyle: const TextStyle(
                  color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 7,
            ),
            GeneralTextWidget(
              LocalStrings().us,
              textStyle: const TextStyle(
                  color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 7,
            ),
            GeneralTextWidget(
              LocalStrings().uk,
              textStyle: const TextStyle(
                  color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
