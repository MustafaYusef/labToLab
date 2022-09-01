import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:labtolab_app/data/labInfo.dart';
import 'package:labtolab_app/ui/customWidget/notePopUp.dart';

class InfoSlider extends StatefulWidget {
  InfoSlider({
    Key? key,
    required int current,
    required this.banners,
  })  : _current = current,
        super(key: key);

  int _current;
  List<Information> banners;

  @override
  State<InfoSlider> createState() => _InfoSliderState();
}

class _InfoSliderState extends State<InfoSlider> {
  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      widget._current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: Colors.white,
      child: Stack(children: <Widget>[
        CarouselSlider.builder(
            itemCount: widget.banners.length == 0 ? 1 : widget.banners.length,
            options: CarouselOptions(
              height: 160,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              aspectRatio: 2.0,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: onPageChange,
            ),
            itemBuilder: (BuildContext context, int itemIndex, int u) => Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        // child: Image.asset(
                        //   "assets/images/labToLab2.jpeg",
                        //   fit: BoxFit.cover,
                        // ),
                        child: Container(
                          color: Colors.white,
                          height: 150,
                          margin: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          width: Get.width - 100,
                          child: InkWell(
                            onTap: () {
                              ShowNotePopUp(widget.banners[widget._current]);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 3,
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      // Card(
                                      //   child: Container(
                                      //       width: 70,
                                      //       height: 70,
                                      //       child: Image.asset(
                                      //         "assets/images/labToLab2.jpeg",
                                      //         fit: BoxFit.cover,
                                      //       )
                                      //       //  CachedNetworkImage(
                                      //       //   fit: BoxFit.cover,
                                      //       //   width: 60,
                                      //       //   height: 60,
                                      //       //   imageUrl: list.img,
                                      //       //   placeholder: (context, url) => loadinImage(),
                                      //       //   errorWidget: (context, url, error) => loadinImage(),
                                      //       // ),
                                      //       ),
                                      //   elevation: 2,
                                      //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      // ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.banners[widget._current]
                                                  .title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    widget
                                                        .banners[
                                                            widget._current]
                                                        .description,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[800],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Expanded(child: Container()),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey[600],
                                        ),
                                      )
                                    ],
                                  ),
                                  // Container(
                                  //   margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                  //   width: Get.width,
                                  //   height: 1,
                                  //   color: Colors.grey[200],
                                  // )
                                ],
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                )),
        // Positioned(
        //     bottom: 0.0,
        //     child: Container(
        //       width: Get.width,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: widget.banners.map((image) {
        //           return Container(
        //             width: 9.0,
        //             height: 9.0,
        //             margin:
        //                 EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: widget._current == widget.banners.indexOf(image)
        //                     ? Colors.orange[900]
        //                     : Colors.grey[300]),
        //           );
        //         }).toList(),
        //       ),
        //     )),
      ]),
    );
  }
}
