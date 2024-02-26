part of 'assets_bloc.dart';

@freezed
class AssetsState with _$AssetsState {
  const factory AssetsState.initial() = Initial;
  const factory AssetsState.loading() = Loading;
  const factory AssetsState.success(List<Asset> assets) = Success;
  const factory AssetsState.error() = Error;
}
