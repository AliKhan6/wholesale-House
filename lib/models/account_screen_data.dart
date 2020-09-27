
import 'package:flutter/material.dart';
import 'package:resellapp/ui/screens/account_screen/bank_details_screen.dart';
import 'package:resellapp/ui/screens/collection_screen.dart';


class AccountScreenData{
  IconData icon;
  String image;
  String title;
  Function onPress;
  AccountScreenData({this.icon, this.title,this.onPress,this.image});
}

List<AccountScreenData> accountScreenData = [bankDetails, sharedCatalogs,payments, challenges, lotterySpins, settings, notifications, rateMeesho];

final AccountScreenData bankDetails = AccountScreenData(
  image: 'images/band_details.png',
  title: 'My Bank Details',
    onPress: (){
      BuildContext context;
      Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsScreen()));
    }
);

final AccountScreenData sharedCatalogs = AccountScreenData(
    icon: Icons.share,
    title: 'My Shared Catalogs',
    onPress: (){
      BuildContext context;
      Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionScreen()));
    }
);

final AccountScreenData payments = AccountScreenData(
    image: 'images/payments.png',
    title: 'My Payments',
    onPress: (){}
);

final AccountScreenData challenges = AccountScreenData(
    image: 'images/challenges.png',
    title: 'Challenges',
    onPress: (){}
);

final AccountScreenData lotterySpins = AccountScreenData(
    image: 'images/lottery_spins.png',
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
    title: 'Rate Wholesale house',
    onPress: (){}
);