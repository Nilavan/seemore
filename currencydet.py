#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#----------------------------------------------------------------------------
# Created By  : A NILAVAN
# Created Date: 27/02/2023
# version ='2.0'
# ---------------------------------------------------------------------------

import numpy as np
import cv2
import mahotas
import sys
import pickle
import joblib

# Configure file paths and parameters
BOVW="./currency_model/bovw_codebook_600.pickle"
MODEL='./currency_model/rfclassifier_600.sav'
IMG_SIZE=320

# Hu Moments
def fd_hu_moments(image):
    image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    feature = cv2.HuMoments(cv2.moments(image)).flatten()
    return feature

# Haralick Texture
def fd_haralick(image):
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    haralick = mahotas.features.haralick(gray).mean(axis=0)
    return haralick

# Color Histogram
def fd_histogram(image):
    image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
    bins=8
    hist  = cv2.calcHist([image], [0, 1, 2], None, [bins, bins, bins], [0, 256, 0, 256, 0, 256])
    cv2.normalize(hist, hist)
    return hist.flatten()

# SIFT Bag of Visual Words
def feature_extract(im):
    # Load the BOVW codebook
    pickle_in = open(BOVW,"rb")
    dictionary = pickle.load(pickle_in)

    # Initialize SIFT BOW image descriptor extractor
    sift2 = cv2.SIFT_create()
    bowDiction = cv2.BOWImgDescriptorExtractor(sift2, cv2.BFMatcher(cv2.NORM_L2))
    bowDiction.setVocabulary(dictionary)

    gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
    sift = cv2.SIFT_create()
    feature = bowDiction.compute(gray, sift.detect(gray))
    return feature.squeeze()

def currency_det(image):
    # Load the trained model and input image
    loaded_model = joblib.load(MODEL)

    # Resize the image
    (height, width, channel) = image.shape
    resize_ratio = 1.0 * (IMG_SIZE / max(width, height))
    target_size = (int(resize_ratio * width), int(resize_ratio * height))
    input_image = cv2.resize(image, target_size)

    # cv2.imwrite("res_img.png",input_image)

    # Class-label dictionary
    label= {0:"10", 1:"20", 2:"50", 3:"100", 4:"200", 5:"500" , 6:"2000"}

    # Extract the features
    Hu=fd_hu_moments(input_image)
    Harl=fd_haralick(input_image)
    Hist=fd_histogram(input_image)
    Bovw=feature_extract(input_image)

    # Generate a feature vector by combinig all features
    mfeature= np.hstack([Hu, Harl, Hist, Bovw])

    # Predict the output using trainded model
    output = loaded_model.predict_proba(mfeature.reshape((1,-1)))[0]
    index = np.argmax(output)
    conf = np.max(output)
    print(conf, label[index])
    if conf > 0.1:
        return str(label[index]) + " rupees"
    return "Try again, nothing found."