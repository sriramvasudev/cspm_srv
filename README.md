# cspm_srv
how to connect the ec2 instances with the help of putty, 
 ref: https://asf.alaska.edu/how-to/data-recipes/connect-to-your-ec2-instance-using-putty-v1-1/
 Very first time you may encounter this error --- so be careful to follow the below steps 
 <<<
 ref: https://stackoverflow.com/questions/24587443/aws-disconnected-no-supported-authentication-methods-available-server-sent
Download putty and puttygen, or the putty package and install it.
Get the .pem file from your AWS EC2 instance.
Use puttygen to convert the .pem file so that you'll have a private key --- mistake happened here. I chose "Conversions" tab from PuttyGen, and load my .pem file. After loading pem file, here DO NOT hit "Generate", instead directly "Save private key". That's the key you need. If you click Generate, you'll have a totally different pair of keys.
In putty, use ec2-user@your.public.dns.that.you.get.from.aws.ec2.instance, and load the private key at SSH/Auth
 >>>
how to download the pem file for the ec2 instances in the aws 
 ref: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html
