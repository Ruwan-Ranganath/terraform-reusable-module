resource "local_file" "example_file_a" {
  content  = "This content is from Module A. Input message: ${var.message_a}"
  filename = "${path.cwd}/${var.output_filename_a}"
}
