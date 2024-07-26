import os
import uuid
import logging
from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
from image_processor import process_image
from price_estimator import estimate_price

app = Flask(__name__)

UPLOAD_FOLDER = os.getenv('UPLOAD_FOLDER', 'uploads')
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/process_image', methods=['POST'])
def process_image_route():
    if 'image' not in request.files:
        logger.error('No image file provided')
        return jsonify({'error': 'No image file provided'}), 400
    
    file = request.files['image']
    
    if file.filename == '':
        logger.error('No selected file')
        return jsonify({'error': 'No selected file'}), 400
    
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        unique_filename = f"{uuid.uuid4()}_{filename}"
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], unique_filename)
        
        try:
            file.save(filepath)
            logger.info(f'File saved to {filepath}')
            
            # Process the image and get description
            description = process_image(filepath)
            logger.info(f'Image processed: {description}')
            
            # Estimate the price based on the description
            estimated_price = estimate_price(description)
            logger.info(f'Estimated price: {estimated_price}')
            
            response = {
                'objectName': description.get('object_name', 'Unknown'),
                'description': description.get('detailed_description', 'No description available'),
                'estimatedValue': estimated_price
            }
            
            return jsonify(response)
        except Exception as e:
            logger.exception('Error processing image')
            return jsonify({'error': str(e)}), 500
        finally:
            os.remove(filepath)
            logger.info(f'File {filepath} removed')
    
    logger.error('Invalid file type')
    return jsonify({'error': 'Invalid file type'}), 400

if __name__ == '__main__':
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)
    app.run(debug=True)
