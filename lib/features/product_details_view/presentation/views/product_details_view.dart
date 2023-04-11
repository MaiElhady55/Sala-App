import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/features/product_details_view/presentation/view_models/cubit/product_details_cubit.dart';
import 'package:sala_app/features/product_details_view/presentation/views/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  final int productId;

  const ProductDetailsView({super.key, required this.productId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit()..getProductDetails(id: productId),
      child: BlocConsumer<ProductDetailsCubit,ProductDetailsState>(
        builder: (context, state) {
          var productDCubit = ProductDetailsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: CustomTitleAppBar(title: 'Product Details'),
                centerTitle: true,
                leading: CustomArrowBack(),
              ),
              body: ConditionalBuilder(
                condition: productDCubit.productDetailsmodel!=null,
                fallback: (context) => Center(child: CircularProgressIndicator(),),
                builder:(context) =>  ProductDetailsViewBody(
                  productDetailsmodel: productDCubit.productDetailsmodel!,
                ),
              ));
        },
        listener: (context, state) {},
      ),
    );
  }
}
