import 'package:shared_preferences/shared_preferences.dart';

class PrefManger{
  SharedPreferences sharedPreferences;
  static PrefManger _mInstance;


  PrefManger(){
    init();
  }

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static PrefManger getInstance(){
    if(_mInstance == null)
      _mInstance = PrefManger();
    return _mInstance;
  }

  getHighScore(){
    return sharedPreferences.getInt("highScore");
  }

  setHighScore(int highScore){
    sharedPreferences.setInt("highScore", highScore);
  }



}