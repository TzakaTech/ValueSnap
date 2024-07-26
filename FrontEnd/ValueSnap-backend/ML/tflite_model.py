import tensorflow as tf
import logging
import sys

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def convert_model(saved_model_dir, tflite_model_path):
    try:
        # Load the saved model
        model = tf.saved_model.load(saved_model_dir)
        logger.info(f'Model loaded from {saved_model_dir}')
        
        # Convert the model to TensorFlow Lite
        converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
        tflite_model = converter.convert()
        logger.info('Model converted to TensorFlow Lite')
        
        # Save the TensorFlow Lite model
        with open(tflite_model_path, 'wb') as f:
            f.write(tflite_model)
        logger.info(f'TensorFlow Lite model saved to: {tflite_model_path}')
    except Exception as e:
        logger.exception('Error during model conversion')
        raise e

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python tflite_model.py <saved_model_dir> <tflite_model_path>")
        sys.exit(1)
    
    saved_model_dir = sys.argv[1]
    tflite_model_path = sys.argv[2]
    
    try:
        convert_model(saved_model_dir, tflite_model_path)
    except Exception as e:
        logger.error(f'Failed to convert model: {e}')
        sys.exit(1)
