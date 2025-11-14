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
<svg viewBox="0 0 1200 1600" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="lightBlue" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#7dd3fc;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#0ea5e9;stop-opacity:1" />
    </linearGradient>
    <linearGradient id="lightBlue2" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:#bae6fd;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#38bdf8;stop-opacity:1" />
    </linearGradient>
    <filter id="shadow">
      <feDropShadow dx="0" dy="4" stdDeviation="6" flood-opacity="0.2"/>
    </filter>
  </defs>
  
  <!-- Background -->
  <rect width="1200" height="1600" fill="#f0f9ff"/>
  
  <!-- Title -->
  <text x="600" y="40" font-family="Arial, sans-serif" font-size="28" font-weight="bold" text-anchor="middle" fill="#0c4a6e">DevSecOps CI/CD Pipeline</text>
  
  <!-- GitHub Repo -->
  <rect x="350" y="80" width="500" height="80" rx="8" fill="url(#lightBlue)" filter="url(#shadow)"/>
  <!-- GitHub Icon -->
  <circle cx="400" cy="120" r="20" fill="white" opacity="0.9"/>
  <path d="M 400 105 C 391.72 105 385 111.72 385 120 C 385 126.63 389.42 132.19 395.49 134.18 C 396.24 134.32 396.52 133.85 396.52 133.45 C 396.52 133.09 396.51 132.08 396.5 130.71 C 392.73 131.64 391.85 129.07 391.85 129.07 C 391.17 127.36 390.17 126.9 390.17 126.9 C 388.78 125.95 390.27 125.97 390.27 125.97 C 391.79 126.08 392.58 127.54 392.58 127.54 C 393.95 129.89 396.17 129.21 396.54 129.03 C 396.68 128.05 397.05 127.37 397.46 126.99 C 394.46 126.6 391.3 125.43 391.3 120.33 C 391.3 118.7 391.87 117.37 392.61 116.32 C 392.46 115.93 391.96 114.52 392.75 112.54 C 392.75 112.54 394.04 112.13 396.49 113.78 C 397.72 113.44 399.04 113.27 400.35 113.26 C 401.66 113.27 402.98 113.44 404.21 113.78 C 406.66 112.13 407.94 112.54 407.94 112.54 C 408.74 114.52 408.24 115.93 408.09 116.32 C 408.83 117.37 409.39 118.7 409.39 120.33 C 409.39 125.44 406.22 126.59 403.21 126.97 C 403.73 127.43 404.19 128.32 404.19 129.69 C 404.19 131.65 404.17 133.24 404.17 133.45 C 404.17 133.86 404.45 134.33 405.21 134.18 C 411.28 132.18 415.7 126.63 415.7 120 C 415.7 111.72 408.28 105 400 105 Z" fill="#0c4a6e"/>
  <text x="600" y="115" font-family="Arial, sans-serif" font-size="18" font-weight="bold" text-anchor="middle" fill="white">GitHub Repository</text>
  <text x="600" y="140" font-family="Arial, sans-serif" font-size="14" text-anchor="middle" fill="white">Python App + Dockerfile + IaC</text>
  
  <!-- Arrow -->
  <path d="M 600 160 L 600 200" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Trigger -->
  <rect x="350" y="200" width="500" height="60" rx="8" fill="#e0f2fe" stroke="#0284c7" stroke-width="2"/>
  <!-- Trigger Icon -->
  <circle cx="390" cy="230" r="15" fill="#0284c7" opacity="0.2"/>
  <path d="M 390 220 L 390 240 M 380 230 L 400 230" stroke="#0284c7" stroke-width="2"/>
  <text x="600" y="235" font-family="Arial, sans-serif" font-size="16" font-weight="600" text-anchor="middle" fill="#0c4a6e">Trigger: Push / PR Event</text>
  
  <!-- Arrow -->
  <path d="M 600 260 L 600 300" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Stage 1: Build & Unit Tests -->
  <rect x="200" y="300" width="800" height="120" rx="8" fill="url(#lightBlue2)" filter="url(#shadow)"/>
  <!-- Build Icon -->
  <rect x="230" y="315" width="30" height="30" rx="3" fill="white" opacity="0.9"/>
  <rect x="235" y="320" width="8" height="8" fill="#0284c7"/>
  <rect x="245" y="320" width="8" height="8" fill="#0284c7"/>
  <rect x="235" y="330" width="8" height="8" fill="#0284c7"/>
  <rect x="245" y="330" width="8" height="8" fill="#0284c7"/>
  <text x="600" y="330" font-family="Arial, sans-serif" font-size="18" font-weight="bold" text-anchor="middle" fill="#0c4a6e">1) Build & Unit Tests</text>
  <text x="220" y="360" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Checkout code</text>
  <text x="220" y="380" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Install dependencies</text>
  <text x="220" y="400" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Run pytest</text>
  <text x="600" y="360" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Package build artifact</text>
  
  <!-- Arrows to parallel stages -->
  <path d="M 600 420 L 600 460" stroke="#0369a1" stroke-width="3" fill="none"/>
  <path d="M 600 460 L 280 460 L 280 500" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  <path d="M 600 460 L 600 500" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  <path d="M 600 460 L 920 460 L 920 500" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Stage 2: SAST -->
  <rect x="80" y="500" width="400" height="100" rx="8" fill="#e0f2fe" stroke="#0284c7" stroke-width="2" filter="url(#shadow)"/>
  <!-- Code Icon -->
  <circle cx="120" cy="530" r="18" fill="#0284c7" opacity="0.2"/>
  <path d="M 112 530 L 118 524 L 118 536 Z M 128 530 L 122 524 L 122 536 Z" fill="#0284c7"/>
  <text x="280" y="530" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="#0c4a6e">2) SAST (Semgrep OSS)</text>
  <text x="100" y="555" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• Static code scan</text>
  <text x="100" y="575" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• Fail med/high only</text>
  
  <!-- Stage 3: SBOM -->
  <rect x="400" y="500" width="400" height="100" rx="8" fill="#e0f2fe" stroke="#0284c7" stroke-width="2" filter="url(#shadow)"/>
  <!-- List Icon -->
  <circle cx="440" cy="530" r="18" fill="#0284c7" opacity="0.2"/>
  <rect x="432" y="522" width="16" height="2" fill="#0284c7"/>
  <rect x="432" y="528" width="16" height="2" fill="#0284c7"/>
  <rect x="432" y="534" width="16" height="2" fill="#0284c7"/>
  <text x="600" y="530" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="#0c4a6e">3) SBOM (Syft)</text>
  <text x="420" y="555" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• CycloneDX SBOM</text>
  <text x="420" y="575" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• Supply-chain inventory</text>
  
  <!-- Stage 4: Secrets -->
  <rect x="720" y="500" width="400" height="100" rx="8" fill="#e0f2fe" stroke="#0284c7" stroke-width="2" filter="url(#shadow)"/>
  <!-- Key Icon -->
  <circle cx="760" cy="530" r="18" fill="#0284c7" opacity="0.2"/>
  <circle cx="756" cy="526" r="4" fill="none" stroke="#0284c7" stroke-width="2"/>
  <path d="M 759 529 L 768 538 M 762 535 L 762 538 L 765 538" stroke="#0284c7" stroke-width="2" fill="none"/>
  <text x="920" y="530" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="#0c4a6e">4) Secrets (Gitleaks)</text>
  <text x="740" y="555" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• Secret leakage checks</text>
  <text x="740" y="575" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• SARIF output</text>
  
  <!-- Converge arrows -->
  <path d="M 280 600 L 280 640 L 600 640" stroke="#0369a1" stroke-width="3" fill="none"/>
  <path d="M 600 600 L 600 640" stroke="#0369a1" stroke-width="3" fill="none"/>
  <path d="M 920 600 L 920 640 L 600 640" stroke="#0369a1" stroke-width="3" fill="none"/>
  <path d="M 600 640 L 600 680" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Diverge to parallel stages -->
  <path d="M 600 680 L 600 720" stroke="#0369a1" stroke-width="3" fill="none"/>
  <path d="M 600 720 L 350 720 L 350 760" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  <path d="M 600 720 L 850 720 L 850 760" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Stage 5: IaC -->
  <rect x="150" y="760" width="400" height="100" rx="8" fill="#e0f2fe" stroke="#0284c7" stroke-width="2" filter="url(#shadow)"/>
  <!-- Cloud Icon -->
  <circle cx="190" cy="790" r="18" fill="#0284c7" opacity="0.2"/>
  <path d="M 196 795 C 199 795 201 793 201 790 C 201 788 199.5 786 197 786 C 197 783 194 781 191 781 C 188 781 185 783 185 786 C 182.5 786 181 788 181 790 C 181 793 183 795 186 795 Z" fill="#0284c7"/>
  <text x="350" y="790" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="#0c4a6e">5) IaC Scan (Checkov)</text>
  <text x="170" y="815" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• Terraform misconfig scan</text>
  <text x="170" y="835" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• AWS security checks</text>
  
  <!-- Stage 6: Container -->
  <rect x="650" y="760" width="400" height="100" rx="8" fill="#e0f2fe" stroke="#0284c7" stroke-width="2" filter="url(#shadow)"/>
  <!-- Container Icon -->
  <circle cx="690" cy="790" r="18" fill="#0284c7" opacity="0.2"/>
  <rect x="682" y="784" width="16" height="12" rx="2" fill="none" stroke="#0284c7" stroke-width="2"/>
  <path d="M 686 788 L 690 791 L 694 788" stroke="#0284c7" stroke-width="2" fill="none"/>
  <text x="850" y="790" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="#0c4a6e">6) Container (Trivy)</text>
  <text x="670" y="815" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• Build Docker image</text>
  <text x="670" y="835" font-family="Arial, sans-serif" font-size="13" text-anchor="start" fill="#0c4a6e">• Scan HIGH/CRITICAL vulns</text>
  
  <!-- Converge arrows -->
  <path d="M 350 860 L 350 900 L 600 900" stroke="#0369a1" stroke-width="3" fill="none"/>
  <path d="M 850 860 L 850 900 L 600 900" stroke="#0369a1" stroke-width="3" fill="none"/>
  <path d="M 600 900 L 600 940" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Stage 7: DAST -->
  <rect x="250" y="940" width="700" height="120" rx="8" fill="url(#lightBlue2)" filter="url(#shadow)"/>
  <!-- Shield Icon -->
  <circle cx="290" cy="980" r="20" fill="white" opacity="0.9"/>
  <path d="M 290 966 L 298 970 L 298 985 C 298 990 294 993 290 994 C 286 993 282 990 282 985 L 282 970 Z" fill="#0284c7"/>
  <text x="600" y="970" font-family="Arial, sans-serif" font-size="18" font-weight="bold" text-anchor="middle" fill="#0c4a6e">7) DAST (OWASP ZAP Full Scan)</text>
  <text x="270" y="1000" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Launch local app</text>
  <text x="270" y="1020" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Active/passive scanning</text>
  <text x="270" y="1040" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• HTML vulnerability report</text>
  
  <!-- Arrow -->
  <path d="M 600 1060 L 600 1100" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Stage 8: OPA Policy -->
  <rect x="250" y="1100" width="700" height="100" rx="8" fill="#e0f2fe" stroke="#0284c7" stroke-width="2" filter="url(#shadow)"/>
  <!-- Policy Icon -->
  <circle cx="290" cy="1140" r="18" fill="#0284c7" opacity="0.2"/>
  <rect x="283" y="1133" width="14" height="14" rx="2" fill="none" stroke="#0284c7" stroke-width="2"/>
  <path d="M 286 1140 L 288 1142 L 294 1136" stroke="#0284c7" stroke-width="2" fill="none"/>
  <text x="600" y="1130" font-family="Arial, sans-serif" font-size="18" font-weight="bold" text-anchor="middle" fill="#0c4a6e">8) OPA Policy Gate (Conftest)</text>
  <text x="270" y="1160" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Enforce Dockerfile rules</text>
  <text x="270" y="1180" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="#0c4a6e">• Block insecure builds</text>
  
  <!-- Arrow -->
  <path d="M 600 1200 L 600 1240" stroke="#0369a1" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Stage 9: Deployment -->
  <rect x="250" y="1240" width="700" height="100" rx="8" fill="url(#lightBlue)" filter="url(#shadow)"/>
  <!-- Rocket Icon -->
  <circle cx="290" cy="1280" r="20" fill="white" opacity="0.9"/>
  <path d="M 290 1268 L 286 1282 L 290 1280 L 294 1282 Z M 288 1276 L 292 1276 M 287 1279 L 293 1279" stroke="#0c4a6e" stroke-width="2" fill="none"/>
  <text x="600" y="1270" font-family="Arial, sans-serif" font-size="18" font-weight="bold" text-anchor="middle" fill="white">9) Deployment Gate (GitHub Release)</text>
  <text x="270" y="1300" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="white">• Requires ALL security jobs to pass</text>
  <text x="270" y="1320" font-family="Arial, sans-serif" font-size="14" text-anchor="start" fill="white">• Publishes versioned build artifacts</text>
  
  <!-- Success Badge -->
  <circle cx="600" cy="1400" r="50" fill="#0284c7" filter="url(#shadow)"/>
  <path d="M 585 1400 L 595 1410 L 615 1390" stroke="white" stroke-width="6" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
  <text x="600" y="1440" font-family="Arial, sans-serif" font-size="16" font-weight="bold" text-anchor="middle" fill="#0c4a6e">SECURE DEPLOYMENT</text>
  
  <!-- Arrow marker definition -->
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
      <polygon points="0 0, 10 3, 0 6" fill="#0369a1" />
    </marker>
  </defs>
</svg>
