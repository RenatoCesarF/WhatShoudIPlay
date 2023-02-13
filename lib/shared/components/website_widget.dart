import 'package:flutter/material.dart';
import 'package:project/shared/models/websites_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteWrapList extends StatelessWidget {
  final List<Websites> websiteList;
  WebsiteWrapList(this.websiteList);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(height: 10),
        Text("Websites: ",
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w900)),
        Container(
          margin: EdgeInsets.only(bottom: 20, top: 5, left: 8),
          child: Wrap(
            runSpacing: 10,
            spacing: 20,
            children: websiteList
                .map((website) => WebsiteLinkComponent(website))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class WebsiteLinkComponent extends StatelessWidget {
  final Websites website;

  WebsiteLinkComponent(this.website);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => {
        await canLaunch(this.website.url)
            ? await launch(this.website.url)
            : throw 'Could not launch ${this.website.url}'
      },
      child: Container(
        decoration: BoxDecoration(
            color: getBackgroundColorByCategory(website.category),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            )),
        width: 50,
        height: 50,
        child: getSymbleByCategory(website.category),
      ),
    );
  }

  Color getBackgroundColorByCategory(int category) {
    switch (category) {
      case 1:
        return Color(0xffB5E6FF); //Color(0xffCDEEFF);
      case 2:
        return Color(0xffF4D35E);
      case 4:
        return Color(0xff1773EA);
      case 5:
        return Color(0xff1c9cea);
      case 6:
        return Color(0xff8C45F7);
      case 8:
        return Color(0xff322A5C);
      case 9:
        return Color(0xffF70000);
      case 11:
        return Color(0xffA2B1D2);
      case 13:
        return Color(0xff171A21);
      case 14:
        return Color(0xffF74300);
      case 15:
        return Color(0xffFD254B);
      case 16:
        return Color(0xff111111);
      case 17:
        return Color(0xff722B91);
      case 18:
        return Color(0xff6E85D3);
      default:
        return Color(0xffE6E6E7);
    }
  }

  Widget getSymbleByCategory(int category) {
    switch (category) {
      case 1:
        return Image.asset('assets/images/websiteSymbols/website.png',
            scale: 9, color: Color(0xff0D3B66));
        break;
      case 2:
        return Image.asset('assets/images/websiteSymbols/book.png',
            color: Color(0xff100B00), scale: 15);
        break;
      case 3:
        return Image.asset('assets/images/websiteSymbols/wikipedia.png',
            scale: 12);
        break;
      case 4:
        return Image.asset('assets/images/websiteSymbols/facebook.png',
            scale: 12, color: Color(0xffFFFBFC));
        break;
      case 5:
        return Image.asset('assets/images/websiteSymbols/twitter.png',
            scale: 15, color: Color(0xffFFFBFC));
        break;
      case 6:
        return Image.asset('assets/images/websiteSymbols/twitch.png',
            scale: 10, color: Color(0xffFFFBFC));
        break;
      case 8:
        return Image.asset('assets/images/websiteSymbols/instagramLogo.png');
      case 9:
        return Icon(Icons.play_arrow_rounded, color: Colors.white, size: 35);
        break;
      case 10:
        return Image.asset('assets/images/websiteSymbols/iphone.png',
            scale: 10);
        break;
      case 11:
        return Icon(Icons.tablet_mac_rounded, size: 35, color: Colors.black);
        break;
      case 12:
        return Image.asset('assets/images/websiteSymbols/playstore.png',
            scale: 22);
        break;
      case 13:
        return Image.asset('assets/images/websiteSymbols/steam.png',
            scale: 5, color: Color(0xffFFFBFC));
        break;
      case 14:
        return Image.asset('assets/images/websiteSymbols/reddit.png',
            scale: 12, color: Color(0xffFFFBFC));
        break;
      case 15:
        return Image.asset('assets/images/websiteSymbols/itch.png',
            scale: 10, color: Color(0xffFFFBFC));
        break;
      case 16:
        return Image.asset('assets/images/websiteSymbols/epicGames.png',
            scale: 30, color: Color(0xffFFFBFC));
        break;
      case 17:
        return Image.asset('assets/images/websiteSymbols/gog.png',
            scale: 12, color: Color(0xffFFFBFC));
        break;
      case 18:
        return Image.asset('assets/images/websiteSymbols/discord.png',
            scale: 13, color: Color(0xffFFFBFC));
        break;
      default:
        return Image.asset('assets/images/websiteSymbols/world.png', scale: 12);
    }
  }
}
