from flask import Flask, request, jsonify
import tensorflow as tf
import cv2
import numpy as np

app = Flask(__name__)

# Load YOLOv5 object detection model
yolov5_model = tf.lite.Interpreter(model_path="best-fp16.tflite")
yolov5_model.allocate_tensors()

# Load text recognition model
text_recognition_model = tf.lite.Interpreter(model_path="text_recognition.tflite")
text_recognition_model.allocate_tensors()

@app.route('/process_prescription', methods=['POST'])
def process_prescription():
    # Receive prescription image from Flutter app
    prescription_image = request.files['prescription_image']
    img = cv2.imdecode(np.fromstring(prescription_image.read(), np.uint8), cv2.IMREAD_COLOR)
    
    # Preprocess image (resize, normalize, etc.)
    # Perform object detection using YOLOv5
    # Extract regions of interest (ROIs)
    rois = []

    # Perform text recognition on ROIs using text recognition model
    extracted_info = []

    # Send extracted prescription information to Firebase database
    # Example: firebase_db.collection('prescriptions').add(extracted_info)

    return jsonify({"extracted_info": extracted_info})

if __name__ == '__main__':
    app.run(debug=True)
