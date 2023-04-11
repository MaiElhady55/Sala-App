import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/core/utils/app_colors.dart';
import 'package:sala_app/core/utils/size_config.dart';
import 'package:sala_app/features/settings_view/data/models/contact/contact.data.model.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/custom_arrow.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/custom_list_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactViewListItem extends StatelessWidget {
  final ContactDataModel contactDataModel;
  final int index;

  const ContactViewListItem(
      {super.key, required this.contactDataModel, required this.index});

  launchURL(String url) async {
    url = Uri.encodeFull(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Unknown error, can\'t launch the URL.';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> websiteTitle = [
      'Facebook',
      'Instigram',
      'Twitter',
      'Gmail',
      'Phone'
    ];
    var width = SizeConfig.width(context);
    var height = SizeConfig.height(context);
    return InkWell(
      onTap: () async {
        await launchURL(contactDataModel.value!);
      },// navigateTo(context: context,router: WebSiteView(webLink: contactDataModel.value!)),
      child: CustomListTile(
          title: websiteTitle[index],
          borderColor: Colors.grey[300]!,
          height: 70,
          trailingWidget: CustomArrow(),
          count: 1,
          widget: Image(
              image: NetworkImage(
                contactDataModel.image!,
              ),
              color: AppColors.kPrimaryColor,
              width: width * 0.11,
              height: height * 0.11)),
    );
  }
}
