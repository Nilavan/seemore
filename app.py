from flask import Flask, request, jsonify
from captionbot import CaptionBot
from werkzeug.utils import secure_filename
import os
import urllib.request
import numpy as np
import argparse
import time
import cv2
from twilio.rest import Client
# from utils import *
import json


# =========== SOS config ==========
AccountSID = "ACab7d918a4faa83654783af6e14278e9c"
AuthToken = "284e0c2e3c8c716a94534e3be95b8f5b"
# =========== Yolo config ==========
confthres = 0.5
nmsthres = 0.1
yolo_path = './'
# =========== Currency config ==========
max_val = 8
max_pt = -1
max_kp = 0
# =========== Currency config ==========
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

client = Client(AccountSID, AuthToken)

def sendMessage(client_num, message):
    client.messages.create(
        body=message,
        from_=+13023432161,
        to='+91'+client_num
    )

# def get_labels(labels_path):
#     # load the COCO class labels our YOLO model was trained on
#     #labelsPath = os.path.sep.join([yolo_path, "yolo_v3/coco.names"])
#     lpath = os.path.sep.join([yolo_path, labels_path])
#     LABELS = open(lpath).read().strip().split("\n")
#     return LABELS

# def get_colors(LABELS):
#     # initialize a list of colors to represent each possible class label
#     np.random.seed(42)
#     COLORS = np.random.randint(0, 255, size=(len(LABELS), 3),dtype="uint8")
#     return COLORS

# def get_weights(weights_path):
#     # derive the paths to the YOLO weights and model configuration
#     weightsPath = os.path.sep.join([yolo_path, weights_path])
#     return weightsPath

# def get_config(config_path):
#     configPath = os.path.sep.join([yolo_path, config_path])
#     return configPath

# def load_model(configpath, weightspath):
#     # load our YOLO object detector trained on COCO dataset (80 classes)
#     print("[INFO] loading YOLO from disk...")
#     net = cv2.dnn.readNetFromDarknet(configpath, weightspath)
#     return net

# def get_prediction(image, net, LABELS, COLORS):
#     (H, W) = image.shape[:2]
#     text = ''

#     # determine only the *output* layer names that we need from YOLO
#     ln = net.getLayerNames()
#     ln = [ln[i[0] - 1] for i in net.getUnconnectedOutLayers()]

#     # construct a blob from the input image and then perform a forward
#     # pass of the YOLO object detector, giving us our bounding boxes and
#     # associated probabilities
#     blob = cv2.dnn.blobFromImage(image, 1 / 255.0, (416, 416),
#                                  swapRB=True, crop=False)
#     net.setInput(blob)
#     start = time.time()
#     layerOutputs = net.forward(ln)
#     print(layerOutputs)
#     end = time.time()

#     # show timing information on YOLO
#     print("[INFO] YOLO took {:.6f} seconds".format(end - start))

#     # initialize our lists of detected bounding boxes, confidences, and
#     # class IDs, respectively
#     boxes = []
#     confidences = []
#     classIDs = []

#     # loop over each of the layer outputs
#     for output in layerOutputs:
#         # loop over each of the detections
#         for detection in output:
#             # extract the class ID and confidence (i.e., probability) of
#             # the current object detection
#             scores = detection[5:]
#             # print(scores)
#             classID = np.argmax(scores)
#             # print(classID)
#             confidence = scores[classID]

#             # filter out weak predictions by ensuring the detected
#             # probability is greater than the minimum probability
#             if confidence > confthres:
#                 # scale the bounding box coordinates back relative to the
#                 # size of the image, keeping in mind that YOLO actually
#                 # returns the center (x, y)-coordinates of the bounding
#                 # box followed by the boxes' width and height
#                 box = detection[0:4] * np.array([W, H, W, H])
#                 (centerX, centerY, width, height) = box.astype("int")

#                 # use the center (x, y)-coordinates to derive the top and
#                 # and left corner of the bounding box
#                 x = int(centerX - (width / 2))
#                 y = int(centerY - (height / 2))

#                 # update our list of bounding box coordinates, confidences,
#                 # and class IDs
#                 boxes.append([x, y, int(width), int(height)])
#                 confidences.append(float(confidence))
#                 classIDs.append(classID)

#     # apply non-maxima suppression to suppress weak, overlapping bounding
#     # boxes
#     idxs = cv2.dnn.NMSBoxes(boxes, confidences, confthres,
#                             nmsthres)

#     # ensure at least one detection exists
#     if len(idxs) > 0:
#         # loop over the indexes we are keeping
#         for i in idxs.flatten():
#             text = "{}: {:.4f}".format(LABELS[classIDs[i]], confidences[i])
#     return text

# def allowed_file(filename):
#     return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

app = Flask(__name__)

# @app.route("/")
# def hello():
#     return "Hello World!"

# @app.route("/detected_obj", methods=["POST"])
# def obj_det():
#     file = request.files['file']
#     if file and allowed_file(file.filename):
#         file.save("img.jpg")
#     c = CaptionBot()
#     c.file_caption('img.jpg')
#     image = cv2.imread("img.jpg")
#     labelsPath = "yolo_v3/coco.names"
#     cfgpath = "yolo_v3/yolov3-tiny.cfg"
#     wpath = "yolo_v3/yolov3-tiny.weights"
#     Lables = get_labels(labelsPath)
#     CFG = get_config(cfgpath)
#     Weights = get_weights(wpath)
#     nets = load_model(CFG,Weights)
#     Colors = get_colors(Lables)
#     res = get_prediction(image,nets,Lables,Colors)

#     return c + res

# @app.route("/detected_txt", methods=["POST"])
# def txt_det():
#     return "Text"

@app.route("/sos", methods=["POST"])
def sos():
    numbers = json.loads(request.data)['data']
    for num in numbers:
        sendMessage(num, "SOS EMERGENCY FROM BLIND PERSON")
    
    return "Success"
    
if __name__ == "__main__":
    app.run()
