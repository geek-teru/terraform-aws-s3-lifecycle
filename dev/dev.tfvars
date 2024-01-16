
# for development

# ------------------------------------------------------
# common
# ------------------------------------------------------
env = "dev"

# ------------------------------------------------------
# s3
# ------------------------------------------------------
s3_bucket = [
  { name = "geek-teru-bucket-dev"},
  { name = "geek-teru-bucket-test"},
]

bucket_lifecycle_rule = [
  {
    bucket = "geek-teru-bucket-dev", 
    lifecycle_rule = [
      { name = "delete on weekly", prefix = "dev/", days = "7", object_size_greater_than = 1 }
    ]
  },
  {
    bucket = "geek-teru-bucket-test", 
    lifecycle_rule = [
      { name = "delete on weekly", prefix = "", days = "7", object_size_greater_than = 1 }
    ]
  }
]