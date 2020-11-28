import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_client/Styles/TextStyles.dart';
import 'package:shop_client/Util/Enums.dart';
import 'package:shop_client/model/AppState.dart';
import 'package:shop_client/model/model.dart';
import 'package:shop_client/res/Strings.dart';

class IntroScreen extends StatefulWidget {
  int position = 0;

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              child: PageView(
                controller: controller,
                children: [
                  IntroItem(
                    IntroModel(
                      '${Enums.images}intro1.png',
                      Strings.title_1, Strings.intro_text
                    ),
                  ),
                  IntroItem(
                    IntroModel(
                        '${Enums.images}intro2.png',
                        Strings.title_2, Strings.intro_text
                    ),
                  ),
                  IntroItem(
                    IntroModel(
                        '${Enums.images}intro3.png',
                        '', Strings.intro_text
                    ),
                  )
                ],
                onPageChanged: (index){
                  setState(() {
                    widget.position = index;
                  });
                },

              ),
            ),
          ),
          DotsIndicator(
            dotsCount: 3,
            position: widget.position.toDouble()),
          SizedBox(height: 46,)
        ],
      ),
    );
  }
}


class IntroItem extends StatelessWidget {
  final IntroModel item;
  IntroItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(item.imgAsset),
        SizedBox(height: 84,),
        processTitle(),
        SizedBox(height: 32,),
        Padding(
          child: Text(
            item.text,
            style: TextStyles.text,
            textAlign: TextAlign.center,
          ),
          padding: EdgeInsets.symmetric(horizontal: 50),
        ),
        SizedBox(height: 54,),
      ],
    );
  }

  Widget processTitle(){
    if (item.title != '')
      return Text(item.title, style: TextStyles.title,);
    else return Consumer<AppState>(builder: (context, data, child) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            child: Text(Strings.sign_in, style: TextStyles.greenTitle,),
              onPressed: (){
                final snackbar = SnackBar(
                  content: Text('Please, Sign Up!'),
                  backgroundColor: Colors.redAccent,
                );
                Scaffold.of(context).showSnackBar(snackbar);
              },
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 21),
            child: Container(width: 1, height: 13,
              color: Color.fromRGBO(160,160,160, 1),
            ),
          ),

          FlatButton(
            child: Text(Strings.sign_up, style: TextStyles.greenTitle,),
            onPressed: (){

            },
          ),
        ],
    ));
  }
}





