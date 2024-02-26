part of 'assets_bloc.dart';

@freezed
class AssetsEvent with _$AssetsEvent {
  const factory AssetsEvent.fetchAssets() = FetchAssets;
  const factory AssetsEvent.toggleFavorite(Asset asset) = ToggleFavorite;
}
