## AWS Management Console

- https://aws.amazon.com/console/
- https://aws.amazon.com/console/features/
- https://aws.amazon.com/console/faq-console/

## AWS Command line interface (CLI)

- https://aws.amazon.com/cli/
- https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
- https://docs.aws.amazon.com/cli/latest/userguide/welcome-versions.html

## AWS Identity and Access Management

- https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html

## AWS Users & Credentials

- Are the individual accounts.
- By default, new users don’t have access to any AWS services.
- Always set up MFA (Multifactor Authentication) on your root account.
- There are two ways to access AWS: Username + Password/ Access Key ID + Secret Access Key
- Username and Password
    - Cannot be used to interact with the API
    - Using for Sign in into AWS management console
- Access Key ID and Secret Access Key
    - Assigned on user creation
    - Can be used to interact via the AWS command line, SDKs, or APIs.
    - Not the same as Username and Password.
    - Can only be viewed once. If you lose them, they need to be regenerated. Save them in a secure location

## AWS Roles

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html

AWS Policies

- An IAM policy is a document which formally defines permissions, and can be attached to users, groups, and roles.
- The “PowerUserAccess” policy provides full access to AWS services and resources, but does not allow management of users and groups

## Put everything together

- You want to grant access to one user (rgederin) to AWS Dynamo DB tables via management console or CLI
    - You need to assign policy which allow Dynamo DB read/write access to the user rgederin
- You want to grant permissions to several users for using S3 storage
    - You need to create group, add there all users which needs to have S3 access and assign policy which allows S3 manipulations to this group
- You want to grant permission to your VM running in AWS (EC2) to push messages in AWS message queue (SQS)
    - You need to create AWS Role, than assign policy which allow access to SQS service to this role and then attach role to your VM (EC2 instance)
