include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../terraform_modules/rg"
}

inputs = {
    rg_name = "rg-dev-01"
    location = "centralindia"
}