import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loubank/common_widgets/currency_price.dart';
import 'package:loubank/common_widgets/loan_item.dart';
import 'package:loubank/constants/colors.dart';
import 'package:loubank/constants/dimens.dart';
import 'package:loubank/constants/image_assets.dart';
import 'package:loubank/localization/language_manager.dart';
import 'package:loubank/redux/modals/currency_state.dart';
import 'package:loubank/redux/modals/loan_state.dart';

class AdditionalInfoWidget extends StatefulWidget {
  final List<Loan>? loanList;
  final List<Currency>? currencyList;
  final List<Currency>? metalList;

  AdditionalInfoWidget({
    this.loanList,
    this.currencyList,
    this.metalList,
  });

  @override
  State<StatefulWidget> createState() {
    return _AdditionalInfoWidgetState();
  }
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget>
    with TickerProviderStateMixin {
  late AnimationController loanPromoCollapseController;
  late Animation<double> loanPromoCollapseAnimation;

  late AnimationController loanListCollapseController;
  late Animation<double> loanListCollapseAnimation;
  late Animation<double> loanListHeaderCollapseAnimation;
  bool isLoanListCollapsed = false;

  late AnimationController currencyListCollapseController;
  late Animation<double> currencyListCollapseAnimation;
  late Animation<double> currencyListHeaderCollapseAnimation;
  bool isCurrencyListCollapsed = false;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  @override
  void dispose() {
    loanPromoCollapseController.dispose();
    loanListCollapseController.dispose();
    currencyListCollapseController.dispose();
    super.dispose();
  }

  void prepareAnimations() {
    loanPromoCollapseController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    loanPromoCollapseAnimation = CurvedAnimation(
      parent: loanPromoCollapseController,
      curve: Curves.easeInOutCirc,
    );
    loanPromoCollapseController.forward(from: 0);

    loanListCollapseController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    loanListCollapseAnimation = CurvedAnimation(
      parent: loanListCollapseController,
      curve: Curves.easeInOutCirc,
    );
    loanListHeaderCollapseAnimation =
        Tween<double>(begin: 0, end: 0.25).animate(CurvedAnimation(
      parent: loanListCollapseController,
      curve: Curves.easeInOutCirc,
    ));
    loanListCollapseController.forward(from: 0);

    currencyListCollapseController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    currencyListCollapseAnimation = CurvedAnimation(
      parent: currencyListCollapseController,
      curve: Curves.easeInOutCirc,
    );
    currencyListHeaderCollapseAnimation =
        Tween<double>(begin: 0, end: 0.25).animate(CurvedAnimation(
      parent: currencyListCollapseController,
      curve: Curves.easeInOutCirc,
    ));
    currencyListCollapseController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LouDimens.border_radius),
          color: LouColors.utility_bg),
      child: Column(
        children: [
          SizedBox(
            height: 28,
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(
                left: LouDimens.horizon_padding_normal,
                right: LouDimens.horizon_padding_normal,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotationTransition(
                    turns: loanListHeaderCollapseAnimation,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Image.asset(ImageAssets.ICON_CHEVRON_DOWN),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      locale.language.current_loans.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        height: 14 / 10,
                        fontWeight: FontWeight.w500,
                        color: LouColors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.zero,
                        decoration: ShapeDecoration(
                          color: LouColors.search_button_bg,
                          shape: CircleBorder(),
                        ),
                        child: Image.asset(ImageAssets.ICON_PLUS),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              HapticFeedback.mediumImpact();
              if (isLoanListCollapsed) {
                loanListCollapseController.forward(from: 0);
                setState(() {
                  isLoanListCollapsed = false;
                });
              } else {
                loanListCollapseController.reverse(from: 1);
                setState(() {
                  isLoanListCollapsed = true;
                });
              }
            },
          ),
          SizedBox(
            height: 13,
          ),
          _buildLoanList(),
          SizedBox(
            height: 36,
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(
                left: LouDimens.horizon_padding_normal,
                right: LouDimens.horizon_padding_normal,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotationTransition(
                    turns: currencyListHeaderCollapseAnimation,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Image.asset(ImageAssets.ICON_CHEVRON_DOWN),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Currencies and metals'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        height: 14 / 10,
                        fontWeight: FontWeight.w500,
                        color: LouColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              HapticFeedback.mediumImpact();
              if (isCurrencyListCollapsed) {
                currencyListCollapseController.forward(from: 0);
                setState(() {
                  isCurrencyListCollapsed = false;
                });
              } else {
                currencyListCollapseController.reverse(from: 1);
                setState(() {
                  isCurrencyListCollapsed = true;
                });
              }
            },
          ),
          SizedBox(
            height: 11,
          ),
          _buildCurrencyList(),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _buildLoanList() {
    List<LoanItemWidget> loanWidgetList = [];
    List<Loan>? _loanList = widget.loanList;

    if (_loanList != null) {
      loanWidgetList = _loanList.map((l) => LoanItemWidget(loan: l)).toList();
    }

    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: loanListCollapseAnimation,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: LouDimens.horizon_padding_screen),
        child: Column(
          children: [
            ...loanWidgetList,
            _buildLoanPromo(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoanPromo() {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: loanPromoCollapseAnimation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: LouColors.card_bg_gradients[0],
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: LouDimens.horizon_padding_screen, vertical: 22),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Color(0xFF242727),
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset(ImageAssets.ICON_LIGHTNING),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start investing now!',
                          style: TextStyle(
                            fontSize: LouDimens.font_size_normal,
                            color: Color(0xFF262626),
                            fontWeight: FontWeight.w600,
                            height: 18 / LouDimens.font_size_normal,
                          ),
                        ),
                        Text(
                          'Protected savings and investment plans',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: LouDimens.font_size_small,
                            height: LouDimens.font_height_small,
                            color: Color(0xFF262626),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                    child: Image.asset(ImageAssets.ICON_CLOSE),
                  ),
                  onTap: () {
                    loanPromoCollapseController.reverse(from: 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyList() {
    Widget currencyListWidget = Container();
    Widget metalListWidget = Container();
    List<Currency>? _currencyList = widget.currencyList;
    List<Currency>? _metalList = widget.metalList;

    if (_currencyList != null) {
      currencyListWidget = CurrencyItemWidget(
        currencyList: _currencyList,
        title: 'Currencies',
      );
    }

    if (_metalList != null) {
      metalListWidget = CurrencyItemWidget(
        currencyList: _metalList,
        title: 'Metals',
      );
    }

    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: currencyListCollapseAnimation,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: LouDimens.horizon_padding_screen),
        child: Column(
          children: [
            currencyListWidget,
            metalListWidget,
          ],
        ),
      ),
    );
  }
}
