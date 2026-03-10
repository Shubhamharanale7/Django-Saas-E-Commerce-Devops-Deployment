# Django Multi-Tenant SaaS E-Commerce — DevOps Deployment

![image](https://raw.githubusercontent.com/Shubhamharanale7/Django-Saas-E-Commerce-Devops-Deployment/main/media/Screenshot.png)

**Built by:** [Shubham Haranale](https://github.com/Shubhamharanale7)

## Introduction

A production-ready **Django Multi-Tenant SaaS E-Commerce** application with full DevOps automation. This project covers the complete deployment pipeline — from local development to AWS EC2 using Terraform, Docker, Kubernetes, Jenkins CI/CD, SonarQube, and Trivy security scanning.

## 🛡️ DevSecOps Enhancements

This project follows strict DevSecOps principles:

1. **Production Web Servers:** Uses **Gunicorn** as WSGI server behind an **Nginx** reverse proxy for TLS/SSL termination and DDoS protection — never `runserver` in production.
2. **Secrets Management:** Django `SECRET_KEY`, `DEBUG`, and database credentials are never hardcoded. All sensitive values are injected at runtime via environment variables or AWS Secrets Manager.
3. **Stripe Integration:** Payment API keys are loaded securely via environment variables using `os.environ.get('STRIPE_SECRET_KEY')`.

## Features

- Multi-Tenant SaaS architecture with isolated schemas per tenant
- E-Commerce with products, orders, payments (Stripe integration)
- RESTful API with Django REST Framework
- GraphQL API support
- Celery + Redis for async task processing
- Docker & Docker Compose for containerization
- Kubernetes deployment on AWS EKS
- CI/CD with Jenkins and GitHub Actions
- SonarQube code quality analysis
- Trivy container vulnerability scanning
- Terraform for AWS infrastructure provisioning
- Prometheus + Grafana monitoring
- Swagger API documentation

## Project Structure

```
.
├── apps/                        # Django applications
│   ├── products/                # E-commerce products & payments
│   ├── finances/                # Financial management
│   ├── users/                   # User authentication
│   ├── client_app/              # Multi-tenant client app
│   ├── payments/                # Payment processing
│   ├── snippets/                # Code snippets API
│   └── home/                    # Home views
├── multitenantsaas/             # Django project settings
├── deployments/                 # All deployment configs
│   ├── Jenkins/                 # Multiple Jenkinsfile variants
│   ├── k8s/                     # Kubernetes manifests
│   ├── terraform/               # Terraform AWS configs
│   └── scripts/                 # Automation scripts
├── nginx/                       # Nginx configuration
├── tests/                       # Test suite
├── Dockerfile                   # Container definition
├── docker-compose.yml           # Local development stack
├── docker-compose-nginx.yaml    # Production stack with Nginx
└── requirements.txt             # Python dependencies
```

## Prerequisites

- Python 3
- Docker & Docker Compose
- AWS Account + AWS CLI configured
- Terraform installed
- Node.js & NPM
- A domain name (optional, for production)

## Local Setup

### Step 1: Create virtual environment
```bash
python3 -m venv .venv
source .venv/bin/activate
```

### Step 2: Install dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Run migrations
```bash
python manage.py makemigrations
python manage.py migrate
```

### Step 4: Create superuser
```bash
python manage.py createsuperuser
```

### Step 5: Start development server
```bash
python manage.py runserver
```

## Docker Setup

```bash
bash ./run.sh
```

Access the app at: `http://127.0.0.1:8585/`

## API Documentation

| Endpoint | Description |
|----------|-------------|
| `http://127.0.0.1:8585/swagger/` | Swagger API docs |
| `http://127.0.0.1:8585/graphql` | GraphQL playground |
| `http://127.0.0.1:8585/data-browser/` | Data browser |

![image](https://raw.githubusercontent.com/Shubhamharanale7/Django-Saas-E-Commerce-Devops-Deployment/main/media/Screenshot2.png)

## Multi-Tenant Setup

```bash
pip install -r requirements.txt
python manage.py makemigrations finances
python manage.py makemigrations app
python manage.py migrate finances
python manage.py migrate app
```

Create a tenant:
```python
tenant = Client(schema_name="test", name="Test Company")
domain = Domain(domain="test.localhost", tenant=tenant, is_primary=True)
```

## Useful Django Extensions

```bash
python manage.py show_urls
python manage.py graph_models finances -a -o finances_models.png
```

## AWS Deployment with Terraform

```bash
cd deployments/terraform/terraform-aws-ec2-tf/terraform
terraform init
terraform plan
terraform apply --auto-approve
```

## CI/CD Pipeline (Jenkins)

Multiple Jenkinsfile variants are available in `deployments/Jenkins/`:

- `Jenkinsfile` — Standard pipeline
- `Jenkinsfile-SonarQube-Trivy-Scan` — With security scanning
- `Jenkinsfile-docker` — Docker build and push
- `JenkinsfileEKS` — EKS deployment
- `JenkinsfileArgoCDTemplate` — ArgoCD GitOps

## Tech Stack

| Category | Tools |
|----------|-------|
| Backend | Django, Django REST Framework, Celery, Gunicorn |
| Database | PostgreSQL (multi-tenant), Redis |
| Containerization | Docker, Docker Compose |
| Orchestration | Kubernetes, AWS EKS |
| IaC | Terraform |
| CI/CD | Jenkins, GitHub Actions |
| Security | SonarQube, Trivy, OWASP |
| Monitoring | Prometheus, Grafana |
| Payments | Stripe |
| API | REST, GraphQL, Swagger |

---

**Built by [Shubham Haranale](https://github.com/Shubhamharanale7)**

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Shubhamharanale7)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/shubhamharanale7)

