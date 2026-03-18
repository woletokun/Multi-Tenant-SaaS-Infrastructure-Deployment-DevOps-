# 🚀 Multi-Tenant SaaS Infrastructure Deployment (AWS + Docker + CI/CD)

This project demonstrates how to design and deploy a production-grade multi-tenant SaaS infrastructure capable of supporting multiple tenants via subdomains using modern DevOps practices.

> ⚠️ Note: This repository focuses strictly on infrastructure, deployment, and automation. Application source code is not included.

---

## 🧱 Architecture Overview
Clients (Browser)
↓
Route53 (Wildcard DNS: *.nexemr.com)
↓
Application Load Balancer (HTTPS via ACM)
↓
Frontend Layer (NGINX + Docker)
↓
Reverse Proxy (/api)
↓
Backend Services (FastAPI, Celery, Redis)
↓
PostgreSQL Database

---

## ☁️ Cloud Infrastructure

- AWS EC2 (Frontend + Backend separation)
- AWS ALB (Layer 7 routing + SSL termination)
- AWS ACM (Wildcard SSL certificate)
- Route53 (DNS + wildcard subdomains)

---

## 🐳 Containerization

- Multi-stage Docker build for frontend
- NGINX container for static asset serving
- Backend services containerized (API, worker, scheduler)
- Docker Compose orchestration

---

## 🔁 CI/CD Automation

- GitHub Actions (self-hosted runner on EC2)
- Automatic deployment on push to main branch
- Docker image rebuild + container restart
- Zero manual deployment workflow

---

## 🌐 Multi-Tenant Routing

- Wildcard DNS (`*.nexemr.com`)
- Subdomain-based tenant resolution
- NGINX reverse proxy passes host headers
- Backend dynamically resolves tenant context

---

## 🔐 Security

- Backend services restricted via security groups
- Internal service communication within VPC
- HTTPS enforced at load balancer
- NGINX hardened headers

---

## ⚙️ Key DevOps Concepts Demonstrated

- Infrastructure as Code mindset
- Reverse proxy configuration (NGINX)
- Secure multi-tier architecture
- CI/CD with self-hosted runners
- Container orchestration (Docker Compose)
- Production debugging (networking, proxying, auth flow)

---

## 🧪 Validation

Example request:
curl -H "Host: hospitala.example.com" https://<ALB-DNS>/api


---

## 📸 Architecture Diagram

                ┌─────────────────────────────┐
                │        End Users            │
                │  hospitalA / hospitalB      │
                └─────────────┬───────────────┘
                              │
                              ▼
                ┌─────────────────────────────┐
                │   Route53 (DNS - Wildcard)  │
                │    *.nexemr.com             │
                └─────────────┬───────────────┘
                              │
                              ▼
                ┌─────────────────────────────┐
                │ Application Load Balancer   │
                │        (HTTPS - ACM)        │
                └─────────────┬───────────────┘
                              │
                              ▼
                ┌─────────────────────────────┐
                │   Frontend EC2 Instance     │
                │  NGINX + React (Docker)     │
                └─────────────┬───────────────┘
                              │
                     /api Proxy Request
                              │
                              ▼
                ┌─────────────────────────────┐
                │   Backend EC2 Instance      │
                │ FastAPI + Celery + Redis    │
                └─────────────┬───────────────┘
                              │
                              ▼
                ┌─────────────────────────────┐
                │       PostgreSQL DB         │
                │   (Multi-Tenant Data)       │
                └─────────────────────────────┘
---

## 🧠 Lessons Learned

- Handling multi-tenant routing at scale
- Debugging reverse proxy issues
- Secure communication between services
- Designing production-ready deployment pipelines

---

## 🚀 Future Improvements

- Kubernetes (EKS)
- Terraform (Infrastructure as Code)
- Blue-Green deployments
- Observability (Prometheus + Grafana)

---

## 👨‍💻 Author

Oyewole Olatokun  
DevOps Engineer
