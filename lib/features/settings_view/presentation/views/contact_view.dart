import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/app_widgets/custom_arrow_back.dart';
import 'package:sala_app/core/app_widgets/custom_title_appbar.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/contact_cubit/contact_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/contact_view_body.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit()..getContactData(),
      child: BlocConsumer<ContactCubit, ContactState>(
        builder: (context, state) {
          var contactCubit = ContactCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: CustomTitleAppBar(title: 'Contact Us'),
                centerTitle: true,
                leading: CustomArrowBack(),
              ),
              body: ConditionalBuilder(
                condition: contactCubit.contactModel != null,
                builder: (context) => ContactViewBody(),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              ));
        },
        listener: (context, state) {},
      ),
    );
  }
}
