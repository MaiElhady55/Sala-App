import 'package:sala_app/core/functions/navigation.dart';
import 'package:sala_app/core/network/local/cache_helper.dart';
import 'package:sala_app/features/auth_view/presentation/views/login_view.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'toket').then((value) {
    if (value) {
      navigateAndFinsh(context: context, router: LoginView());
    }
  });
}
