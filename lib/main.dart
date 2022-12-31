import 'package:breaking_bad/core/network/remote/dio_helper.dart';
import 'package:breaking_bad/core/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/services/sercives_locator.dart';
import 'cubit_observer.dart';

void main() {

  DioHelper.init();
  ServicesLocator().init();
  BlocOverrides.runZoned(() => runApp(MyApp(appRouter: sl<AppRouter>())),
      blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.appRouter}) : super(key: key);

  AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
