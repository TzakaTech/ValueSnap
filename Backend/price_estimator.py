import openai
import os
import logging

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Set the OpenAI API key from environment variable
openai.api_key = os.getenv('OPENAI_API_KEY')

def estimate_price(description):
    prompt = (f"Estimate the price of the following item: {description['object_name']}. "
              f"Additional details: {description['detailed_description']}. "
              f"Provide a single numeric value in USD.")

    try:
        response = openai.Completion.create(
            engine="text-davinci-002",
            prompt=prompt,
            max_tokens=50,
            n=1,
            stop=None,
            temperature=0.5,
        )

        estimated_price = response.choices[0].text.strip()
        logger.info(f'OpenAI response: {estimated_price}')
        
        # Extract numeric value from the response
        price = float(''.join(filter(lambda x: x.isdigit() or x == '.', estimated_price.split()[0])))
        return f"${price:.2f}"
    except Exception as e:
        logger.exception('Error estimating price')
        return "Unable to estimate price"
