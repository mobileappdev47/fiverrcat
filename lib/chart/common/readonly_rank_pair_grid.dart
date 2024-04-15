
import "package:flutter/widgets.dart";
import "package:poker/poker.dart";
import 'package:pokercat/constant.dart';

import '../constarants/card.dart';


class ReadonlyRankPairGrid extends StatelessWidget {
  const ReadonlyRankPairGrid({required this.rankPairs, Key? key}) : super(key: key);

  final Set<RankPair> rankPairs;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) => DecoratedBox(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(constraints.maxWidth * 0.05),
        ),
        child: Table(
          children: List.generate(ranksInStrongnessOrder.length, (row) {
            return TableRow(
              children: List.generate(ranksInStrongnessOrder.length, (column) {
                final high = row < column ? row : column;
                final kicker = high == row ? column : row;
                final rankPairsPart = row < column
                    ? RankPair.suited(
                        high: ranksInStrongnessOrder[high],
                        kicker: ranksInStrongnessOrder[kicker],
                      )
                    : RankPair.ofsuit(
                        high: ranksInStrongnessOrder[high],
                        kicker: ranksInStrongnessOrder[kicker],
                      );
                BorderRadius? borderRadius;

                if (row == 0 && column == 0) {
                  borderRadius = BorderRadius.only(
                      topLeft: Radius.circular(constraints.maxWidth * 0.05));
                }

                if (row == 0 && column == ranksInStrongnessOrder.length - 1) {
                  borderRadius = BorderRadius.only(
                      topRight: Radius.circular(constraints.maxWidth * 0.05));
                }

                if (row == ranksInStrongnessOrder.length - 1 && column == 0) {
                  borderRadius = BorderRadius.only(
                      bottomLeft: Radius.circular(constraints.maxWidth * 0.05));
                }

                if (row == ranksInStrongnessOrder.length - 1 &&
                    column == ranksInStrongnessOrder.length - 1) {
                  borderRadius = BorderRadius.only(
                      bottomRight:
                          Radius.circular(constraints.maxWidth * 0.05));
                }

                return TableCell(
                  child: Container(
                    height: constraints.maxWidth / 13,
                    decoration: BoxDecoration(
                      color: rankPairs.contains(rankPairsPart)
                          ? AppTheme.white
                          : null,
                      borderRadius: borderRadius,
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
