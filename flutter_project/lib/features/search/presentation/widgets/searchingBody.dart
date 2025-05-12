import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/core/utils/assets_data.dart';
import 'package:mobile_final_project/core/widgets/back_arrow_icon_button.dart';
import 'package:mobile_final_project/core/widgets/custom_app_bar.dart';
import 'package:mobile_final_project/core/widgets/grid_view_products.dart';
import 'package:mobile_final_project/features/search/view_model/cubits/search_cubit/search_cubit.dart';

class SearchingBody extends StatelessWidget {
  const SearchingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Scaffold(
            backgroundColor: Color(0xff576CD6),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Image(image: AssetImage(AssetsData().searching))],
                ),
              ),
            ),
          );
        } else if (state is SearchSuccess) {
          final filteredProducts = state.filteredProducts;
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Search',
              leading: BackArrowIconButton(),
              isSearch: true,
            ),
            backgroundColor: Color(0xff576CD6),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: GridViewProducts(products: filteredProducts),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
