from google.cloud import vision
import io
import os
import logging

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def process_image(image_path):
    try:
        client = vision.ImageAnnotatorClient()

        with io.open(image_path, 'rb') as image_file:
            content = image_file.read()

        image = vision.Image(content=content)
        response = client.label_detection(image=image)
        labels = response.label_annotations

        if not labels:
            logger.warning('No labels detected in the image.')
            return {
                'object_name': 'Unknown object',
                'detailed_description': 'No description available'
            }

        # Get the most likely object name
        object_name = labels[0].description if labels else "Unknown object"

        # Get a detailed description
        detailed_description = ", ".join([label.description for label in labels[:5]])

        logger.info(f'Image processed: object_name={object_name}, detailed_description={detailed_description}')
        
        return {
            'object_name': object_name,
            'detailed_description': detailed_description
        }

    except Exception as e:
        logger.exception('Error processing image')
        raise e
