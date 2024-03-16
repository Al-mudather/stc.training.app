import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stc_training/features/authentication/login_auth_page.dart';

import 'package:stc_training/helper/app_colors.dart';
import 'package:stc_training/helper/app_constants.dart';
import 'package:stc_training/helper/dependencies.dart' as dep;
import 'package:stc_training/routes/route_helper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  // To ensure the dependenses are loaded
  WidgetsFlutterBinding.ensureInitialized();
  var appStorage = await SharedPreferences.getInstance();
  var token = appStorage.get(AppConstants.TOKEN);
  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // so we need to initialize Hive.
  await initHiveForFlutter();
  // Load the dependences
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get the Apollo Client
    ValueNotifier<GraphQLClient> client = initializeApolloClient();

    return GraphQLProvider(
      client: client,
      child: GetMaterialApp(
        title: 'Stc training app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          useMaterial3: true,
        ),
        // home: const AllCoursesPage(),
        // navigatorObservers: [
        //   VdoPlayerController.navigatorObserver('/player/(.*)')
        // ],
        // initialRoute: Routehelper.GoToDrawerLayoutPage(),
        // getPages: Routehelper.routes,
        home: LoginAuthPage(),
      ),
    );
  }

  ValueNotifier<GraphQLClient> initializeApolloClient() {
    final HttpLink httpLink = HttpLink(
      AppConstants.BAS_URL,
    );

    // final AuthLink authLink = AuthLink(
    //   getToken: () async =>
    //       'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImFkbWluQHN0Yy5jb20iLCJleHAiOjE3MTAwNzc4ODgsIm9yaWdJYXQiOjE3MDc0ODU4ODh9.5r8hfmLdwhrFT3rSFYWU9FF3jVOhwvutd7w_6TQWB2M',
    //   // OR
    //   // getToken: () async => 'JWT ${innerAuthCtl.token}',
    // );

    // final Link link = authLink.concat(httpLink);
    final Link link = httpLink;

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(store: HiveStore()),
        // defaultPolicies: DefaultPolicies(
        //   query: Policies(
        //     fetch: FetchPolicy.networkOnly,
        //     // fetch: FetchPolicy.cacheAndNetwork,
        //   ),
        //   watchQuery: Policies(
        //     fetch: FetchPolicy.networkOnly,
        //   ),
        // ),
      ),
    );

    return client;
  }
}
