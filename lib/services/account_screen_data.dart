import 'package:flutter/material.dart';


class AccountScreenData{
  IconData icon;
  String title;
  Function onPress;

  AccountScreenData({this.icon, this.title,this.onPress});
}

List<AccountScreenData> accountScreenData = [bankDetails, sharedCatalogs,payments, challenges, lotterySpins, referralCode,
referEarn, meeshoCredits,messhoCommunity, businessLogo, settings, notifications, rateMeesho];

final AccountScreenData bankDetails = AccountScreenData(
  icon: Icons.search,
  title: 'My Bank Details',
    onPress: (){
      print('pressed first');
    }
);

final AccountScreenData sharedCatalogs = AccountScreenData(
    icon: Icons.share,
    title: 'My Shared Catalogs',
  onPress: (){
    print('pressed second');
  }
);

final AccountScreenData payments = AccountScreenData(
    icon: Icons.search,
    title: 'My Payments',
    onPress: (){}
);

final AccountScreenData challenges = AccountScreenData(
    icon: Icons.share,
    title: 'Challenges',
    onPress: (){}
);

final AccountScreenData lotterySpins = AccountScreenData(
    icon: Icons.search,
    title: 'Lottery Spins',
    onPress: (){}
);

final AccountScreenData referralCode = AccountScreenData(
    icon: Icons.share,
    title: 'Enter Referral Code',
    onPress: (){}
);

final AccountScreenData referEarn = AccountScreenData(
    icon: Icons.search,
    title: 'Refer & Earn',
    onPress: (){}
);

final AccountScreenData meeshoCredits = AccountScreenData(
    icon: Icons.share,
    title: 'Meesho Credits',
    onPress: (){}
);

final AccountScreenData messhoCommunity = AccountScreenData(
    icon: Icons.share,
    title: 'Meesho Community',
    onPress: (){}
);

final AccountScreenData businessLogo = AccountScreenData(
    icon: Icons.share,
    title: 'Business Logo',
    onPress: (){}
);

final AccountScreenData settings = AccountScreenData(
    icon: Icons.settings,
    title: 'Settings',
    onPress: (){}
);

final AccountScreenData notifications = AccountScreenData(
    icon: Icons.notifications,
    title: 'Notifications',
    onPress: (){}
);

final AccountScreenData rateMeesho = AccountScreenData(
    icon: Icons.star,
    title: 'Rate Meesho',
    onPress: (){}
);