import 'package:check_news/src/commonWidget/customWidget.dart';
import 'package:check_news/src/theme/bloc/bloc.dart';
import 'package:check_news/theme_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget _headerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: customAdvanceNetworkImage(
                    'https://media1.s-nbcnews.com/j/newscms/2019_14/2808721/190403-joaquin-phoenix-joker-cs-1005a_4715890895d3fad1f9e7ccec85386821.fit-760w.jpg'),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'TheAlphamerc',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Loyal Reader',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              _estimateWidget('Followers', '826'),
              _estimateWidget('Following', '251'),
              _estimateWidget('News Read', '81K'),
            ],
          ),
          SizedBox(height: 30),
          Divider(thickness: 2, color: Colors.white.withOpacity(0.5)),
        ],
      ),
    );
  }

  Widget _estimateWidget(String text, String count) {
    return Expanded(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              count,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(text, style: TextStyle(fontSize: 16, color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _settingRow(BuildContext context, IconData icon, String text,
      bool isEnable, Function(bool)? onChanged) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isEnable
            ? Theme.of(context).primaryColor.withOpacity(0.2)
            : Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Theme.of(context).primaryColor),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 16,
            ),
          ),
          Expanded(child: SizedBox()),
          Switch(
            activeColor: Theme.of(context).primaryColor,
            inactiveTrackColor: Theme.of(context).disabledColor,
            value: isEnable,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }

  Widget _logout(BuildContext context, IconData icon, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Theme.of(context).colorScheme.error),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.error,
              fontSize: 16,
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          bool isLightTheme = state is SelectedTheme &&
              state.themeType == ThemeType.Light;

          return SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: _headerWidget(context),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _settingRow(
                          context,
                          Icons.lightbulb_outline,
                          'Night Mode',
                          !isLightTheme,
                          (value) {
                            BlocProvider.of<ThemeBloc>(context).add(
                              value ? DarkMode() : LightMode(),
                            );
                          },
                        ),
                        _settingRow(context, Icons.notifications, 'Notifications',
                            false, null),
                        _settingRow(context, Icons.share, 'Social Media', false,
                            null),
                        SizedBox(height: 5),
                        Divider(indent: 20, endIndent: 20, height: 0),
                        SizedBox(height: 5),
                        _logout(context, Icons.exit_to_app, 'Logout'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
