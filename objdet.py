#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#----------------------------------------------------------------------------
# Created By  : A NILAVAN
# Created Date: 27/02/2023
# version ='2.0'
# ---------------------------------------------------------------------------

import cv2
import os
import numpy as np

INPUT_WIDTH = 640
INPUT_HEIGHT = 640
SCORE_THRESHOLD = 0.2
NMS_THRESHOLD = 0.4
CONFIDENCE_THRESHOLD = 0.4

yolo_path = "./yolo_v5" 
path = "./" 

# =========== Distance config ==========
Known_distance = 44
Known_width = 33.782

def focal_length_finder(measured_distance, real_width, width_in_rf_image):
	# finding the focal length
	focal_length = (width_in_rf_image * measured_distance) / real_width
	return focal_length

def distance_finder(Focal_Length, real_face_width, face_width_in_frame):
    # distance estimation function
	distance = (real_face_width * Focal_Length)/face_width_in_frame
	return distance

# =========== Yolo ==========

def load_classes(labels_path):
    lpath = os.path.sep.join([yolo_path, labels_path])
    class_list = open(lpath).read().strip().split("\n")
    return class_list

def build_model(yolo_path, model_file):
    model_path = os.path.sep.join([yolo_path, model_file])
    net = cv2.dnn.readNet(model_path)
    net.setPreferableBackend(cv2.dnn.DNN_BACKEND_OPENCV)
    net.setPreferableTarget(cv2.dnn.DNN_TARGET_CPU)
    return net

def format_yolov5(frame):
    row, col, _ = frame.shape
    _max = max(col, row)
    result = np.zeros((_max, _max, 3), np.uint8)
    result[0:row, 0:col] = frame
    return result

def get_prediction(input_image, net, class_list):
    class_ids = []
    confidences = []
    boxes = []
    res = ''
    laptop_widths = []
    blob = cv2.dnn.blobFromImage(input_image, 1/255.0, (INPUT_WIDTH, INPUT_HEIGHT), swapRB=True, crop=False)
    net.setInput(blob)
    output_data = net.forward()[0]

    rows = output_data.shape[0]

    image_width, image_height, _ = input_image.shape

    x_factor = image_width / INPUT_WIDTH
    y_factor =  image_height / INPUT_HEIGHT

    for r in range(rows):
        row = output_data[r]
        confidence = row[4]
        if confidence >= 0.4:
            classes_scores = row[5:]
            _, _, _, max_indx = cv2.minMaxLoc(classes_scores)
            class_id = max_indx[1]
            if (classes_scores[class_id] > .25):

                confidences.append(confidence)

                class_ids.append(class_id)

                x, y, w, h = row[0].item(), row[1].item(), row[2].item(), row[3].item() 
                left = int((x - 0.5 * w) * x_factor)
                top = int((y - 0.5 * h) * y_factor)
                width = int(w * x_factor)
                height = int(h * y_factor)
                box = np.array([left, top, width, height])
                boxes.append(box)

    indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.25, 0.45) 

    objs_found = set()
    
    # ensure at least one detection exists
    if len(indexes) > 0:
        # loop over the indexes we are keeping
        for i in indexes.flatten():
            # extract the bounding box coordinates
            (x, y) = (boxes[i][0], boxes[i][1])
            (w, h) = (boxes[i][2], boxes[i][3])
            # res = res + class_list[class_ids[i]]+', '
            objs_found.add(class_list[class_ids[i]])
            if class_list[class_ids[i]] == 'laptop':
                laptop_widths += [w]
    for obj in objs_found:
        res += obj + ', '
    if res == '':
        res = 'Try again, nothing '
    return res + 'found', laptop_widths