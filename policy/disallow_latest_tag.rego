package docker.policy

deny[msg] {
  input.Dockerfile
  contains(input.Dockerfile, "FROM ")
  re_match(`(?i)FROM\s+\S+:latest`, input.Dockerfile)
  msg := "Do not use :latest tag in base image"
}
