
import tensorflow as tf

def convert_model(saved_model_dir, tflite_model_path):
    # Load the saved model
    model = tf.saved_model.load(saved_model_dir)
    
    # Convert the model to TensorFlow Lite
    converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
    tflite_model = converter.convert()
    
    # Save the TensorFlow Lite model
    with open(tflite_model_path, 'wb') as f:
        f.write(tflite_model)
    
    print(f'TensorFlow Lite model saved to: {tflite_model_path}')

if __name__ == "__main__":
    saved_model_dir = 'path_to_saved_model'
    tflite_model_path = 'path_to_save_tflite_model/model.tflite'
    convert_model(saved_model_dir, tflite_model_path)
