import 'dart:async';
import 'dart:core';
import 'package:blind_ai/API/api_object.dart';
import 'package:blind_ai/API/api_read_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:text_to_speech/text_to_speech.dart';
import '../API/api_currency.dart';
import '../API/api_sos.dart';
import '../Image/image.dart';
import 'package:camera/camera.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeViewModel extends BaseViewModel {
  TextToSpeech tts = TextToSpeech();

  stt.SpeechToText speech = stt.SpeechToText();

  bool listen = false;

  String text = "";

  Future<void> setUpListen() async {
    setSystemLoading();

    setUpVoice();

    await tts.speak("Speak Now");

    bool available = false;

    if (!listen) {
      available = await speech.initialize(
          onStatus: (val) {
            if (val == "done") {
              directText();
            }
          },
          onError: (val) => print("THIS IS HERE 2: $val"));
      notifyListeners();
    }

    if (available) {
      listen = true;

      speech.listen(
          listenFor: const Duration(seconds: 20),
          onResult: (val) {
            text = val.recognizedWords;
            print("TALKS: $text");
            text = text.toLowerCase();
          });

      print("TALKS FILL: $text");
    } else {
      listen = false;
      speech.stop();
      notifyListeners();
      setUpListen();
    }

    setSystemFree();
  }

  Future<void> directText() async {
    if (text.contains("blind eye") ||
        text.contains("blind i") ||
        text.contains("blind ai")) {
      if (text.contains("sos")) {
        onTapOne();
      } else if (text.contains("object")) {
        onTapThree();
      } else if (text.contains("currency")) {
        onTapFour();
      } else if (text.contains("read")) {
        onTapTwo();
      } else {
        tts.speak("Try Again");
      }
    } else {
      tts.speak("Try with blind eye");
    }
  }

  bool _isLoading = false;
  get isLoading => _isLoading;

  void setSystemLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void setSystemFree() {
    _isLoading = false;
    notifyListeners();
  }

  void setUpVoice() {
    tts.setVolume(1);
    tts.setPitch(2);
  }

  // One
  Future<void> onTapOne() async {
    setSystemLoading();
    setUpVoice();
    await tts.speak("SOS");
    onDoubleTapOne();
  }

  Future<void> onDoubleTapOne() async {
    await apiSOS();
    await tts.speak("Alerted the SOS Contacts");
    setSystemFree();
  }

  // Two
  Future<void> onTapTwo() async {
    setSystemLoading();
    setUpVoice();
    await tts.speak("Read Text");
    onDoubleTapTwo();
  }

  Future<void> onDoubleTapTwo() async {
    setUpVoice();
    XFile? image = await pickImageFromCamera();
    if (image != null) {
      String? response = await apiReadText(path: image.path);
      await tts.speak(response);
    }
    setSystemFree();
  }

  // Three
  Future<void> onTapThree() async {
    setSystemLoading();
    setUpVoice();
    await tts.speak("Detect Object");
    onDoubleTapThree();
  }

  Future<void> onDoubleTapThree() async {
    setUpVoice();
    XFile? image = await pickImageFromCamera();
    if (image != null) {
      String? response = await apiObject(path: image.path);
      await tts.speak(response);
    }
    setSystemFree();
  }

  // Four
  Future<void> onTapFour() async {
    setSystemLoading();
    setUpVoice();
    await tts.speak("Check Currency");
    onDoubleTapFour();
  }

  Future<void> onDoubleTapFour() async {
    setUpVoice();
    XFile? image = await pickImageFromCamera();
    if (image != null) {
      String? response = await apiCurrency(path: image.path);
      await tts.speak(response);
    }
    setSystemFree();
  }

  // Voice Button
  Future<void> onTapVoice() async {
    setSystemLoading();
    setUpVoice();
    await tts.speak("Mike");
    setSystemFree();
  }

  Future<void> onDoubleTapVoice() async {
    await setUpListen();
  }
}
