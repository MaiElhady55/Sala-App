import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/features/search_view/presentation/view_models/cubit/search_cubit.dart';
import 'package:sala_app/features/search_view/presentation/views/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: CustomTitleAppBar(title: 'Search'),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: CustomArrowBack(),
              ),
              
              body: SearchViewBody(
                state: state,
              ),
              
            );
            
          },
          listener: (context, state) {},
        ));
  }
}
