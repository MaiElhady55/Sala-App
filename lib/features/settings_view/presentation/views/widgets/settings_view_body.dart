import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sala_app/core/app_widgets/my_divider.dart';
import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/utils/styles.dart';
import 'package:sala_app/features/settings_view/presentation/views/about_view.dart';
import 'package:sala_app/features/settings_view/presentation/views/contact_view.dart';
import 'package:sala_app/features/settings_view/presentation/views/payment_view.dart';
import 'package:sala_app/features/settings_view/presentation/views/profile_view.dart';
import 'package:sala_app/features/settings_view/presentation/views/terms_view.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/custom_arrow.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/custom_drop_down.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/custom_list_tile.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/show_logout_dialog.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/switch_theme.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Setting',
              style: Styles.textStyle18.copyWith(
                color: Color(0xFF8D8E98),
              )),
          const SizedBox(height: 24),
          CustomListTile(
              title: 'Profile',
              fun: () => navigateTo(context: context, router: ProfileView()),
              borderColor: Colors.grey[200]!,
              leadingIcon: Icons.person,
              trailingWidget: CustomArrow()),
          const SizedBox(height: 24),
          CustomListTile(
              title: 'Payments',
              fun: () => navigateTo(context: context, router: PaymentView()),
              borderColor: Colors.grey[200]!,
              leadingIcon: Icons.payment,
              trailingWidget: CustomArrow()),
          SizedBox(height: 24),
          CustomListTile(
              title: 'Currency',
              borderColor: Colors.grey[200]!,
              leadingIcon: Icons.monetization_on_outlined,
              trailingWidget: CustomDropDwon()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: MyDivider(),
          ),
          Text('General Setting',
              style: Styles.textStyle18.copyWith(
                color: Color(0xFF8D8E98),
              )),
          SizedBox(height: 24),
          CustomListTile(
              title: 'Dark Mode',
              leadingIcon: Icons.brightness_2,
              borderColor: Colors.grey[200]!,
              trailingWidget:SwitchThemeMode()
              ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: MyDivider(),
          ),
          Text('Support',
              style: Styles.textStyle18.copyWith(
                color: Color(0xFF8D8E98),
              )),
          SizedBox(
            height: 24,
          ),
          CustomListTile(
              title: 'Contact US ',
              borderColor: Colors.grey[200]!,
              fun: () => navigateTo(context: context, router: ContactView()),
              leadingIcon: Icons.contact_phone_rounded,
              trailingWidget: CustomArrow()),
          SizedBox(
            height: 24,
          ),
          CustomListTile(
              title: 'About US ',
              borderColor: Colors.grey[200]!,
              fun: () => navigateTo(context: context, router: AboutView()),
              leadingIcon: Icons.info,
              trailingWidget: CustomArrow()),
          SizedBox(
            height: 24,
          ),
          CustomListTile(
              title: 'Terms of Service',
              borderColor: Colors.grey[200]!,
              fun: () => navigateTo(context: context, router: TermsView()),
              leadingIcon: Icons.sticky_note_2,
              trailingWidget: CustomArrow()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: MyDivider(),
          ),
          InkWell(
            onTap: () {
              showLogOutDialog(context);
            },
            child: CustomListTile(
                title: 'Log Out',
                borderColor: Colors.grey[200]!,
                leadingIcon: Icons.logout,
                trailingWidget: CustomArrow()),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    ));
  }
}
