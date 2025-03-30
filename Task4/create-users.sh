#!/bin/bash

# Создание сертификатов для пользователей
mkdir -p certs

# backend - viewer
openssl genrsa -out certs/backend.key 2048
openssl req -new -key certs/backend.key -out certs/backend.csr -subj "/CN=backend/O=backend-team"
openssl x509 -req -in certs/backend.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out certs/backend.crt -days 365

# frontend - viewer
openssl genrsa -out certs/frontend.key 2048
openssl req -new -key certs/frontend.key -out certs/frontend.csr -subj "/CN=frontend/O=frontend-team"
openssl x509 -req -in certs/frontend.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out certs/frontend.crt -days 365

# devops - operator
openssl genrsa -out certs/devops.key 2048
openssl req -new -key certs/devops.key -out certs/devops.csr -subj "/CN=devops/O=dev-ops"
openssl x509 -req -in certs/devops.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out certs/devops.crt -days 365

echo "Пользователи созданы. Файлы сертификатов в ./certs"
