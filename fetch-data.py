from terraform_external_data import terraform_external_data

import requests

requests.packages.urllib3.disable_warnings()


@terraform_external_data
def fetch_data(query):
    try:
        api_url = query['api_url']
        headers = query['headers']

        response = requests.get(api_url, headers=headers).json()

        return {str(key): str(value) for key, value in response.items()}
    except (TypeError, KeyError):
        return TypeError, KeyError

if __name__ == '__main__':
    fetch_data()
