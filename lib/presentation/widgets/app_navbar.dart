import 'package:flutter/material.dart';
import 'package:nft_stock_app/generated/l10n.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF4C50CF),
      unselectedItemColor: const Color(0xFFC3C3C3),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: S.of(context).markets,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.local_mall),
          label: S.of(context).trade,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_balance_wallet),
          label: S.of(context).portfolio,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          label: S.of(context).account,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
