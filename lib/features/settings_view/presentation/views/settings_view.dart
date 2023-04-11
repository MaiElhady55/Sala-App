import 'package:flutter/material.dart';
import 'package:sala_app/features/settings_view/presentation/views/widgets/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsViewBody()
    );
  }
}