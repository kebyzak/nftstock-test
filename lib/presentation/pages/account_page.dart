import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nft_stock_app/presentation/widgets/app_navbar.dart';

@RoutePage()
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page'),
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
