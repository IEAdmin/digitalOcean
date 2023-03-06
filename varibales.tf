variable "dropletName" {
  type = string
}
variable "dropletImage" {
  type = string
}
variable "dropletRegion" {
  type = string
}
variable "dropletSize" {
  type = string
}
variable "dropletInlineProvisioner" {
  type = list(string)
}
variable "sshKeyPath" {
  type = string
}
variable "sshKeyName" {
  type = string
}
variable "htmlSourceLocation" {
  type = string
}
variable "htmlDestinationLocation" {
  type = string
}
variable "privateKeyPath" {
  type = string
}
variable "dropletUserName" {
  type = string
}
variable "do_token" {
  type = string
}
