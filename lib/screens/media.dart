// Flutter
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:provider/provider.dart';
import 'package:songtube/internal/languages.dart';
import 'package:songtube/provider/managerProvider.dart';
import 'package:songtube/provider/mediaProvider.dart';

// Internal
import 'package:songtube/screens/mediaScreen/tabs/downloadsTab.dart';
import 'package:songtube/screens/mediaScreen/tabs/musicTab.dart';
import 'package:songtube/screens/mediaScreen/tabs/videosTab.dart';

// Packages
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:songtube/screens/mediaScreen/components/mediaSearchBar.dart';

// UI
import 'package:songtube/ui/animations/showUp.dart';
import 'package:songtube/ui/components/autohideScaffold.dart';

class MediaScreen extends StatefulWidget {
  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {

  // Search Controller and FocusNode
  TextEditingController searchController;
  FocusNode searchNode;

  // Current Search Query
  String searchQuery = "";

  @override
  void initState() {
    searchController = new TextEditingController();
    searchNode = new FocusNode();
    KeyboardVisibility.onChange.listen((bool visible) {
        if (visible == false) {
          searchNode.unfocus();
        }
      }
    );
    Provider.of<MediaProvider>
      (context, listen: false).getDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ManagerProvider manager = Provider.of<ManagerProvider>(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: AutoHideScaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).cardColor,
          title: AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child: !manager.showSearchBar ? Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Icon(
                    EvaIcons.musicOutline,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  Languages.of(context).labelMedia,
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText1.color
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    EvaIcons.searchOutline,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  onPressed: () {
                    setState(() {
                      manager.showSearchBar = true;
                      if (manager.showSearchBar == true)
                        searchNode.requestFocus();
                    });
                  },
                ),
              ],
            ) : MediaSearchBar(
              textController: searchController,
              onClear: () => setState(() {
                searchController.clear();
                searchQuery = "";
              }),
              focusNode: searchNode,
              onChanged: (String search) => setState(() => searchQuery = search),
            )
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 48,
              color: Theme.of(context).cardColor,
              child: TabBar(
                labelStyle: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3
                ),
                unselectedLabelStyle: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2
                ),
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Theme.of(context).textTheme.bodyText1
                  .color.withOpacity(0.4),
                indicator: MD2Indicator(
                  indicatorSize: MD2IndicatorSize.tiny,
                  indicatorHeight: 4,
                  indicatorColor: Theme.of(context).accentColor,
                ),
                tabs: [
                  Tab(child: Text(
                    Languages.of(context).labelDownloads
                  )),
                  Tab(child: Text(
                    Languages.of(context).labelMusic
                  )),
                  Tab(child: Text(
                    Languages.of(context).labelVideos
                  ))
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[600].withOpacity(0.2)
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MediaDownloadTab(searchQuery),
                  MediaMusicTab(searchQuery),
                  MediaVideoTab(searchQuery)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}