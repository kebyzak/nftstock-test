import 'package:nft_stock_app/domain/entities/asset.dart';
import 'package:nft_stock_app/domain/repositories/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  @override
  Future<List<Asset>> getAssets() async {
    return [
      Asset(
        name: 'Tether',
        tag: 'USDT',
        price: 0.92761,
        iconUrl: 'assets/images/tether.svg',
      ),
      Asset(
        name: 'Bitcoin',
        tag: 'BTC',
        price: 27448.70,
        iconUrl: 'assets/images/bitcoin.svg',
      ),
      Asset(
        name: 'Ethereum',
        tag: 'ETH',
        price: 1448.50,
        iconUrl: 'assets/images/ethereum.svg',
      ),
      Asset(
        name: 'S&P500',
        tag: 'GSPC',
        price: 125.4,
        iconUrl: 'assets/images/sp.svg',
      ),
      Asset(
        name: 'APPLE',
        tag: 'AAPL',
        price: 1021.40,
        iconUrl: 'assets/images/apple.svg',
      ),
    ];
  }
}
