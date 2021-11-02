import os
# environment variables
os.environ["SLACK_APP_TOKEN"] = ""
os.environ["SLACK_BOT_TOKEN"] = ""
# To Verify above code
os.environ.get("SLACK_APP_TOKEN")
os.environ.get("SLACK_BOT_TOKEN")    