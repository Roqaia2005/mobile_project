import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_final_project/core/utils/assets_data.dart';
import 'package:mobile_final_project/features/search/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:mobile_final_project/features/search/presentation/widgets/noResultBody.dart';
import 'package:mobile_final_project/features/search/presentation/widgets/searchingBody.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  void _handleSearch() {
    if (_controller.text.trim().isNotEmpty) {
      final getResult = BlocProvider.of<SearchCubit>(context);
      getResult.getResult();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchLoading) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SearchingBody()),
          );
        } else if (state is SearchFailure) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NoResultBody()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff576CD6), Color(0xff2B3C60)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SingleChildScrollView(
              // padding: const EdgeInsets.all(32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsData().search),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(500),
                          bottomRight: Radius.circular(500),
                        ),
                      ),
                      height: 230,
                      width: double.infinity,
                    ),
                    // AnimatedContainer(
                    //   duration: const Duration(milliseconds: 500),
                    //   curve: Curves.easeInOut,
                    //   child: Image.asset(
                    //     width: 200,
                    //     height: 200,
                    //   ),
                    // ),
                    const SizedBox(height: 20),

                    const Text(
                      "Looking for some product?\nSearch for it now!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Amaranth-Regular",
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Padding(
                      padding: const EdgeInsets.all(32),

                      child: TextField(
                        controller: _controller,
                        onSubmitted: (_) => _handleSearch(),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white10,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 16,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: _handleSearch,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white54),
                          ),
                          hintText: "What are you looking for?",
                          hintStyle: const TextStyle(color: Color(0xffBFD3F2)),
                          labelText: "Search",
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
