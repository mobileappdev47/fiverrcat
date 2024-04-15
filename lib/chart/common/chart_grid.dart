import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:poker/poker.dart";
import 'package:pokercat/chart/common/tourna_chart_brain.dart';

import '../../global/component/reusable_text.dart';
import '../../imports.dart';
import '../constarants/card.dart';
import 'progress_info_model.dart';

class ChartGrid extends StatefulWidget {
  ChartGrid({Key? key, this.value = const {}, required this.painting})
      : super(key: key);

  final Set<RankPair> value;
  Map<String, ProgressInfo> painting;

  @override
  State<ChartGrid> createState() => _ChartGridState();
}

class _ChartGridState extends State<ChartGrid> {
  RankPair? lastChangedPart;



  int callPercentt = 0;

  int raisePercentt = 0;
  int allinPercentt = 0;

  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: EdgeInsets.all(6.w),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Expanded(
                  flex: 12,
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: LayoutBuilder(
                      builder: (context, constraints) => Column(
                        children: List.generate(Rank.values.length * 2 - 1, (i) {
                          if (i % 2 == 1) return const SizedBox(height: 2);
                          final x = i ~/ 2;
                          return Expanded(
                            child: Row(
                              children:
                                  List.generate(Rank.values.length * 2 - 1, (j) {
                                if (j % 2 == 1) return const SizedBox(width: 2);
                                final y = j ~/ 2;
                                final rankPairsPart = y > x
                                    ? RankPair.suited(
                                        high: ranksInStrongnessOrder[x],
                                        kicker: ranksInStrongnessOrder[y],
                                      )
                                    : RankPair.ofsuit(
                                        high: ranksInStrongnessOrder[y],
                                        kicker: ranksInStrongnessOrder[x],
                                      );
                                xyToCard()['$x,$y'];
                                return Expanded(
                                  child: GestureDetector(
                                    child: ChartGridItem(
                                      rankPairsPart: rankPairsPart,
                                      progressInfo: widget.painting[xyToCard()['$x,$y']]
                                          ?? const ProgressInfo(
                                              raiseP: 0.0,
                                              callP: 0.0,
                                              alreadyP: 0.0,
                                              allinP: 0.0),
                                    ),
                                    onTap: () {



                                      setState(() {


                                        //
                                        double alreadyP = widget.painting[xyToCard()['$x,$y']]?.alreadyP??0.0;
                                        double allinP = widget.painting[xyToCard()['$x,$y']]?.allinP??0.0*(1-alreadyP);
                                        double raiseP = widget.painting[xyToCard()['$x,$y']]?.raiseP??0.0*(1-alreadyP);
                                        double callP = widget.painting[xyToCard()['$x,$y']]?.callP??0.0*(1-alreadyP);

                                        //ㅇㅣ건 전체 셀의 퍼센트를 나타낸거
                                        double alreadyPercent = alreadyP*100;
                                        double allinPercent = allinP*100;
                                        double raisePercent = raiseP*100;
                                        double callPercent = callP*100;
                                        //이건 alreadyP를 빼고 난 다음의 소수점값.

                                        double alreadyP2 = widget.painting[xyToCard()['$x,$y']]?.alreadyP??0.0;
                                        double allinP2 = widget.painting[xyToCard()['$x,$y']]?.allinP??0.0;
                                        double raiseP2 = widget.painting[xyToCard()['$x,$y']]?.raiseP??0.0;
                                        double callP2 = widget.painting[xyToCard()['$x,$y']]?.callP??0.0;



                                        double noraise = 100-raisePercent;
                                        double nocall = 100-callPercent;
                                        print(
                                            '전체 : alreadyP=${alreadyPercent.toStringAsFixed(1)}'
                                                ', allinP=${allinPercent.toStringAsFixed(0)}'
                                                ', raiseP=${raisePercent.toStringAsFixed(0)}'
                                                ', callP=${callPercent.toStringAsFixed(0)}'
                                                ',레이즈안한영역(콜+올인) = ${noraise.toStringAsFixed(0)}'

                                                // '// already빼고 : already progress2=$alreadyP2'
                                                // ', allin2=$allinP2'
                                                // ', raise2=$raiseP2'
                                                // ', call2=$callP2'
                                                '///${xyToCard()['$x,$y']}'
                                        );
                                        callPercentt = callPercent.round().toInt();
                                        raisePercentt = raisePercent.round().toInt();
                                        allinPercentt = allinPercent.round().toInt();

                                      });

                                    },
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
                // SizedBox(
                //   height: 2.0,
                // ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(0.0, 1.h, 0.0,0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        // Text(
                        //   'raise: ${raisePercentt},call: ${callPercentt}',
                        //   style: TextStyle(
                        //       fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                        // ),
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
                          text: ' All-in',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                        SizedBox(
                          width: 42.sp,
                          child: ReusableText(
                            text: ' $allinPercentt%',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),

                        Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(3)
                                ),
                                color: AppTheme.raiseColor
                            )
                        ),
                        SizedBox(width: 2.0.h),
                        ReusableText(
                          text: ' Raise',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                        SizedBox(
                          width: 42.sp,
                          child: ReusableText(
                            text: ' $raisePercentt%',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),

                        Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(3)
                                ),
                                color: AppTheme.callColor
                            )
                        ),
                        SizedBox(width: 2.0.h),
                        ReusableText(
                          text: ' Call',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),

                        SizedBox(
                          width: 40.sp,
                          child: ReusableText(
                            text: ' $callPercentt%',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
              ],
            );
          }
        ),
      );
}

final TournaChartBrain tournaChartBrain = TournaChartBrain();

class ChartGridItem extends StatelessWidget {
  ProgressInfo? progressInfo;

  ChartGridItem({
    Key? key,
    required this.rankPairsPart,
    this.progressInfo,
  }) : super(key: key);

  // final Color backgroundColor = ZeplinColors.foldColor;
  final Color backgroundColor = AppTheme.pcFoldColor;
  final Color allInPColor = AppTheme.allInColor;
  final Color callPColor = AppTheme.callColor;
  // final Color raisePColor =  ZeplinColors.raiseColor;
  final Color raisePColor =  AppTheme.raiseColor;
  final Color alreadyPColor = AppTheme.alreadyPColor;
  final RankPair rankPairsPart;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Container(
              color: backgroundColor,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: constraints.maxWidth * (progressInfo!.alreadyP),
                color: alreadyPColor,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: constraints.maxWidth *
                    (progressInfo!.raiseP +
                        progressInfo!.allinP +
                        progressInfo!.callP) *
                    (1 - progressInfo!.alreadyP),
                color: callPColor,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: constraints.maxWidth *
                    (progressInfo!.raiseP +
                        progressInfo!.allinP) *
                    (1 - progressInfo!.alreadyP),
                color: raisePColor,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: constraints.maxWidth *
                    (progressInfo!.allinP) *
                    (1 - progressInfo!.alreadyP),
                color: allInPColor,
              ),
            ),
            Center(
              child: ReusableText(
                text: "${rankChars[rankPairsPart.high]}${rankChars[rankPairsPart.kicker]}${rankPairsPart.isPocketPair ? "" : rankPairsPart.isSuited ? "s" : "o"}",
                textColor: progressInfo!.raiseP == 0.0 && progressInfo!.callP == 0.0 && progressInfo!.alreadyP == 0.0 && progressInfo!.allinP == 0
                    ? Colors.grey[700]
                    : AppTheme.pcChartText,
                fontWeight: progressInfo!.raiseP == 0.0 && progressInfo!.callP == 0.0 && progressInfo!.alreadyP == 0.0 && progressInfo!.allinP == 0
                    ?FontWeight.w500:FontWeight.w700,
                fontSize: constraints.maxWidth / 2.6,
              ),
            ),

          ],
        ),
      ),
    );
    //Todo : 여기일단보자 여기가핵심같
  }
}
