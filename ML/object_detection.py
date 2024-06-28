# ml/object_detection.py

import tensorflow as tf
import numpy as np
from PIL import Image

def load_image(image_path):
    img = Image.open(image_path)
    img = img.resize((300, 300))  # resize to model input size
    img = np.array(img, dtype=np.float32)
    img = np.expand_dims(img, axis=0)
    return img

def run_object_detection(tflite_model_path, image_path):
    # Load the TensorFlow Lite model
    interpreter = tf.lite.Interpreter(model_path=tflite_model_path)
    interpreter.allocate_tensors()
    
    # Get input and output tensors
    input_details = interpreter.get_input_details()
    output_details = interpreter.get_output_details()
    
    # Load image
    input_data = load_image(image_path)
    
    # Perform inference
    interpreter.set_tensor(input_details[0]['index'], input_data)
    interpreter.invoke()
    
    # Get results
    output_data = interpreter.get_tensor(output_details[0]['index'])
    print('Object detection result:', output_data)

if __name__ == "__main__":
    tflite_model_path = 'path_to_tflite_model/model.tflite'
    image_path = 'path_to_image/image.jpg'
    run_object_detection(tflite_model_path, image_path)
