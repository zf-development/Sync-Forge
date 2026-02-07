# Maintenance Scripts
This directory contains scripts to help with mod maintenance tasks.

## Available Scripts

### Version Bumping

#### `bump-version.sh` (Linux/Mac)
Bumps the version number across all necessary files:
- `gradle.properties` - Updates `mod_version`
- `src/main/resources/META-INF/mods.toml` - Updates version field
- `CHANGELOG.md` - Adds new version entry

**Usage:**
```bash
./scripts/bump-version.sh
```

#### `bump-version.ps1` (Windows)
Same functionality as the bash script, but for PowerShell.

**Usage:**
```powershell
.\scripts\bump-version.ps1
```

### Changelog Management

#### `update-changelog.sh` (Linux/Mac)
Helper script to add entries to CHANGELOG.md under the Unreleased section.

**Usage:**
```bash
./scripts/update-changelog.sh
```

The script will prompt you for:
1. Type of change (Added, Changed, Fixed, Removed, Security)
2. Description of the change

## Workflow

### Creating a New Release

1. **Update CHANGELOG.md** with all changes:
   ```bash
   ./scripts/update-changelog.sh
   ```
   Or manually edit CHANGELOG.md

2. **Bump the version**:
   ```bash
   ./scripts/bump-version.sh
   ```

3. **Review changes** and commit:
   ```bash
   git add .
   git commit -m "chore: bump version to X.Y.Z"
   ```

4. **Create and push tag**:
   ```bash
   git tag vX.Y.Z
   git push origin main --tags
   ```

5. **GitHub Actions will automatically**:
   - Build the mod
   - Create a GitHub release
   - Upload artifacts

## Notes

- Always test builds after version bumps
- Update CHANGELOG.md before bumping version
- Follow semantic versioning (MAJOR.MINOR.PATCH)
- Pre-release versions can use format like `1.2.3-beta`
