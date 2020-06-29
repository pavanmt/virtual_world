import 'dart:async';
import 'dart:io';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:virtual_world/utils/constants.dart';
import 'package:virtual_world/utils/data.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class VirtualityPage extends StatefulWidget {
  VirtualityPage({Key key, this.renderingCode}) : super(key: key);

  final String renderingCode;

  @override
  _VirtualityPageState createState() => _VirtualityPageState();
}

class _VirtualityPageState extends State<VirtualityPage> {
  CarouselController buttonCarouselController = CarouselController();

  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  Set<String> set = new Set();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      String song = virtualityPageItems[widget.renderingCode]['location']+virtualityPageItems[widget.renderingCode]['song'];
      print(song);
      onAudioPlay(song);
    });
  }

  void onAudioPlay(String song) async {
    File audiofile = await audioCache.load(song);
    await audioPlayer.setUrl(
      audiofile.path,
    );
    audioPlayer.play(audiofile.path);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            children: <Widget>[
              SizedBox(height: 30),
              /*GestureDetector(
                  onTap: () => {Navigator.of(context).pop()},
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black26,
                    ),
                  )),*/
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Hero(
                        tag: "img",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: new Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return new Image.asset(
                                "assets/"+"${virtualityPageItems[widget.renderingCode]["location"]}${virtualityPageItems[widget.renderingCode]["img"][index]}",
                                fit: BoxFit.fill,
                              );
                            },
                            itemCount: virtualityPageItems[widget.renderingCode]
                                        ["count"] ==
                                    null
                                ? 0
                                : virtualityPageItems[widget.renderingCode]
                                    ["count"],
                            autoplay: true,
                            loop: true,
                            pagination: new SwiperPagination(),
                            control: new SwiperControl(),
                          ) /*Image.network(
                            "${virtualityPageItems[widget.renderingCode]["img"]}",
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          )*/
                          ,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Hero(
                  tag: "explore",
                  child: Center(
                    child: Text(
                      "Pavan is exploring the virtual tour!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )),
              SizedBox(height: 20),
              Hero(
                  tag: "name",
                  child: Text(
                    "${virtualityPageItems[widget.renderingCode]["name"]}",
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  )),
              SizedBox(height: 10),
              Text(
                "${virtualityPageItems[widget.renderingCode]["place"]}",
                style: GoogleFonts.actor(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Description",
                style: GoogleFonts.adamina(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${virtualityPageItems[widget.renderingCode]["desc"]}",
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
