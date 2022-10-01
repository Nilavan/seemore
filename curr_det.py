from utils import *
import os

path="/home/stripan/Blind-AI-Backend/"

def configure_path(file):
	return os.path.join(path,"currency-detection","currencies", file)

def currency_det(image):
	max_val = 8
	max_pt = -1
	max_kp = 0
	res = ''

	orb = cv2.ORB_create()
	test_img = image

	# resizing must be dynamic
	original = resize_img(test_img, 0.4)

	# keypoints and descriptors
	(kp1, des1) = orb.detectAndCompute(test_img, None)
	training_set = [configure_path("20.jpg"), configure_path("50.jpg"), configure_path("100.jpg"), configure_path("500.jpg")]



	for i in range(0, len(training_set)):
		# train image
		train_img = cv2.imread(training_set[i])

		(kp2, des2) = orb.detectAndCompute(train_img, None)

		# brute force matcher
		bf = cv2.BFMatcher()
		all_matches = bf.knnMatch(des1, des2, k=2)

		good = []
		# give an arbitrary number -> 0.789
		# if good -> append to list of good matches
		for (m, n) in all_matches:
			if m.distance < 0.789 * n.distance:
				good.append([m])

		if len(good) > max_val:
			max_val = len(good)
			max_pt = i
			max_kp = kp2

	if max_val != 8:
		train_img = cv2.imread(training_set[max_pt])
		img3 = cv2.drawMatchesKnn(test_img, kp1, train_img, max_kp, good, 4)

		note = str(training_set[max_pt])[6:-4]
		res = 'Detected note of rupees ' + str(note.split('/')[-1])
	else:
		res = 'Fake currency'
	return res