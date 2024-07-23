from google.cloud import vision
import io

def process_image(image_path):
    client = vision.ImageAnnotatorClient()

    with io.open(image_path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)
    response = client.label_detection(image=image)
    labels = response.label_annotations

    # Get the most likely object name
    object_name = labels[0].description if labels else "Unknown object"

    # Get a detailed description
    detailed_description = ", ".join([label.description for label in labels[:5]])

    return {
        'object_name': object_name,
        'detailed_description': detailed_description
    }
