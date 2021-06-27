import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:loubank/common_wigdets/utility_item.dart';
import 'package:loubank/constants/colors.dart';
import 'package:loubank/constants/dimens.dart';
import 'package:loubank/constants/image_assets.dart';
import 'package:loubank/helpers/currency.dart';
import 'package:loubank/localization/language_manager.dart';
import 'package:loubank/pages/home/additional_info_widget.dart';
import 'package:loubank/pages/home/card_list_widget.dart';
import 'package:loubank/pages/home/home_viewmodel.dart';
import 'package:loubank/redux/actions/card_actions.dart';
import 'package:loubank/redux/actions/currency_actions.dart';
import 'package:loubank/redux/actions/loan_actions.dart';
import 'package:loubank/redux/app_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      onInit: (store) {
        store.dispatch(GetCardListAction());
        store.dispatch(GetLoanListAction());
        store.dispatch(GetCurrencyListAction());
      },
      converter: (store) => HomeViewModel.convertFromStore(store),
      builder: (context, viewModel) {
        return SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildMainContent(viewModel)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: LouDimens.horizon_padding_normal),
      height: LouDimens.navbar_height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 4),
            child: Image.asset(ImageAssets.ICON_AVATAR),
          ),
          Container(
            padding: EdgeInsets.only(top: 11),
            child: Image.asset(ImageAssets.LOGO),
          ),
          Opacity(
            opacity: 0,
            child: Image.asset(ImageAssets.ICON_AVATAR),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(HomeViewModel viewModel) {
    return ListView(
      children: [
        _buildBalance(viewModel),
        SizedBox(
          height: 28,
        ),
        CardListWidget(cardList: viewModel.cardList),
        Container(
          padding: EdgeInsets.only(
            top: 39.0,
            bottom: 12.0,
            left: LouDimens.horizon_padding_screen,
          ),
          child: Text(
            locale.language.finance.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              height: 14 / 10,
              fontWeight: FontWeight.w500,
              color: LouColors.white,
            ),
          ),
        ),
        _buildUtilities(),
        SizedBox(
          height: 36,
        ),
        AdditionalInfoWidget(
          loanList: viewModel.loanList,
          currencyList: viewModel.currencyList,
          metalList: viewModel.metalList,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _buildBalance(HomeViewModel viewModel) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: LouDimens.horizon_padding_screen),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.language.your_balance,
                  style: TextStyle(
                    fontSize: LouDimens.font_size_normal,
                    color: LouColors.white,
                    fontWeight: FontWeight.w400,
                    height: 18 / LouDimens.font_size_normal,
                  ),
                ),
                Text(
                  CurrencyHelper.formatDisplay(
                      viewModel.currency, viewModel.balance),
                  style: TextStyle(
                    fontSize: LouDimens.font_size_big,
                    color: LouColors.white,
                    fontWeight: FontWeight.w700,
                    height: 32 / LouDimens.font_size_big,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 49),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: 32,
                height: 32,
                padding: EdgeInsets.zero,
                decoration: ShapeDecoration(
                  color: LouColors.search_button_bg,
                  shape: CircleBorder(),
                ),
                child: Image.asset(ImageAssets.ICON_SEARCH),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUtilities() {
    List<UtilityItem> itemList = [
      UtilityItem(
          title: locale.language.my_bonuses,
          iconBgColor: Color(0xFFF2FE8D),
          iconPath: ImageAssets.ICON_STAR),
      UtilityItem(
          title: locale.language.my_budget,
          iconBgColor: Color(0xFFB2D0CE),
          iconPath: ImageAssets.ICON_WALLET),
      UtilityItem(
          title: locale.language.finance_analysis,
          iconBgColor: Color(0xFFAA9EB7),
          iconPath: ImageAssets.ICON_CHART),
      UtilityItem(
          title: locale.language.finance_analysis,
          iconBgColor: Color(0xFFF2FE8D),
          iconPath: ImageAssets.ICON_CHART),
    ];

    List<UtilityItemWidget> items =
        itemList.map((itm) => UtilityItemWidget(item: itm)).toList();

    return Container(
      height: LouDimens.utility_item_height,
      child: ListView(
        padding: EdgeInsets.only(left: LouDimens.horizon_padding_screen),
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }
}
