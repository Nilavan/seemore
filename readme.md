<h1 align="center">
  <br>
  <img src="/Frontend/assets/icons/logo_app.png" alt="Blind-ai" width="200">
  <br>
  blind.ai
  <br>
</h1>

<h4 align="center">An app to make the lives of visually impaired people a little more ordinary.</h4>

<!--<p align="center">
  <a href="https://badge.fury.io/js/electron-markdownify">
    <img src="https://badge.fury.io/js/electron-markdownify.svg"
         alt="Gitter">
  </a>
  <a href="https://gitter.im/amitmerchant1990/electron-markdownify"><img src="https://badges.gitter.im/amitmerchant1990/electron-markdownify.svg"></a>
  <a href="https://saythanks.io/to/bullredeyes@gmail.com">
      <img src="https://img.shields.io/badge/SayThanks.io-%E2%98%BC-1EAEDB.svg">
  </a>
  <a href="https://www.paypal.me/AmitMerchant">
    <img src="https://img.shields.io/badge/$-donate-ff69b4.svg?maxAge=2592000&amp;style=flat">
  </a>
</p>-->

<p align="center">
  <a href="#introduction">Introduction</a> •
  <a href="#installation">Installation</a> •
  <a href="#application-structure">Application Structure</a> •
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#support">Support</a> •
  <a href="#contributors">Contributors</a> •
  <a href="#license">License</a>
</p>

<p align="center">
<img width = 30% src="https://user-images.githubusercontent.com/73516876/193432075-1e0bcc3c-0681-441d-bab5-4d185f25c974.jpeg" alt="App">
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
blind_ai/
├─ Frontend/
├─ calibration/
│  ├─ Ref_image.png
├─ currency-detection/
│  ├─ currencies/
├─ yolo_v3/
│  ├─ coco.names
│  ├─ yolov3-tiny.cfg
│  ├─ yolov3-tiny.weights
├─ app.py
├─ curr_det.py
├─ requirements.txt
├─ utils.py
├─ .gitignore
├─ Procfile
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
$ git clone https://github.com/Nilavan/Blind-AI-Backend/

# Go into the repository
$ cd Blind-AI-Backend

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

## Support

<a href="" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/purple_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

<p>Or</p>

<a href="">
	<img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>

## Contributors

[@N-liraj-khanna](https://github.com/N-liraj-khanna) &nbsp;&middot;&nbsp;
[@ajith-m-doodlebug](https://github.com/ajith-m-doodlebug) &nbsp;&middot;&nbsp;
[@calicartels](https://github.com/calicartels/) &nbsp;&middot;&nbsp;
[@Nilavan](https://github.com/Nilavan) &nbsp;&middot;&nbsp;

## License

MIT

---

> [nilavan.github.io](https://www.nilavan.github.io) &nbsp;&middot;&nbsp;
> GitHub [@Nilavan](https://github.com/Nilavan) &nbsp;&middot;&nbsp;
