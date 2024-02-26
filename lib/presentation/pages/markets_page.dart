// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_stock_app/data/repositories/asset_repository_impl.dart';
import 'package:nft_stock_app/generated/l10n.dart';
import 'package:nft_stock_app/presentation/blocs/assets_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nft_stock_app/presentation/widgets/app_navbar.dart';
import 'package:toggle_switch/toggle_switch.dart';

@RoutePage()
class MarketsPage extends StatefulWidget {
  const MarketsPage({super.key});

  @override
  _MarketsPageState createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage> {
  late bool _showFavoritesOnly;
  late TextEditingController _searchController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _showFavoritesOnly = false;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AssetsBloc(AssetRepositoryImpl())..add(const FetchAssets()),
      child: Scaffold(
        backgroundColor: const Color(0xFF4C50CF),
        appBar: AppBar(
          title: Text(
            S.of(context).markets,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF4C50CF),
        ),
        body: BlocBuilder<AssetsBloc, AssetsState>(
          builder: (context, state) {
            if (state is Initial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Success) {
              final assets = state.assets.where((asset) {
                final searchText = _searchController.text.toLowerCase();
                return asset.name.toLowerCase().contains(searchText) ||
                    asset.tag.toLowerCase().contains(searchText);
              }).toList();

              final filteredAssets = _showFavoritesOnly
                  ? assets.where((asset) => asset.isFavorite).toList()
                  : assets;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: S.of(context).search,
                        prefixIcon:
                            const Icon(Icons.search, color: Color(0xFFB0B0B0)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        hintStyle: const TextStyle(color: Color(0xFFB0B0B0)),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ToggleSwitch(
                      minWidth: 500,
                      initialLabelIndex: _showFavoritesOnly ? 1 : 0,
                      activeBgColor: const [Colors.white],
                      activeFgColor: const Color(0xFF4C50CF),
                      inactiveBgColor: const Color(0xFF4C50CF),
                      inactiveFgColor: Colors.white,
                      totalSwitches: 2,
                      icons: const [
                        Icons.line_axis_sharp,
                        Icons.star_border,
                      ],
                      labels: [S.of(context).all, S.of(context).favorites],
                      onToggle: (index) {
                        setState(() {
                          _showFavoritesOnly = index == 1;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 16),
                        itemCount: filteredAssets.length,
                        itemBuilder: (context, index) {
                          final asset = filteredAssets[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: ListTile(
                              leading: SvgPicture.asset(
                                asset.iconUrl,
                                width: 40,
                                height: 40,
                              ),
                              title: Text('${asset.name} (${asset.tag})'),
                              subtitle:
                                  Text('\$${asset.price.toStringAsFixed(2)}'),
                              trailing: IconButton(
                                  icon: Icon(
                                    asset.isFavorite
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: asset.isFavorite
                                        ? const Color(0xFFC3C3C3)
                                        : null,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<AssetsBloc>(context)
                                        .add(ToggleFavorite(asset));
                                    setState(() {});
                                  }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is Error) {
              return Center(
                child: Text(S.of(context).error),
              );
            } else {
              return Text(S.of(context).unexpectedState);
            }
          },
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
      ),
    );
  }
}
