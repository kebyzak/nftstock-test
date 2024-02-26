import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nft_stock_app/presentation/widgets/app_navbar.dart';

@RoutePage()
class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trade Page'),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (index) {
              case 0:
                AutoRouter.of(context).replaceNamed('/markets');
                break;
              case 1:
                AutoRouter.of(context).replaceNamed('/trade');
                break;
              case 2:
                AutoRouter.of(context).replaceNamed('/portfolio');
                break;
              case 3:
                AutoRouter.of(context).replaceNamed('/account');
                break;
            }
          });
        },
      ),
    );
  }
}
