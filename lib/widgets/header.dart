// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:santander_app/model/user_model/user_model.dart';

import '../shared/app_colors.dart';
import '../shared/app_settings.dart';

class Header extends StatefulWidget {
  final UserModel user;
  const Header({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      height: AppSettings.screenHeight / 5,
      width: AppSettings.screenWidth,
      color: AppColors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Olá ${widget.user.name}",
            style: const TextStyle(
                fontSize: 18,
                 fontWeight: FontWeight.w600, 
                 color: Colors.white),
          ),
          Text(
            "Ag ${widget.user.account!.agency} Cc ${widget.user.account!.number!}",
            style: const TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.w600,
                 color: Colors.white),
          )
        ],
      ),
    );
  }
}
