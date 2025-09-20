#!/bin/bash
apt update -y
apt install -y python3 python3-pip git

cd /home/ubuntu

# Clone your repo (optional)
git clone https://github.com/satishreddy339/expense_tracker.git

cd expense-tracker/app
pip3 install -r requirements.txt

# Run Flask in background
nohup python3 app.py > app.log 2>&1 &