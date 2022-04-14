# USAGE

How to connect to our  instance 

Our key is in S3 bucket 

Download the key from s3 to your local  

# COMMAND
```hcl
aws s3 cp s3://shis3bucket/shi_key.pem .
```
# CONNECT

```hcl
ssh -i "shi_key.pem" ec2-user@ec2-34-229-66-38.compute-1.amazonaws.com
```
provide the letest ip for the instance 
