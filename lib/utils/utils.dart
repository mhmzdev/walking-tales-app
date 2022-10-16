import 'package:flutter/material.dart';
import 'package:walking_tales/models/leaderboard_Item.dart';
import 'package:walking_tales/models/nav_bar_item_model.dart';
import 'package:walking_tales/painters/trophy.dart';
import 'package:walking_tales/screens/home/home.dart';
import 'package:walking_tales/screens/leader_board/leader_board.dart';

import '../painters/home.dart';

class Utils {
  static List<List<dynamic>> dashStats = [
    ["Calories", 400.0, "kcal"],
    ["Divider"],
    ['Speed Avg.', 3.0, 'km/h'],
    ["Divider"],
    ["Distance", 7.0, "Km"]
  ];

  static List<Widget> navBarScreens = [
    const HomeScreen(),
    const LeaderBoardScreen(),
  ];

  static List<NavbarItemModel> navBarItem = [
    NavbarItemModel(
      label: "Home",
      icon: CustomPaint(
        painter: HomeIconPainter(),
        size: const Size(22, 22),
      ),
    ),
    NavbarItemModel(
      label: "Profile",
      icon: CustomPaint(
        painter: TrophyPainter(),
        size: const Size(22, 22),
      ),
    ),
  ];

  static List<LeaderboardItem> leaderboardItems = [
    LeaderboardItem(
        name: "Aaqib Ur Rehman",
        steps: 10500,
        url:
            'https://media.istockphoto.com/photos/headshot-of-a-teenage-boy-picture-id1158014305?k=20&m=1158014305&s=612x612&w=0&h=RgcRlPfHFZA4OWSROC46FgBILIQVyiS6o_EmyZAMt4M='),
    LeaderboardItem(
        name: "Wadood Jamal",
        steps: 9400,
        url:
            'https://media.istockphoto.com/photos/portrait-of-handsome-smiling-young-man-with-crossed-arms-picture-id1200677760?k=20&m=1200677760&s=612x612&w=0&h=JCqytPoHb6bQqU9bq6gsWT2EX1G5chlW5aNK81Kh4Lg='),
    LeaderboardItem(
        name: "Sobia Tahir",
        steps: 9000,
        url:
            'https://media.istockphoto.com/photos/portrait-teenager-picture-id846730696?k=20&m=846730696&s=612x612&w=0&h=dV17mFeCvF99EhhE49rVYlxcH9er2Ik3kr-axd1c0A8='),
    LeaderboardItem(
        name: "Irum Naaz",
        steps: 7600,
        url:
            'https://media.istockphoto.com/photos/portrait-of-a-teen-girl-picture-id1159600048?k=20&m=1159600048&s=612x612&w=0&h=Hgx0jBHpKLCrrcnnn_dhw2u_eQJ1O7djt8atw4Enz6Q='),
    LeaderboardItem(
        name: "Abid Ali",
        steps: 6340,
        url:
            'https://media.istockphoto.com/photos/senior-man-working-out-for-good-health-picture-id1135152361?k=20&m=1135152361&s=612x612&w=0&h=gFms3o8PeNtKpdZAGm70hHACA7ailZolmZATv90rysY='),
    LeaderboardItem(
        name: "Uzair Imran",
        steps: 5500,
        url:
            'https://media.istockphoto.com/photos/living-that-urban-life-picture-id1165314750?k=20&m=1165314750&s=612x612&w=0&h=QcN0aTHS8IpSbNEnSU9Vno8vUjCEFQs4gbZ72dG6yvM='),
  ];
  static List<LeaderboardItem> leaderboardWinners = [
    LeaderboardItem(
        name: "Hassam Talha",
        steps: 17300,
        url:
            'https://media.istockphoto.com/photos/portrait-of-a-mature-man-with-a-little-smile-at-the-camera-right-side-picture-id1277873802?k=20&m=1277873802&s=612x612&w=0&h=I3aEJcrZRFwZPSmf0jkQMFqDg_KxLnmo-t8bLi8gPpw='),
    LeaderboardItem(
        name: "Hamza Shakeel",
        steps: 22100,
        url:
            'https://media.istockphoto.com/photos/smiling-handsome-middleaged-man-in-black-shirt-picture-id1248747884?k=20&m=1248747884&s=612x612&w=0&h=0GoQo0Z22bGTjJgYhY3Gq1CfBj-R3WO4w3loFigtIjg='),
    LeaderboardItem(
        name: "Ali Asghar",
        steps: 13560,
        url:
            'https://media.istockphoto.com/photos/young-handsome-man-with-beard-wearing-casual-sweater-and-glasses-over-picture-id1212960962?k=20&m=1212960962&s=612x612&w=0&h=o2PGY4yhn51XSnYi60dMCQqvXQ0d-odkaKUVocbYYLk='),
  ];
}
