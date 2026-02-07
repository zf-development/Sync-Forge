# PowerShell script to bump version in gradle.properties and update CHANGELOG.md

# Get current version from gradle.properties
$gradleProps = Get-Content "gradle.properties"
$currentVersion = ($gradleProps | Select-String "mod_version=").ToString().Split('=')[1]

Write-Host "Current version: $currentVersion" -ForegroundColor Yellow

# Ask for new version
$newVersion = Read-Host "Enter new version (current: $currentVersion)"

if ([string]::IsNullOrWhiteSpace($newVersion)) {
    Write-Host "Version cannot be empty!" -ForegroundColor Red
    exit 1
}

# Validate version format (semantic versioning)
if ($newVersion -notmatch '^\d+\.\d+\.\d+(-[a-zA-Z0-9]+)?$') {
    Write-Host "Invalid version format! Use semantic versioning (e.g., 1.2.3 or 1.2.3-beta)" -ForegroundColor Red
    exit 1
}

# Update gradle.properties
Write-Host "Updating gradle.properties..." -ForegroundColor Yellow
$gradleProps = $gradleProps -replace "mod_version=.*", "mod_version=$newVersion"
$gradleProps | Set-Content "gradle.properties"

# Update mods.toml version
Write-Host "Updating mods.toml..." -ForegroundColor Yellow
$modsToml = Get-Content "src/main/resources/META-INF/mods.toml"
$modsToml = $modsToml -replace 'version=".*"', "version=`"$newVersion`""
$modsToml | Set-Content "src/main/resources/META-INF/mods.toml"

# Update CHANGELOG.md
Write-Host "Updating CHANGELOG.md..." -ForegroundColor Yellow
$today = Get-Date -Format "yyyy-MM-dd"
$changelog = Get-Content "CHANGELOG.md" -Raw
$changelog = $changelog -replace "## \[Unreleased\]", "## [Unreleased]`n`n## [$newVersion] - $today"
$changelog | Set-Content "CHANGELOG.md"

Write-Host "Version bumped successfully to $newVersion!" -ForegroundColor Green
Write-Host "Don't forget to:" -ForegroundColor Yellow
Write-Host "  1. Update CHANGELOG.md with your changes"
Write-Host "  2. Commit the changes"
Write-Host "  3. Create a git tag: git tag v$newVersion"
Write-Host "  4. Push with tags: git push origin main --tags"
