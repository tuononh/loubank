import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loubank/constants/image_assets.dart';
import 'package:loubank/constants/colors.dart';
import 'package:loubank/constants/dimens.dart';
import 'package:loubank/constants/theme.dart';
import 'package:loubank/pages/home/home.dart';
import 'package:loubank/redux/app_epic.dart';
import 'package:loubank/redux/app_state.dart';
import 'package:loubank/redux/app_reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'dart:ui';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [EpicMiddleware<AppState>(appEpic())]);

  runApp(LouApp(store: store));
}

class LouApp extends StatelessWidget {
  final Store<AppState> store;

  LouApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: louTheme,
        title: 'LouBank',
        home: MainWidget(),
      ),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;

  List<ScreenItem> _screens = [
    ScreenItem(
      screenWidget: HomePage(),
      bottomIcon: Image.asset(ImageAssets.ICON_HOME),
    ),
    ScreenItem(
      screenWidget: Container(),
      bottomIcon: Image.asset(ImageAssets.ICON_BAG),
    ),
    ScreenItem(
      screenWidget: Container(),
      bottomIcon: Image.asset(ImageAssets.ICON_CARD),
    ),
    ScreenItem(
      screenWidget: Container(),
      bottomIcon: Image.asset(ImageAssets.ICON_CHAT),
    ),
    ScreenItem(
      screenWidget: Container(),
      bottomIcon: Image.asset(ImageAssets.ICON_TIME),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: LouColors.screen_bg),
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(ImageAssets.BG_DECOR_1),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(),
              ),
              Image.asset(ImageAssets.BG_DECOR_2),
            ],
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              _screens.elementAt(_selectedIndex).screenWidget,
              Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    height: LouDimens.bottom_bar_border_radius,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(LouDimens.bottom_bar_border_radius),
                        topRight:
                            Radius.circular(LouDimens.bottom_bar_border_radius),
                      ),
                      color: LouColors.bottombar_bg,
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: _buildBottomBar(),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.only(top: 6, left: 35, right: 35),
      height: 63,
      decoration: BoxDecoration(
        color: LouColors.bottombar_bg,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _screens.map((s) {
          return Container(
            child: s.bottomIcon,
          );
        }).toList(),
      ),
    );
  }
}

class ScreenItem {
  Widget screenWidget;
  Widget bottomIcon;

  ScreenItem({required this.screenWidget, required this.bottomIcon});
}
