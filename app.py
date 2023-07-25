import boto3
client = boto3.client('ec2',region_name='us-east-1')
resp = client.describe_vpcs().get('Vpcs',[])
for vpc in resp:
    print(vpc['VpcId'],'---->',vpc['CidrBlock'])