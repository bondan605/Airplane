import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/auth_cubit.dart';
import 'package:travel/cubit/destination_cubit.dart';
import 'package:travel/cubit/page_cubit.dart';
import 'package:travel/cubit/seat_cubit.dart';
import 'package:travel/cubit/transaction_cubit.dart';
import 'package:travel/ui/pages/bonus_page.dart';
import 'package:travel/ui/pages/get_started_page.dart';
import 'package:travel/ui/pages/main_page.dart';
import 'package:travel/ui/pages/sign_in_page.dart';
import 'package:travel/ui/pages/sign_up_page.dart';
import 'package:travel/ui/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel/ui/pages/success_checkout_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/success': (context) => SuccessCheckoutPage(),
          '/main': (context) => MainPage(),
        },
      ),
    );
  }
}
