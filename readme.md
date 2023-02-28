<h1 align="center">
  <br>
  <img src="./Frontend/assets/icons/logo_app.png" alt="seemore" width="200">
  <br>
  seemore
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
  <a href="#license">License</a>
</p>

<p align="center">
<img width = 100% src="https://user-images.githubusercontent.com/73516876/221947341-e983ae43-0d68-4054-a818-91c483fd2173.png" alt="App">
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

⭐️ SOS - Quickly send alerts to your emergency contacts.

⭐️ Object detection - Detects the object in front of you and the distance you are from it.

⭐️ Currency detection - Detects currecny denominations.

⭐️ Read text - Reads the text for you.

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

[@Nilavan](https://github.com/Nilavan) &nbsp;&middot;&nbsp;
[@ajith-m-doodlebug](https://github.com/ajith-m-doodlebug) &nbsp;&middot;&nbsp;
[@N-liraj-khanna](https://github.com/N-liraj-khanna) &nbsp;&middot;&nbsp;
[@calicartels](https://github.com/calicartels/) &nbsp;&middot;&nbsp;

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

> [nilavan.github.io](https://www.nilavan.github.io) &nbsp;&middot;&nbsp;
> GitHub [@Nilavan](https://github.com/Nilavan) &nbsp;&middot;&nbsp;
