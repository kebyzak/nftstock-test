import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nft_stock_app/data/repositories/asset_repository_impl.dart';
import 'package:nft_stock_app/domain/entities/asset.dart';

part 'assets_bloc.freezed.dart';
part 'assets_event.dart';
part 'assets_state.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final AssetRepositoryImpl _assetRepository;

  AssetsBloc(this._assetRepository) : super(const Initial()) {
    on<FetchAssets>((event, emit) async {
      emit(const AssetsState.loading());
      try {
        final assets = await _assetRepository.getAssets();
        emit(AssetsState.success(assets));
      } catch (e) {
        emit(const AssetsState.error());
      }
    });

    on<ToggleFavorite>((event, emit) async {
      final currentState = state;
      if (currentState is Success) {
        final updatedAssets = List<Asset>.from(currentState.assets);

        final index = updatedAssets.indexWhere((asset) => asset == event.asset);
        if (index != -1) {
          updatedAssets[index].isFavorite = !updatedAssets[index].isFavorite;
          emit(AssetsState.success(updatedAssets));
        }
      }
    });
  }
}
