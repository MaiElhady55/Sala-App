import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sala_app/core/network/local/cache_helper.dart';
import 'package:sala_app/core/network/remote/dio_helper.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/theme_cubit/themeapp_state.dart';
import 'package:sala_app/core/utils/theme.dart';
import 'package:sala_app/features/bottom_nav_views/presentation/view_models/bloc/bloc_observer.dart';
import 'package:sala_app/features/bottom_nav_views/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit_cubit.dart';
import 'package:sala_app/features/cart_view/presentation/view_models/get_cart_cubit/cart_cubit.dart';
import 'package:sala_app/features/categories_view/presentation/view_models/cubit/categoies_details_cubit.dart';
import 'package:sala_app/features/home_view/presentation/view_models/home_data_cubit/home_data_cubit.dart';
import 'package:sala_app/features/intro_view/presentation/views/splash_view.dart';
import 'package:sala_app/features/product_details_view/presentation/view_models/cubit/product_details_cubit.dart';
import 'package:sala_app/features/settings_view/presentation/view_models/profile_cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  dynamic isDark = CacheHelper.getData(key: 'isDark');
  

  //CacheHelper.removeData(key: 'token');
  //CacheHelper.removeData(key: 'onBoarding');

  BlocOverrides.runZoned(
    () {
    runApp(MyApp(
      isDark:isDark ?? false
    ));
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavBarCubit(),
          ),
          BlocProvider(
            create: (context) => HomeDataCubit()
              ..getHomeData()
              ..getCategoryData()
              ..getFavoritesData(),
          ),
          BlocProvider(
            create: (context) => CategoiesDetailsCubit(),
          ),
          BlocProvider(
            create: (context) =>
                CartCubit(ProductDetailsCubit())..getCartData(),
          ),
          BlocProvider(
            create: (context) => ProfileCubit()..getProfileData(),
          ),
          BlocProvider(
            create: (context) => ThemeappCubit()..changeAppMode(isDark),
          ),
        ],
        child: BlocConsumer<ThemeappCubit, ThemeAppState>(
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Sala App',
                theme: lightthemes..bottomNavigationBarTheme,
                darkTheme: darkthemes..bottomNavigationBarTheme,
                themeMode: ThemeappCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: SplashView());
          },
          listener: (context, state) {},
        ));
  }
}
