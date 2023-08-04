import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:santander_app/model/user_model/user_model.dart';
import 'package:santander_app/shared/app_colors.dart';
import 'package:santander_app/shared/app_images.dart';
import 'package:santander_app/widgets/card.dart';
import 'package:santander_app/widgets/info_card.dart';
import '../../services/api.dart';
import '../../widgets/features.dart';
import '../../widgets/header.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    fetch();
  }
  fetch()async{
     user = await ApiApp.fetchUser(1);
    setState(() {   
    });
  }
  @override
  Widget build(BuildContext context) {
    return user == null ? const Scaffold(
      body: Center(
        child: CircularProgressIndicator()),) 
        : Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.red,
        foregroundColor: Colors.white,
        title: Center(
          child: Image.asset(
            'lib/assets/imgs/logo.png',
            height: 200,color: Colors.white, 
          ),
        ),actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(AppImages.notification,height: 24,)
          )
        ],
      ),
      body: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Header(user: user!,),
                const SizedBox(height: 20,),
                FeaturesWidget(features: user!.features!,),
                const SizedBox(height: 20,),
                CardWidget(card: user!.card!),
                const SizedBox(height: 20,),
                InfoCardsWidget(news: user!.news!)
               
               
               
                           
              ],
            ),
            
            
          ],
        ),
      ),
   
    );
  }
}
