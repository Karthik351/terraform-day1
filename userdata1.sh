#!/bin/bash
# Update packages
apt update -y
apt upgrade -y

# Install Apache
apt install apache2 -y

# Start and enable Apache service
systemctl start apache2
systemctl enable apache2

# Create a simple webpage
echo "<html>
<head>
    <title>Welcome to My EC2 Instance</title>
</head>
<body>
    <h1>This is karthik!</h1>
    <p>This is a sample webpage hosted on an EC2 instance running Ubuntu.</p>
</body>
</html>" > /var/www/html/index.html

# Ensure the correct permissions
chmod 644 /var/www/html/index.html
