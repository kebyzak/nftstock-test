import 'package:auto_route/auto_route.dart';
import 'package:nft_stock_app/presentation/pages/account_page.dart';
import 'package:nft_stock_app/presentation/pages/markets_page.dart';
import 'package:nft_stock_app/presentation/pages/portfolio_page.dart';
import 'package:nft_stock_app/presentation/pages/trade_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MarketsRoute.page, path: '/markets', initial: true),
        AutoRoute(page: TradeRoute.page, path: '/trade'),
        AutoRoute(page: PortfolioRoute.page, path: '/portfolio'),
        AutoRoute(page: AccountRoute.page, path: '/account'),
      ];
}
