# Branching Strategy
This document describes the branching strategy for managing the Sync mod repository.

## Branch Structure

### Main Branches
- **`main`** : Main branch containing the latest stable and available version of the mod. This branch is manually updated by the maintainer to point to the latest available version.
- **`dev`** : Main development branch where all new features and fixes are integrated before being merged into `main`.

### Minecraft Version Branches
For each supported Minecraft version, a dedicated branch can be created:

- **`1.20.1`** : Version for Minecraft 1.20.1
- **`1.21.x`** : Version for Minecraft 1.21.x (when available)
- etc.

These branches allow maintaining multiple mod versions simultaneously.

### Feature Branches
For developing new features:

- **`feature/feature-name`** : Branch for developing a new feature
  - Example: `feature/shell-customization`
  - Created from `dev`
  - Merged into `dev` once completed

### Bug Fix Branches
For fixing bugs:

- **`fix/bug-name`** : Branch for fixing a specific bug
  - Example: `fix/shell-desync-issue`
  - Created from `dev` or the relevant version branch
  - Merged into `dev` and the relevant version branch

### Migration Branches
For migrating to a new Minecraft version:

- **`migration/version`** : Branch for migrating to a new version
  - Example: `migration/1.21` or `neoforge-1.20.1-migration`
  - Created from the source version branch
  - Once completed, can be merged into a new version branch

### Release Branches
For preparing a release:

- **`release/version`** : Branch for preparing a release
  - Example: `release/0.2.0`
  - Created from `dev`
  - Used for final fixes and release notes preparation
  - Merged into `main` and `dev` once the release is published

## Development Workflow

### Developing a New Feature
1. Create a branch from `dev`:
   ```bash
   git checkout dev
   git pull origin dev
   git checkout -b feature/my-feature
   ```
2. Develop and commit your changes
3. Push the branch and create a Pull Request to `dev`
4. Once approved, merge into `dev`

### Fixing a Bug
1. Create a branch from `dev` or the relevant version branch:
   ```bash
   git checkout dev
   git pull origin dev
   git checkout -b fix/my-bug
   ```
2. Fix the bug and commit
3. Push and create a Pull Request to `dev` (and the version branch if necessary)

### Migrating to a New Minecraft Version
1. Create a migration branch:
   ```bash
   git checkout 1.20.1  # or the source version
   git checkout -b migration/1.21
   ```
2. Perform the migration (update dependencies, modify code, etc.)
3. Test thoroughly
4. Once completed, create a new version branch:
   ```bash
   git checkout -b 1.21
   git push origin 1.21
   ```

## Important Rules
1. **Never merge directly into `main`** except for official releases
2. **Always create a Pull Request** to merge into `dev` or `main`
3. **Keep `dev` up to date** by regularly merging from `main`
4. **Delete merged branches** to keep the repository clean
5. **Name branches clearly** with appropriate prefixes (`feature/`, `fix/`, `migration/`, etc.)

## Automatic Builds
Builds are automatically triggered by GitHub Actions for:
- Every push to `main` or `dev`
- Every Pull Request to `main` or `dev`
- Manual trigger via `workflow_dispatch`

Build artifacts are available in the GitHub Actions tab for 30 days.
