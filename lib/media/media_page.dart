import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/gather_page.dart';
import 'package:flutter_demo/rtc/trtc_page.dart';
import 'package:flutter_demo/style/my_color.dart';
//import 'package:android_intent/android_intent.dart';
import 'dart:async';
import 'dart:io';
//import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class MediaPage extends GatherPage {
  MediaPage()
      : super(content: MediaListBody(), title: "图像采集", targetPage: TrtcPage());
}

class MediaListBody extends StatefulWidget {
  @override
  _MediaListBodyState createState() {
    return _MediaListBodyState();
  }
}

class _MediaListBodyState extends State<MediaListBody> {
  var _list = <String>[];
  var _outlineButtonText = '立即拍照';
  File _imageFile;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    for (var i = 0; i < 120; i++) {
      _list.add("QREWFWEFF");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
//    assert(_list = null);
    var widget;
    if (_list == null || _list.isEmpty) {
//      widget = ProgressDialog.buildProgressDialog();
    } else {
      widget = new ListView.builder(
        //设置physics属性总是可滚动
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: _buildItem,
      );
    }

    return widget;
  }

  Widget _buildItem(BuildContext context, int index) {
    String text = _list[index];
    return InkWell(
      onTap: () {},
      child: _buildCard(),
    );
  }

  Card _buildCard() {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        elevation: 2.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.picture_in_picture),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "小区大门照",
                      style: TextStyle(color: Colors.amber, fontSize: 14.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildSampleImage(),
//                  VerticalDivider(color: const Color(0xFFD9DFE7),),
                  SizedBox(
                    width: 0.0,
                    height: 96.0,
                    child: Center(
                      child: Container(
                        width: 0.0,
                        margin: EdgeInsetsDirectional.only(start: 0),
                        decoration: BoxDecoration(
                          border: Border(
                            left: Divider.createBorderSide(
                              context,
                              color: const Color(0xFFD9DFE7),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  _buildSampleImage(),
                  OutlineButton(
                    onPressed: _takePhoto,
                    child: Text(
                      _outlineButtonText,
                      style: TextStyle(
                        color: MyColors.primary(),
                        fontSize: 14.0,
                      ),
                    ),
                    borderSide: BorderSide(
                      color: MyColors.primary(),
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "注意：图片需可见小区名、街道号等，至少1张",
                    style:
                        TextStyle(fontSize: 12, color: const Color(0xFF878787)),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildSampleImage() {
    var image = Image.asset(
      'images/perloader_icon.png',
      height: 96,
      width: 96,
    );
    return InkWell(
      onTap: () async {
        try {
          var _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
          print(_imageFile);
        } catch (e) {
//            _pickImageError = e;
        }
        setState(() {});
      },
      child: _imageFile == null
          ? image
          : Image.file(
              _imageFile,
              height: 96,
              width: 96,
            ),
    );
  }

  /*拍照*/
  _takePhoto() async {
    print("take");
    try {
      _imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
      print(_imageFile);
    } on Exception catch (e) {
      print(e);
    }
    setState(() {});
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  /*void launchCamera() {
    if (Platform.isAndroid) {
      checkPermission();
      AndroidIntent intent = AndroidIntent(
        action: 'android.media.action.IMAGE_CAPTURE',
        arguments: {'authAccount': ""},
      );
      intent.launch();
    }
  }*/

/*  void checkPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);
  }*/
}
