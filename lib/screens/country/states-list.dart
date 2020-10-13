import 'package:covid19/components/card-component.dart';
import 'package:covid19/components/kgp-card-title.dart';
import 'package:covid19/components/kgp-stats-with-title.dart';
import 'package:covid19/hooks/page.controller.hook.dart';
import 'package:covid19/models/usstates-model.dart';
import 'package:covid19/themes/color-theme.dart';
import 'package:covid19/utils/timetodate.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';

class StatesList extends HookWidget {
  final List<UsStates> data;
  const StatesList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final _pageIndex = useState(0);
    final _pageController = usePageController(initialPage: _pageIndex.value);

    void onPageChange(int index) => _pageIndex.value = index;

    void onTapIcon(int index) => _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.linear,
        );

    return Container(
      child: Column(
        children: [
          Container(height: 50),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _pageIndex.value != 0
                    ? IconButton(
                        icon: Icon(Ionicons.ios_arrow_back),
                        onPressed: () => onTapIcon(_pageIndex.value - 1),
                      )
                    : Container(width: 49),
                Text(
                  'U.S. States',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                _pageIndex.value != data.length - 1
                    ? IconButton(
                        icon: Icon(Ionicons.ios_arrow_forward),
                        onPressed: () => onTapIcon(_pageIndex.value + 1),
                      )
                    : Container(width: 49),
              ],
            ),
          ),
          Container(
            height: 580,
            width: double.infinity,
            child: PageView.builder(
              pageSnapping: false,
              controller: _pageController,
              onPageChanged: onPageChange,
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int i) {
                final String date = TimeToDate.use(data[i].updated);
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CardComponent(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            KgpCardTitle(
                              title: data[i].state,
                              subtitle: 'Updates as of $date',
                            ),
                            Container(
                              width: 300,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: KgpStatsWithTitle(
                                      title: 'Cases',
                                      amount: data[i].cases,
                                      amountFontSize: 20,
                                      titleFontSize: 15,
                                      titlecolor: ColorTheme.cases,
                                    ),
                                  ),
                                  Expanded(
                                    child: KgpStatsWithTitle(
                                      title: 'Deaths',
                                      amount: data[i].deaths,
                                      amountFontSize: 20,
                                      titleFontSize: 15,
                                      titlecolor: ColorTheme.deaths,
                                    ),
                                  ),
                                  Expanded(
                                    child: KgpStatsWithTitle(
                                      title: 'Recovered',
                                      amount: data[i].recovered,
                                      amountFontSize: 20,
                                      titleFontSize: 15,
                                      titlecolor: ColorTheme.recovered,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CardComponent(
                                    padding: const EdgeInsets.all(20),
                                    child: KgpStatsWithTitle(
                                      flip: true,
                                      title: 'Active',
                                      amount: data[i].active,
                                      titleFontSize: 18,
                                      amountFontSize: 15,
                                      titlecolor: theme.accentColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: CardComponent(
                                    padding: const EdgeInsets.all(20),
                                    child: KgpStatsWithTitle(
                                      flip: true,
                                      title: 'Population',
                                      amount: data[i].population,
                                      titleFontSize: 18,
                                      amountFontSize: 15,
                                      titlecolor: theme.accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CardComponent(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          child: Column(
                            children: [
                              KgpCardTitle(
                                title: 'Today',
                                subtitle: 'Updates as of $date',
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: KgpStatsWithTitle(
                                        title: 'Cases',
                                        amount: data[i].todayCases,
                                        amountFontSize: 20,
                                        titleFontSize: 15,
                                        titlecolor: ColorTheme.cases,
                                      ),
                                    ),
                                    Expanded(
                                      child: KgpStatsWithTitle(
                                        title: 'Deaths',
                                        amount: data[i].todayDeaths,
                                        amountFontSize: 20,
                                        titleFontSize: 15,
                                        titlecolor: ColorTheme.deaths,
                                      ),
                                    ),
                                    Expanded(
                                      child: KgpStatsWithTitle(
                                        title: 'Test Done',
                                        amount: data[i].tests,
                                        amountFontSize: 20,
                                        titleFontSize: 15,
                                        titlecolor: ColorTheme.recovered,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
