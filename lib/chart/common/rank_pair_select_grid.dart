
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:poker/poker.dart";

import '../../constant.dart';
import '../../global/component/reusable_text.dart';
import '../constarants/card.dart';



class RankPairSelectGrid extends StatefulWidget {
  const RankPairSelectGrid({
    Key? key,
    required this.onChanged,

    this.value = const {},
  }) : super(key: key);

  final void Function(Set<RankPair> rankPairs) onChanged;



  final Set<RankPair> value;

  @override
  State<RankPairSelectGrid> createState() => _RankPairSelectGridState();
}

class _RankPairSelectGridState extends State<RankPairSelectGrid> {
  late Set<RankPair> selectedRange;

  bool isToMark = false;

  RankPair? lastChangedPart;

  @override
  void initState() {
    super.initState();

    selectedRange = {...widget.value};
  }

  @override
  void didUpdateWidget(RankPairSelectGrid oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      setState(() {
        selectedRange = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding:  EdgeInsets.all(6.w),
    child: Column(
      children: [
        AspectRatio(
          aspectRatio: 1.05,
          child: LayoutBuilder(
            builder: (context, constraints) => GestureDetector(
              onPanStart: (details) {
                final x = details.localPosition.dx *
                    Rank.values.length ~/
                    constraints.maxWidth;
                final y = details.localPosition.dy *
                    Rank.values.length ~/
                    constraints.maxHeight;
                final rankPairsPart = x > y
                    ? RankPair.suited(
                        high: ranksInStrongnessOrder[y],
                        kicker: ranksInStrongnessOrder[x],
                      )
                    : RankPair.ofsuit(
                        high: ranksInStrongnessOrder[x],
                        kicker: ranksInStrongnessOrder[y],
                      );
              },
              onPanUpdate: (details) {
                final x = details.localPosition.dx *
                    Rank.values.length ~/
                    constraints.maxWidth;
                final y = details.localPosition.dy *
                    Rank.values.length ~/
                    constraints.maxHeight;

                if (x < 0 || x >= Rank.values.length) return;
                if (y < 0 || y >= Rank.values.length) return;

                final rankPairsPart = x > y
                    ? RankPair.suited(
                        high: ranksInStrongnessOrder[y],
                        kicker: ranksInStrongnessOrder[x],
                      )
                    : RankPair.ofsuit(
                        high: ranksInStrongnessOrder[x],
                        kicker: ranksInStrongnessOrder[y],
                      );
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: List.generate(Rank.values.length * 2 - 1, (i) {
                  if (i % 2 == 1) return const SizedBox(height: 2);
                  final y = i ~/ 2;
                  return Expanded(
                    child: Row(
                      children: List.generate(Rank.values.length * 2 - 1, (j) {
                        if (j % 2 == 1) return const SizedBox(width: 2);
                        final x = j ~/ 2;
                        final rankPairsPart = x > y
                            ? RankPair.suited(
                                high: ranksInStrongnessOrder[y],
                                kicker: ranksInStrongnessOrder[x],
                              )
                            : RankPair.ofsuit(
                                high: ranksInStrongnessOrder[x],
                                kicker: ranksInStrongnessOrder[y],
                              );

                        return Expanded(
                          child: RankPairSelectGridItem(
                            rankPairsPart: rankPairsPart,
                            isSelected: selectedRange.contains(rankPairsPart),
                          ),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 6.h, 0.0,0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(3)
                      ),
                      color: AppTheme.allInColor
                  )
              ),
              SizedBox(width: 2.0.h),
              ReusableText(
                text: ' All in',
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
              ),

              SizedBox(width: 5.0.w),

            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
      ],
    ),
  );
}

class RankPairSelectGridItem extends StatelessWidget {
  const RankPairSelectGridItem({
    required this.rankPairsPart,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final RankPair rankPairsPart;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => DecoratedBox(
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.allInColor
              : AppTheme.pcFoldColor,

        ),
        child: Center(
          child:
          ReusableText(
            text: "${rankChars[rankPairsPart.high]}${rankChars[rankPairsPart.kicker]}${rankPairsPart.isPocketPair ? "" : rankPairsPart.isSuited ? "s" : "o"}",
            textColor: isSelected
                ? Colors.white : Colors.grey[700],
            fontWeight: isSelected
                ?FontWeight.w700 :FontWeight.w500,
            fontSize: constraints.maxWidth / 2.6,
          ),

        ),
      ),
    );
    //Todo : 여기일단보자 여기가핵심같
  }
}
