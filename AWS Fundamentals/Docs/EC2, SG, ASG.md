## Elastic Compute Cloud 

Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers.

- https://aws.amazon.com/ec2/
- https://aws.amazon.com/ebs/
- https://aws.amazon.com/ec2/instance-types/

## AMI

Preconfigured templates for the creation of EC2 instances in the AWS environment – including an Operating System and often additional software.
Users can select an AMI provided by AWS, the user community, through the AWS marketplace or create own.
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html

## Auto Scaling Group

An Auto Scaling group contains a collection of Amazon EC2 instances that are treated as a logical grouping for the purposes of automatic scaling and management.

- https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html

An ASG has three main components:
- Groups – logical component. Webserver group or Application group or Database group etc
- Configuration templates – groups uses a launch template or launch configuration as a configuration template for its EC2 instances. You can specify information as the AMI ID, instance type, key pair, security groups, etc for your instances
- Scaling options – scaling options provides several ways for you to scale your ASGs. For example, you can configure a group to scale based on the occurrence of specified conditions (dynamic scaling or on a schedule.

Scaling options:
- Maintain current instance number at all times
- Scale manually
- Scale based on schedule
- Scale based on demand
- Use predictive scaling

    - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security-groups.html
    - https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html
    - https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchTemplates.html
    - https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html
    - https://aws.amazon.com/autoscaling/
    - https://aws.amazon.com/ec2/autoscaling/
    - https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html
    - https://docs.aws.amazon.com/autoscaling/latest/userguide/GettingStartedTutorial.html
    - https://docs.aws.amazon.com/autoscaling/latest/userguide/AutoScalingGroup.html
    - https://docs.aws.amazon.com/autoscaling/latest/userguide/WhatIsAutoScaling.html