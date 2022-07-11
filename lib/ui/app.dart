import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wulkam/main.dart';
import 'package:wulkam/utils/routes/routes.dart';
import 'package:wulkam/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (_,widget)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          darkTheme: AppTheme.main,
          routes: routes,
          initialRoute: subscribed ? MainNavigationRoutes.main : MainNavigationRoutes.onboarding,
        )
    );
  }
}
