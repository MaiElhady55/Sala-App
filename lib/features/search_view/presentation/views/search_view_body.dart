import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/features/search_view/presentation/view_models/cubit/search_cubit.dart';
import 'package:sala_app/features/search_view/presentation/views/widgets/build_list_item.dart';

class SearchViewBody extends StatelessWidget {
  final SearchState state;
  TextEditingController searchController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  SearchViewBody({super.key, required this.state});
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: searchController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Some Text to Search';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (String text) {
                    if (formkey.currentState!.validate()) {
                      SearchCubit.get(context).getSearh(searchText: text);
                    }
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Color(0xFF8D8E98),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.kPrimaryColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF8D8E98)),
                    ),
                    labelText: 'Search',
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.bodyText2,
                    labelStyle: TextStyle(color: AppColors.kPrimaryColor),
                    prefixIcon:
                        Icon(Icons.search, color: AppColors.kPrimaryColor),
                    border: OutlineInputBorder(),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            if (state is SearchLoading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: LinearProgressIndicator(),
              ),
            if (state is SearchSuccess)
              Expanded(
                  child: ConditionalBuilder(
                condition: state is! SearchLoading,
                builder: (context) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BuildListItem(
                        productSearch: SearchCubit.get(context)
                            .searchModel!
                            .data!
                            .productData![index],
                      );
                    },
                    itemCount: SearchCubit.get(context)
                        .searchModel!
                        .data!
                        .productData!
                        .length,
                  );
                },
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ))
          ],
        ));
  }
}
