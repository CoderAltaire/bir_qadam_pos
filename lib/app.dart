import 'package:bir_qadam_pos/bloc/bloc.dart';
import 'package:bir_qadam_pos/hive_helper/hive_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/core.dart';
import 'provider/ordering_provider.dart';
import 'screens/auth_screen/auth_screen.dart';
import 'screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428.0, 927.0),
        builder: (context, w) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => OrderingProvider()),
              ],
              builder: (context, child) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (_) => OpenSessionBloc()),
                    BlocProvider(create: (_) => CloseSessionBloc()),
                    BlocProvider(create: (_) => GetBranchBloc()),
                    BlocProvider(create: (_) => GetWerehouseBloc()),
                    BlocProvider(create: (_) => GetOrdersBloc()),
                    BlocProvider(create: (_) => CloseOrderBloc()),
                    BlocProvider(create: (_) => GetOrdersWithIdBloc()),
                    BlocProvider(create: (_) => ClientBloc({}, 1, 1)),
                    BlocProvider(create: (_) => AddSearchingProductsBloc()),
                  ],
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Tiin Loyalty',
                    theme: AppTheme.style(),
                    // localizationsDelegates: context.localizationDelegates,
                    // supportedLocales: context.supportedLocales,
                    // locale: context.locale,
                    // navigatorKey: AppNavigator.navigatorKey,
                    // initialRoute: getInitialRoute(),
                    // onGenerateRoute: AppRouter.onGenerateRoute,
                    // builder: (context, child) => MediaQuery(
                    //   data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    //   child: child ?? const SizedBox(),
                    // ),
                    // home: const LockedScreen(),
                    home: AppPrefs.token != ""
                        ? const HomeScreen()
                        : const AuthentificationScreen(),
                  ),
                );
              },
            ));
  }
}
