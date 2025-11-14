# 🚀 Complete DevSecOps CI Pipeline (Free + Enterprise-Style)

This project implements a **full, enterprise-grade DevSecOps CI pipeline** using **GitHub Actions** with **zero paid services**.  
It showcases modern secure software delivery with automated scanning, policy enforcement, and gated deployment.

This is designed as a **hands-on portfolio project** that mirrors real-world pipelines used at top companies.

---

## 🔐 Features Included

### ✅ **1. Build & Unit Testing**
- Python 3.11 setup
- Dependency installation
- Automated unit tests (pytest)
- Application packaged as a versioned artifact

### 🔍 **2. SAST – Static Code Analysis (Semgrep OSS)**
- 100+ rules from `p/ci`
- Medium/High-severity findings fail the pipeline
- SARIF-compatible results

### 📦 **3. SBOM Generation (Syft + CycloneDX)**
- Full supply-chain inventory
- CycloneDX JSON SBOM artifact
- Useful for compliance + vulnerability tracking

### 🕵️‍♂️ **4. Secrets Scanning (Gitleaks)**
- Detects leaked API keys, tokens, passwords
- Produces detailed SARIF report

### 🏗️ **5. IaC Security Scanning (Checkov)**
- Scans Terraform for misconfigurations
- Enforces AWS security best practices
- Detects missing encryption, logging, versioning, etc.

### 🐳 **6. Container Image Build & Scan (Trivy)**
- Builds Docker image directly in GitHub Actions runner
- Scans for HIGH/CRITICAL CVEs
- Blocks unsafe images from proceeding

### 🌐 **7. DAST – Dynamic Web Scan (OWASP ZAP Full Scan)**
- Launches the app locally during CI
- Performs passive + active scanning
- Produces a full HTML vulnerability report

### 🏛️ **8. Policy & Compliance Gate (OPA / Conftest)**
- Uses Rego policies to validate Dockerfile configuration
- Enforces enterprise security rules before deployment

### 🚀 **9. Gated Deployment (GitHub Release)**
- Only triggers if **ALL** security stages pass
- Publishes artifact as versioned GitHub Release

---

## 🧩 CI Pipeline Architecture
# DevSecOps Pipeline
![Pipeline Diagram](devsecops-pipeline.svg)
