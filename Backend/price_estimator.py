import openai

openai.api_key = 'your-openai-api-key'

def estimate_price(description):
    prompt = f"Estimate the price of the following item: {description['object_name']}. Additional details: {description['detailed_description']}. Provide a single numeric value in USD."

    response = openai.Completion.create(
        engine="text-davinci-002",
        prompt=prompt,
        max_tokens=50,
        n=1,
        stop=None,
        temperature=0.5,
    )

    estimated_price = response.choices[0].text.strip()
    
    # Extract numeric value from the response
    try:
        price = float(''.join(filter(str.isdigit, estimated_price)))
        return f"${price:.2f}"
    except ValueError:
        return "Unable to estimate price"