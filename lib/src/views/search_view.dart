import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routeam/src/views/favorites_view.dart';
//utils
import '../utils/utils.dart';
//blocs
import '../bloc/blocs.dart';

import './results_view.dart';


class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // НЕ ИСПОЛЬЗОВАЛ ФОРМУ ДЛЯ ТОГО, ЧТОБЫ ВЫВОДИТЬ СВОЙ ФЛЭШБАР
    bool validate() {
      if (_searchController.text.isEmpty) {
        RFlushbars.showErrorFlushbar(context, title: 'Error', message: 'This field cant be empty');
        return false;
      }
      return true;
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<FavoriteBloc>(context).add(const FavoriteGetEvent());
              Navigator.push(context, MaterialPageRoute(
                builder: (ctx) => const FavoritesView()));
            },
            icon: const Icon(Icons.favorite_border),
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            shadowColor: MaterialStateProperty.all<Color>(RColors.rPrimary),
            minimumSize: MaterialStateProperty.all<Size>(const Size(60, 60)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(20)),
            shape: MaterialStateProperty.all<CircleBorder>(const CircleBorder())
        ),
        onPressed: () {
          if (validate()) {
            BlocProvider.of<SearchBloc>(context).add(SearchRequested(_searchController.text));
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => const ResultsView()));
          }
        },
        child: const Icon(Icons.search, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            maxLines: 1,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            cursorColor: RColors.rPrimary,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.only(
                    top: 12,
                    bottom: 12,
                    left: 18),
                hintText: "GitHub repository name ...",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
            ),
            onSubmitted: (s) {
              if (validate()) {
                BlocProvider.of<SearchBloc>(context).add(SearchRequested(_searchController.text));
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const ResultsView()));
              }
            },
          ),
        ),
      ),
    );
  }
}