import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel/core/utils/router.dart';
import 'package:travel/feature/authentication/data/repos/authentication_repo_impl.dart';
import 'package:travel/feature/authentication/presentation/manager/cubit/authentication_cubit.dart';
import 'package:travel/feature/authentication/presentation/view/login_view.dart';
import 'package:travel/feature/home/presentation/view/home.dart';
import 'package:travel/feature/home/presentation/view/home_screen_view.dart';

void main() async {
  await Supabase.initialize(
    url: "https://xfbwwfqgcceenezcugya.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhmYnd3ZnFnY2NlZW5lemN1Z3lhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU2MTkwMzIsImV4cCI6MjA2MTE5NTAzMn0.iGumgkLHsk3FrQKyKV8T92GT4OAqL56q5-Icao2zZ0Q",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthenticationCubit(AuthenticationRepoImpl())),
      ],
      child: MaterialApp(
        home: Supabase.instance.client.auth.currentUser!.id == null
            ? const LoginView()
            : HomeScreenView(),
        routes: AppRouter.pageRoutes,
      ),
    );
  }
}
