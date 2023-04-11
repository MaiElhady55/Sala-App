import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/contact_cubit/contact_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/contact_view_list_item.dart';

class ContactViewBody extends StatelessWidget {
  const ContactViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = SizeConfig.height(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height*0.055,
              ),
              SizedBox(
                height: height,
                child: ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ContactViewListItem(
                        contactDataModel: ContactCubit.get(context).contactModel!.data!.data![index],index: index,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: height*0.027,
                        ),
                    itemCount: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
