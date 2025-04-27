import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel/constant.dart';
import 'package:travel/core/utils/function/snackbar.dart';
import 'package:travel/core/utils/responsive.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];
  final uid = Supabase.instance.client.auth.currentUser?.id;

  Future<void> getData() async {
    try {
      final response = await Supabase.instance.client
          .from("users")
          .select("*")
          .eq("id", uid!);

      if (response != null && response.isNotEmpty ) {
        setState(() {
          data = response;
        });
        print(data);
      } else {
        snackbarerror(context, "No data found");
      }
    } catch (e) {
      snackbarerror(context, "An error occurred");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: KPrimayColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: AppResponsive.heigth(context) * 0.6,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find your next ADVENTURE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search destinations",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // You can add a small Expanded here later to show fetched data
        ],
      ),
    );
  }
}
