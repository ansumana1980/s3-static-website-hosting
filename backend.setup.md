# Use the AWSCLI to run the code to create the bucket first

1. Create the bucket
# Create the S3 bucket for Terraform state management using AWS CLI or AWS Console before running Terraform. This bucket will be used to store the Terraform state file securely and reliably
aws s3api create-bucket \
  --bucket ansu-s3-static-website-state \
  --region us-east-1

2. Enable versioning 
# Enable versioning for the S3 bucket backend to ensure that you can recover previous versions of the state file if needed.
aws s3api put-bucket-versioning \
  --bucket ansu-s3-static-website-state \
  --versioning-configuration Status=Enabled

3. Block public access
# Block public access to the S3 bucket to prevent unauthorized access to the Terraform state file, which may contain sensitive information.
aws s3api put-public-access-block \
  --bucket ansu-s3-static-website-state \
  --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

4. Optionally, set up a DynamoDB table
# Set up a DynamoDB table for state locking to prevent concurrent modifications to the state file, which can lead to corruption.
aws dynamodb create-table \
  --table-name ansu-s3-static-websit-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
