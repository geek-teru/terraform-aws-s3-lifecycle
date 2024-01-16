# ------------------------------------------------------
# main
# ------------------------------------------------------

module "s3_bucket" {
  for_each = { for item in var.s3_bucket : item.name => item }
    source = "../modules/s3"
    s3_bucket = each.value
}

module "bucket_lifecycle_rule" {
  for_each = { for item in var.bucket_lifecycle_rule : item.bucket => item }
    source = "../modules/bucket_lifecycle_rule"
    bucket = each.value["bucket"]
    bucket_lifecycle_rule = each.value["lifecycle_rule"]
}
