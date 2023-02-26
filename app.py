#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#----------------------------------------------------------------------------
# Created By  : A NILAVAN
# Created Date: 01/10/2022
# version ='2.0'
# ---------------------------------------------------------------------------

from flask import Flask, request
import numpy as np
import cv2
from PIL import Image
import io
import json
import os
import pytesseract
from twilio.rest import Client
from objdet import *
from currencydet import *

# =========== SOS config ==========
AccountSID = "AC3d7c37421b5dc5c2052af769a6dca3ed"
AuthToken = "6a869e5d46bebc730f930c51b5224037"

# =========== Yolo config ==========
INPUT_WIDTH = 640
INPUT_HEIGHT = 640
SCORE_THRESHOLD = 0.2
NMS_THRESHOLD = 0.4
CONFIDENCE_THRESHOLD = 0.4

# yolo_path = "/home/liraj/Blind-AI-Backend/yolo_v3"
yolo_path = "./yolo_v5" # use for localhost
# path = "/home/liraj/Blind-AI-Backend/"
path = "./" # use for localhost

client = Client(AccountSID, AuthToken)

def sendMessage(client_num, message):
    client.messages.create(
        body=message,
        from_=+19787739785,
        to='+91'+client_num
    )

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

@app.route("/detected_obj", methods=["POST"])
def obj_det():
    model_name = "yolov5s.onnx"
    net = build_model(yolo_path, model_name)
    image = request.files["file"].read()
    image = Image.open(io.BytesIO(image))
    npimg = np.array(image)
    image = npimg.copy()
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    labelsPath = "classes.txt"
    class_list = load_classes(labelsPath)

    inputImage = format_yolov5(image)
    res, laptop_widths = get_prediction(inputImage, net, class_list)
    if laptop_widths:
        res += ' at distance '
        ref_image = cv2.imread(os.path.join(path,"calibration", "Ref_image.png"))
        _, ref_image_laptop_width = get_prediction(ref_image, net, class_list)
        focal_length_found = focal_length_finder(Known_distance, Known_width, ref_image_laptop_width[0])
        for laptop_width in laptop_widths:
            distance = distance_finder(focal_length_found, Known_width, laptop_width)
        res = res + '{:.2f} centimeters'.format(distance)
    return res

@app.route("/detected_txt", methods=["POST"])
def txt_det():
    image = request.files["file"].read()
    image = Image.open(io.BytesIO(image))
    npimg = np.array(image)
    image = npimg.copy()
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    res = pytesseract.image_to_string(image, lang='eng')
    if not res.strip():
        res = 'No text found, try again'
    return "The following text was detected. " + res

@app.route("/currency", methods=["POST"])
def currency():
    image = request.files["file"].read()
    image = Image.open(io.BytesIO(image))
    npimg = np.array(image)
    image = npimg.copy()
    image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    res = currency_det(image)
    return res

@app.route("/sos", methods=["POST"])
def sos():
    numbers = json.loads(request.data)['data']
    for num in numbers:
        sendMessage(num, "SOS EMERGENCY FROM BLIND PERSON")
    return "Success"

if __name__ == "__main__":
    app.run()