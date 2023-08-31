#!/usr/bin/env python3

from pathlib import Path
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request

SCOPES = 'https://www.googleapis.com/auth/gmail.labels'
DIR = Path(__file__).resolve().parent
CLIENT_SECRETS_PATH = Path(DIR, 'client_secrets.json')
CREDENTIALS_PATH = Path(DIR, 'credentials.json')

if Path(CREDENTIALS_PATH).is_file():
    creds = Credentials.from_authorized_user_file(CREDENTIALS_PATH)
    if creds.expired and creds.refresh_token:
        creds.refresh(Request())
    else:
        print('Credentials look OK, try to remove credentials.json if something doesn\'t work')
        exit()
else:
    flow = InstalledAppFlow.from_client_secrets_file(CLIENT_SECRETS_PATH, scopes=SCOPES)
    creds = flow.run_local_server(open_browser=False)

# Save credentials
with open(CREDENTIALS_PATH, 'w') as creds_file:
    creds_file.write(creds.to_json())
print('Credentials saved successfully')
