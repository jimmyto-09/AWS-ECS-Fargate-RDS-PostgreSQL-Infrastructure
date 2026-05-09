# AWS ECS Fargate + RDS PostgreSQL Infrastructure

This project demonstrates a **production-ready AWS cloud infrastructure**
built using **Terraform** and AWS managed services.

The architecture leverages **ECS Fargate**, **Docker**, **RDS PostgreSQL**,  
**Application Load Balancer**, **Amazon Route 53**, **AWS Certificate Manager (ACM)**  
and **CloudWatch** following AWS best practices.

---

## Architecture

```text
User
  ↓
Amazon Route 53 (DNS)
  ↓
Application Load Balancer (HTTPS)
  ↓
ECS Fargate Service
  ↓
Dockerized Application
  ↓
Amazon RDS PostgreSQL (Private Subnets)
```

---

## Key Characteristics

- HTTPS enabled using AWS Certificate Manager
- HTTP → HTTPS redirection enforced at the Load Balancer level
- Load-balanced containerized application using ECS Fargate
- RDS PostgreSQL deployed in private subnets
- Centralized logging with CloudWatch
- Infrastructure managed entirely with Terraform

---

## Technologies Used

- Terraform – Infrastructure as Code (IaC)
- AWS ECS Fargate – Serverless container orchestration
- AWS RDS PostgreSQL – Managed relational database
- AWS Application Load Balancer (ALB)
- Amazon Route 53 – DNS
- AWS Certificate Manager (ACM) – SSL/TLS certificates
- Docker – Application containerization
- Node.js + Express – Backend API
- CloudWatch Logs – Observability and logging

---

## Project Structure

```text

.
├── acm.tf              # SSL certificate (ACM)
├── ecr.tf              # ECR repository for the Docker image
├── ecs.tf              # ECS Cluster, Task Definition and Service
├── https.tf            # HTTPS listener (ALB)
├── lb.tf               # Application Load Balancer and Target Group
├── provider.tf         # AWS provider configuration
├── rds.tf              # PostgreSQL RDS instance
├── route53.tf          # Route 53 Hosted Zone
├── route53-record.tf  # DNS record (ALIAS → ALB)
├── sg.tf               # Security Groups
├── vpc.tf              # VPC, subnets and networking
├── .terraform.lock.hcl # Provider dependency lock file
├── app/
│   ├── src/
│   ├── Dockerfile
│   ├── package.json
│   └── package-lock.json
├── .gitignore
└── README.md
```

---

## Application Endpoints

### Base URL

```text
https://jimmyto09.site
```

### Example Endpoints

- `/health` → Service health check
- `/db-check` → PostgreSQL connectivity check
- `/users` → Example API endpoint

---

## Deployment

### Initialize Terraform

```bash
terraform init
```

### Validate configuration

```bash
terraform validate
```

### Review infrastructure plan

```bash
terraform plan
```

### Deploy infrastructure

```bash
terraform apply
```

---

## Docker Deployment

### Login to Amazon ECR

```bash
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.eu-west-1.amazonaws.com
```

### Build Docker image

```bash
docker build -t proyecto7-app ./app
```

### Tag Docker image

```bash
docker tag proyecto7-app:latest <ACCOUNT_ID>.dkr.ecr.eu-west-1.amazonaws.com/proyecto7-app:latest
```

### Push Docker image

```bash
docker push <ACCOUNT_ID>.dkr.ecr.eu-west-1.amazonaws.com/proyecto7-app:latest
```

---

## CloudWatch Logs

Application logs are available in:

```text
CloudWatch → Log Groups → /ecs/proyecto7-app
```

---

## Project Status

- ✅ Completed
- ✅ Infrastructure stable
- ✅ HTTPS enabled
- ✅ Database connected
- ✅ Ready for production-style demonstration

---

## Security Notes

Database credentials included in this project are for demonstration purposes only.

In a real production environment, credentials should be managed using:

- AWS Secrets Manager
- Secure environment variables
- IAM roles with least-privilege access

This project prioritizes architectural clarity and learning.

---

## Author

**Jimmy Castillo**

Personal cloud infrastructure project built with AWS and Terraform for learning
and technical demonstration purposes.
