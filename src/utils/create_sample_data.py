import os
import json
import pandas as pd
from pathlib import Path

def create_sample_json(csv_path, output_dir, sample_size=10):
    """
    Create a sample JSON file from a CSV file.
    
    Args:
        csv_path (str): Path to the CSV file
        output_dir (str): Directory to save the sample JSON file
        sample_size (int): Number of rows to include in the sample
    """
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)
    
    # Get the base filename without extension
    # (Create output filename by adding 'sample_' prefix)
    base_name = os.path.basename(csv_path).replace('.csv', '')
    output_path = os.path.join(output_dir, f'sample_{base_name}.json')
    
    try:
        # Read the CSV file into a pandas df
        df = pd.read_csv(csv_path, encoding='utf-8')
        
        # Take a sample of the data (default is 10 rows)
        sample_df = df.sample(min(sample_size, len(df)))
        
        # Convert to list of dictionaries (JSON serializable)
        records = sample_df.to_dict('records')
        
        # Write to JSON file with proper indentation
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(records, f, indent=2, ensure_ascii=False)

       
        # with open(...) as f: - Safely opens and automatically closes the file
        # 'w' - Opens the file in write mode (overwrites if exists)
        # encoding='utf-8' - Handles special characters correctly
        # json.dump() - Converts Python objects to JSON format
        # indent=2 - Makes the output file human-readable
        # ensure_ascii=False - Preserves non-English characters
            
        print(f"Created sample: {output_path}")
        return True
        
    except Exception as e:
        print(f"Error processing {csv_path}: {str(e)}")
        return False

def main():
    # Define input and output paths
    data_dir = Path('../data/raw')  # Relative to script location
    output_dir = Path('../data/output/samples')  # Relative to script location
    
    # Create output directory if it doesn't exist
    output_dir.mkdir(parents=True, exist_ok=True)
    
    # List of CSV files to process
    csv_files = [
        'olist_customers_dataset.csv',
        'olist_geolocation_dataset.csv',
        'olist_order_items_dataset.csv',
        'olist_order_payments_dataset.csv',
        'olist_order_reviews_dataset.csv',
        'olist_orders_dataset.csv',
        'olist_products_dataset.csv',
        'olist_sellers_dataset.csv',
        'product_category_name_translation.csv'
    ]
    
    # Processing loop

    # Counter for successful conversions
    success_count = 0

    # Process each csv file
    for csv_file in csv_files:
        # Create full path to csv file
        csv_path = data_dir / csv_file

        # Check if file exists
        if csv_path.exists():
            # If create_sample_json returns True, increment counter
            if create_sample_json(csv_path, output_dir, sample_size=10):
                success_count += 1
        else:
            print(f"File not found: {csv_path}")
    
    # print summary
    print(f"\nSuccessfully created {success_count} sample files in {output_dir}")

# run the main function if this script is run as the main program
if __name__ == "__main__":
    main()
