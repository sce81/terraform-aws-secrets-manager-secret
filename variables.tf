variable "name" {}
variable "env"  {}
variable "kms_key_id"   {}
variable "extra_tags" {
  type    = map(any)
  default = {}
}
variable "secret_string"    {
  default = "PLACEHOLDER-SECRET"
}