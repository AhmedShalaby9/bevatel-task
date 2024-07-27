import 'package:after_layout/after_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'common/constants/app_theme.dart';
import 'common/helper/navigation/router.dart' as router;
import 'features/auth/data/repo_impl/user_repo_impl.dart';
import 'features/auth/presentation/viewmodel/bloc/auth_bloc.dart';
import 'features/onboarding/presentation/view/screens/splash_screen.dart';
import 'features/travels/data/repo_impl/travels_repo.dart';
import 'features/travels/presentation/viewmodel/travels_bloc.dart';
import 'features/travels/presentation/viewmodel/travels_event.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with AfterLayoutMixin, WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final travelRepo = TravelsRepoImpl(FirebaseFirestore.instance);
    final authRepo = AuthRepo(FirebaseAuth.instance, FirebaseFirestore.instance);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<TravelBloc>(
            create: (context) => TravelBloc(travelRepo: travelRepo)
              ..add(LoadTravels()),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(authRepo: authRepo),
          ),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: "Bevatel",
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: buildAppTheme(context),
          home: const SplashScreen(),
          onGenerateRoute: router.generateRoute,
        ),
      ),
    );
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    WidgetsBinding.instance.addObserver(this);
  }
}
