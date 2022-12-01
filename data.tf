# With Python
# Pass an API URL and headers to return an object.  Note: Does not handle collections of objects

data "external" "fetch_data_py" {
  # Note: If run in a virtual environment. It might be best to use the virtualenv's python binary
  # i.e. program = ["virtualenv-directory/bin/python", "${path.root}/fetch-data.py"]
  #
  # Example of a auth header:
  # headers = "Authorization: Bearer <YOUR-TOKEN>"

  program = ["python", "${path.root}/fetch-data.py"]

  query = {
    api_url = "https://api.github.com/repos/djsd123/equal-experts"
    headers = ""
  }
}

output "message" {
  value = data.external.fetch_data_py.result.name
}

# With Bash Script
# Queries a GitHub user's repos and returns a repo selected by name

data "external" "fetch_data_sh" {
  program = ["bash", "${path.root}/fetch-data.sh"]

  query = {
    repo_name = "amazon-certificate-manager"
    user_name = "djsd123"
  }
}

output "html_url" {
  value = data.external.fetch_data_sh.result.html_url
}
