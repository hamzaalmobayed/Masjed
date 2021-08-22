import 'package:url_launcher/url_launcher.dart';
class UrlLauncher{
  UrlLauncher._();
  static final urlLuncher=  UrlLauncher._();
  String _url;

  lunch(_url)async{
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  sendPhone(){
    try{
      _url="tel:+972 59-289-1447";
      lunch(_url);
    }catch(e){
      print(e);
    }
  }
  openFacebook(){
    try{
      _url="https://www.facebook.com/search/top/?q=%D9%85%D8%B3%D8%AC%D8%AF%20%D8%A7%D9%84%D9%87%D8%AC%D8%A7%D9%86%D9%89";
      lunch(_url);
    }catch(e){
      print(e);
    }
  }







}
