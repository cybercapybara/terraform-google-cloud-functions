# terraform-google-cloud-functions

Terraform module that manages a [Google Cloud](https://cloud.google.com/)
2nd generation Cloud Function (`google_cloudfunctions2_function`). It builds the
function from a source archive in Cloud Storage and runs it on Cloud Run.

## Usage

```hcl
module "function" {
  source = "github.com/cybercapybara/terraform-google-cloud-functions"

  project_id    = var.project_id
  name          = "processor"
  location      = "us-central1"
  runtime       = "python312"
  entry_point   = "handle"
  source_bucket = google_storage_bucket.source.name
  source_object = "source.zip"
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name                    | Description                                              | Type          | Default      | Required |
|-------------------------|----------------------------------------------------------|---------------|--------------|:--------:|
| `project_id`            | ID of the project in which to create the function.       | `string`      | n/a          |   yes    |
| `name`                  | Name of the Cloud Function.                              | `string`      | n/a          |   yes    |
| `location`              | Region in which to deploy the function.                  | `string`      | n/a          |   yes    |
| `runtime`               | Runtime to run the function.                             | `string`      | `"nodejs20"` |    no    |
| `entry_point`           | Name of the function executed in the source.             | `string`      | n/a          |   yes    |
| `source_bucket`         | Bucket holding the source archive.                       | `string`      | n/a          |   yes    |
| `source_object`         | Object path of the source archive.                       | `string`      | n/a          |   yes    |
| `available_memory`      | Memory available to the function.                        | `string`      | `"256M"`     |    no    |
| `max_instance_count`    | Maximum number of function instances.                    | `number`      | `100`        |    no    |
| `environment_variables` | Environment variables passed to the function.            | `map(string)` | `{}`         |    no    |
| `labels`                | Labels applied to the function.                          | `map(string)` | `{}`         |    no    |

## Outputs

| Name   | Description                                              |
|--------|----------------------------------------------------------|
| `id`   | Identifier of the Cloud Function.                       |
| `name` | Name of the Cloud Function.                             |
| `uri`  | URI of the underlying Cloud Run service.                |

## License

[MIT](LICENSE)
