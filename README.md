# express-simple-healthcheck-endpoint

1. Create IAM User
2. Add AWSCodeCommitFullAccess Policy to IAM User
3. Add AWSCodePipeline_FullAccess Policy to IAM User
4. Create Role for EC2 Instance to Access S3 Bucket (AmazonS3ReadOnlyAccess)
5. Create role for CodeDeploy (select role AWSCodeDeployRole)
6. Go to Policies
7. Create Policy and select JSON
8. Add the following policy to the JSON editor: (Create an IAM instance profile for your Amazon EC2 instances (console) - https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-iam-instance-profile.html#getting-started-create-iam-instance-profile-console)

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
```

9. Create EC2 Instance
10. In the IAM Role, select the role you created in step 4 (under Advanced Details)
11. Install the CodeDeploy Agent on the EC2 Instance (https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html)
    Enter the following commands in the user data section:

```
sudo apt update
sudo apt install ruby-full
sudo apt install wget
cd /home/ubuntu
https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
```

12. Add a tag to the EC2 Instance (Key: Name, Value: CodeDeployDemo)
13. Create a Security Group for the EC2 Instance (Inbound: HTTP, HTTPS, SSH)
14. Launch the EC2 Instance
15. Verify that the CodeDeploy Agent is running on the EC2 Instance

```
sudo service codedeploy-agent status
```

17. Create CodeDeploy Application
18. Select EC2/On-Premises
19. Create Deployment Group
20. Select the Code Deploy Role in the Service Role section
21. Select the EC2 Instance in the Environment Configuration section
22. Select The Key value pair tag in the Tags section (Key: Name, Value: CodeDeployDemo) made in step 12
23. Uncheck the Load Balancer if not required
24. Create a CodeDeploy Deployment Group
25. Create a CodePipeline
26. Select New Service Role
27. Select Github as the Source Provider
28. Connect to Github
29. Select the Repository
30. Select the Branch
31. Select Pipline Trigger (e.g. Push in a branch)
32. Select Skip Build Stage
33. Select CodeDeploy as the Deployment Provider
34. Select the Region
35. Select the CodeDeploy Application
36. Select the CodeDeploy Deployment Group
37. Select Next
38. Select Create Pipeline
39. The Pipeline will be created and the first deployment will be triggered
40. Go Pipeline view pipelines
