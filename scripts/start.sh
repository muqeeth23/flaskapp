#!/bin/bash
set +x
# Navigate to app directory
cd /home/ec2-user/flaskapp

# Install Python dependencies
pip3 install -r requirements.txt

# Kill any process running on port 80 (optional but safe for redeploy)
fuser -k 5000/tcp || true

# Run the Flask app in the background
nohup python3 app.py > app.log 2>&1

