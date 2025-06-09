variable "message_a" {
  description = "A message to include in the output file from Module A."
  type        = string
}

variable "output_filename_a" {
  description = "The filename for the output file from Module A."
  type        = string
  default     = "module_a_output.txt"
}
