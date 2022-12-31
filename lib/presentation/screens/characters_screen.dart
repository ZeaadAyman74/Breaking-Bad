import 'package:breaking_bad/core/constants/colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/presentation/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../business_logic/characters_cubit/characters_cubit.dart';
import '../widgets/search_text_field.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  // void _fetchAllCharacters() async {
  //   await CharactersCubit.get(context).getAllCharacters();
  // }

  @override
  void initState() {
    CharactersCubit.get(context)
        .pagingController
        .addPageRequestListener((pageKey) {
      CharactersCubit.get(context).fetchPage(pageKey);
    });
    super.initState();
  }

  PreferredSizeWidget defaultAppBar(BuildContext context) {
    var cubit = CharactersCubit.get(context);
    return AppBar(
      backgroundColor: MyColors.myYellow,
      title: Text(
        "Characters",
        style: TextStyle(color: MyColors.myGrey, fontSize: 20.sp),
      ),
      actions: [
        IconButton(
            onPressed: () {
              cubit.startSearching();
              ModalRoute.of(context)!
                  .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
                cubit.clearSearchText();
                cubit.stopSearching();
              }));
            },
            icon: const Icon(
              Icons.search,
              color: MyColors.myGrey,
            ))
      ],
    );
  }

  PreferredSizeWidget searchAppBar(BuildContext context) {
    var cubit = CharactersCubit.get(context);
    return AppBar(
        backgroundColor: MyColors.myYellow,
        title: const SearchTextField(),
        actions: [
          IconButton(
              onPressed: () {
                cubit.clearSearchText();
              },
              icon: const Icon(
                Icons.clear,
                color: MyColors.myGrey,
              ))
        ],
        leading: const BackButton(
          color: MyColors.myGrey,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var cubit = CharactersCubit.get(context);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      appBar:
          cubit.isSearching ? searchAppBar(context) : defaultAppBar(context),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        buildWhen: (previous, current) => (current is SearchingState),
        builder: (context, state) {
          if (cubit.searchController.text.isEmpty) {
            return RefreshIndicator(
              onRefresh: () =>
                  Future.sync(() => cubit.pagingController.refresh()),
              child: PagedGridView<int, CharactersModel>(
                cacheExtent: 500,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                pagingController: cubit.pagingController,
                builderDelegate: PagedChildBuilderDelegate<CharactersModel>(
                    itemBuilder: (context, item, index) => GridItem(
                          character: item,
                        ),
                    firstPageProgressIndicatorBuilder: (_) => const Center(
                        child:
                            CircularProgressIndicator(color: MyColors.myWhite)),
                    firstPageErrorIndicatorBuilder: (context) {
                      cubit.pagingController.refresh();
                      return Center(
                          child: Text('${cubit.pagingController.error}'));
                    },
                    newPageProgressIndicatorBuilder: (_) => const Center(
                          child: CircularProgressIndicator(
                            color: MyColors.myYellow,
                          ),
                        )),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: cubit.searchedCharacters.length,
              itemBuilder: (BuildContext context, int index) {
                return GridItem(character: cubit.searchedCharacters[index]);
              },
            );
          }
        },
      ),
    );
  }

}
