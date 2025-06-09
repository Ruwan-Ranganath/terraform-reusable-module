
output "file_a_content" {
  value       = local_file.example_file_a.content
  description = "The content written to the file by Module A."
}

output "file_a_path" {
  value       = local_file.example_file_a.filename
  description = "The absolute path of the file created by Module A."
}
