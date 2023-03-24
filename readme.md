<h1 align="center">
  <br>
  <img src="./Frontend/assets/icons/logo_app.png" alt="seemore" width="200">
  <br>
  <a href="https://nilavan.github.io/projects/1-seemore">seemore</a>
  <br>
</h1>

<h4 align="center">An app to make the lives of visually impaired people a little more ordinary.</h4>

<p align="center">
  <a href="#introduction">Introduction</a> •
  <a href="#installation">Installation</a> •
  <a href="#application-structure">Application Structure</a> •
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#contributors">Contributors</a> •
  <a href="#future-work">Future Work</a> •
  <a href="#references">References</a> •
  <a href="#license">License</a>
</p>

<p align="center">
<img width = 100% src="https://user-images.githubusercontent.com/73516876/226720191-bf3d3b83-d5f4-41f5-9123-c61412a7ca8b.png" alt="App">
</p>

## Introduction

The development of tools and technology hasn't resulted in the development of applications that could aid those with visual impairments. With the development of Data Modelling techniques, which can be used to give even basic computers a bit of "intelligence," and the ease of accessibility, this "intelligence" can be extended to our smartphones to aid those who are blind in navigating their surroundings and going about their daily lives. By utilising the power of Deep Learning, which can be made accessible even on low-end devices with a clear User-Interface that would precisely allow them to better grasp the world around, our application seeks to close the gap between them and the visible world.

This app enables the community of blind and visually impaired people to correctly identify objects they come across in everyday life without the need for sighted assistance.

## Installation

Install with pip:

```
$ pip install -r requirements.txt
```

## Application Structure

```
.
seemore/
├─ Frontend/
├─ calibration/
│  ├─ Ref_image.png
├─ currency_model/
│  ├─ bovw_codebook_600.pickle
│  ├─ rfclassifier_600.sav
├─ yolo_v5/
│  ├─ yolov5s.onnx
│  ├─ classes.txt
├─ app.py
├─ currencydet.py
├─ objdet.py
├─ requirements.txt
├─ .gitignore
├─ Procfile
├─ LICENSE
```

## Key Features

⭐️ Voice Commands - Activate and access all the features of the app through voice commmands.

⭐️ SOS - Quickly send alerts to your emergency contacts.

⭐️ Object detection - Detects the object in front of you and the distance you are from it.

⭐️ Currency detection - Detects currecny denominations.

⭐️ Read text - Reads the text for you.

For more details, visit [nilavan.github.io/projects/1-seemore](https://nilavan.github.io/projects/1-seemore).

## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and [Flutter](https://flutter.dev/).

From your command line:

```bash
# Clone this repository
$ git clone https://github.com/Nilavan/seemore

# Go into the repository
$ cd seemore

# Install dependencies
$ pip install -r requirements.txt

# Run the app
$ flask run
```

## Credits

This software uses the following open source packages:

- [Flutter](https://flutter.dev/)
- [Python](https://www.python.org/)
- [Python Anywhere](https://www.pythonanywhere.com/)
- [Twilio](https://www.twilio.com/)
- [Flask](https://flask.palletsprojects.com/en/2.2.x/)

## Contributors

> - [A Nilavan](https://github.com/Nilavan)
>   - Backend development
>   - Object detection (v1 & v2)
>   - Currency detection (v2)
> - [Ajith Manivannan](https://github.com/ajith-m-doodlebug)
>   - Frontend development
>   - Speech-to-text & text-to-speech
> - [N Lirajkhanna](https://github.com/N-liraj-khanna)
>   - SOS feature
>   - Currency detection (v1)
>   - Backend deployment
> - [TM Vishnu Mukundan](https://github.com/calicartels/)
>   - Text detection (OCR)

## Future Work

Although the features we set out to build have been successfully implemented, the following areas can be improved in future versions of the app.

- [x] Accuracy of detection models can be improved. We can use better and more efficient models trained on a wide variety of data to make it more robust.
- [ ] Extend object detection to more classes. The current version of the app can detect up to 80 different everyday objects. Our goal is to extend this to most objects we come across.
- [ ] Implement object detection in real-time instead of capturing image. This can drastically improve the “independence” of the visually impaired. At present, we send an image to the API and it returns the result. Our next goal is to allow the user to simply have the camera open while our app informs the person about objects detected at any time.

## References

1. [Detecting Objects in Flutter](https://towardsdatascience.com/detecting-objects-in-flutter-4fe8cfccef14)
2. [Find distance from camera to object/marker using Python and OpenCV](https://pyimagesearch.com/2015/01/19/find-distance-camera-objectmarker-using-python-opencv/)
3. [How to OCR with Tesseract, OpenCV and Python](https://nanonets.com/blog/ocr-with-tesseract/)
4. [How to Send an SMS With Python Using Twilio](https://www.twilio.com/blog/2016/10/how-to-send-an-sms-with-python-using-twilio.html)
5. [Adding speech-to-text and text-to-speech support in a Flutter app](https://blog.logrocket.com/adding-speech-to-text-text-to-speech-support-flutter-app/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

> [nilavan.github.io](https://www.nilavan.github.io) &nbsp;&middot;&nbsp;
> GitHub [@Nilavan](https://github.com/Nilavan) &nbsp;&middot;&nbsp;
