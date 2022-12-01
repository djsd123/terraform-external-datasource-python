# Terraform External Datasource Python

Example [external Terraform data object](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/data_source) to fetch data from an API 

[terraform]: https://www.terraform.io/downloads
[python]: https://www.python.org/downloads

## Requirements

| Name        | Version |
|-------------|---------|
| [terraform] | ~> 1.2  |
| [python]    | ~> 3.10 |
| curl        | ~       |
| jq          | ~       |


## Usage

#### Set Up

1. Modify [versions.tf](version.tf) with your own state information. Local or otherwise
2. Ideally you would want to set up a virtual environment `python -m venv /path/to/virtual/environment`
3. Install requirements `python -m pip install -r requirements.txt`


#### Run Terraform


Init state
```shell
terraform init
```

Plan
```shell
terraform plan
```

Apply
```shell
terraform apply
```


## Outputs


| Name     | Description                            |
|----------|----------------------------------------|
| message  | The message value from the JSON object |
| html_url | The URL of the repo                    |


#### Notes

In practice [python] isn't the best choice for an external datasource as it will likely have dependencies best 
satisfied in a virtualenv making it less portable.
I'd recommend a simple shell script or a checked in static binary.
