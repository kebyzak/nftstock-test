import 'package:nft_stock_app/domain/entities/asset.dart';

abstract class AssetRepository {
  Future<List<Asset>> getAssets();
}
