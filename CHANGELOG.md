# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [v1.0.0] - 2024-06-18

### 🚀 Initial Commit

- Initial project setup with Node.js v22.3.0, Vite, React, and TypeScript.
- Project structure created.
- Basic dependencies installed and configured.

### 🛠️ Setting Up CI

- GitHub Actions workflows created for deployment and release.
- **Deploy Workflow (`deploy.yml`):**
  - Automatic deployment on push to `main`, `staging`, and `release/**` branches.
  - Uses `actions/checkout@v2` for repository checkout.
  - Configures Node.js environment with `actions/setup-node@v2`.
  - Runs tests and builds the project.
  - Pushes changes with tags using `GITHUB_TOKEN`.

### 📦 Versioning

- Project versioning handled using `lerna`.
- **Version Update Script (`./script/next_version.sh`):**
  - Determines the next version based on the current state of the repository.
  - Differentiates between master and other branches.
- **Update Package Versions:**
  - Runs `lerna version` to update package versions without pushing changes immediately.

### 📝 Update CHANGELOG

- Automated updating of the `CHANGELOG.md` file with the current date.
- **Update CHANGELOG Step:**
  - Uses the `sed` command to replace the placeholder date with the current date.
  - Commits the updated `CHANGELOG.md` to the repository.

### 📢 Release

- Automated release creation using a custom script.
- **Make GitHub Release:**
  - Creates a GitHub release with the latest changelog.
  - Uses `GITHUB_TOKEN` for authentication.
  - Integrates with the custom release script `make-github-release.js`.

## [v0.1.0] - 2024-06-15

### 🎉 Initial Setup

- Project repository initialized.
- Initial commit with basic project structure and dependencies.

---

## How to Use

### Making a Commit

```sh
git add .
git commit -m "Your commit message"
git push origin your-branch
```
