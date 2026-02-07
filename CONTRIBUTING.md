# Contributing Guide
Thank you for your interest in contributing to the Sync mod! This guide will help you understand how to contribute effectively.

## Before You Start
1. Make sure you've read the [BRANCHING.md](BRANCHING.md) file to understand the branching strategy
2. Check existing issues to see if your contribution is already in progress
3. For major features, create an issue first to discuss your proposal

## Development Environment Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/zf-development/Sync-Forge.git
   cd Sync-Forge
   ```
2. Set up your environment:
   - Java 17 or higher
   - Gradle (included via wrapper)
   - A compatible IDE (IntelliJ IDEA recommended)
3. Import the project into your IDE as a Gradle project
4. Run the setup:
   ```bash
   ./gradlew build
   ```

## Contribution Process
### 1. Create a Branch
Always create a branch from `dev` (or the appropriate branch):

```bash
git checkout dev
git pull origin dev
git checkout -b feature/my-contribution
# or
git checkout -b fix/my-bug
```

### 2. Develop
- Write clean, well-commented code
- Follow Java naming conventions
- Add Javadoc comments for public classes and methods
- Test your code before submitting

### 3. Commit
Use clear and descriptive commit messages:

```bash
git add .
git commit -m "feat: add feature X"
# or
git commit -m "fix: fix bug Y"
```

Commit message conventions:
- `feat:` for a new feature
- `fix:` for a bug fix
- `docs:` for documentation
- `refactor:` for refactoring
- `test:` for tests
- `chore:` for maintenance tasks

### 4. Push and Create a Pull Request
```bash
git push origin feature/my-contribution
```

Then, create a Pull Request on GitHub to the `dev` branch.

## Code Standards
### Style
- Use 4 spaces for indentation (no tabs)
- Follow standard Java conventions
- Keep methods short and focused
- Avoid methods that are too long (> 50 lines)

### Naming
- Classes: `PascalCase` (e.g., `ShellEntity`)
- Methods and variables: `camelCase` (e.g., `getShellState()`)
- Constants: `UPPER_SNAKE_CASE` (e.g., `MAX_SHELLS`)
- Packages: `lowercase` (e.g., `net.sumik.sync`)

### Documentation
- Add Javadoc comments for all public classes
- Document complex parameters or non-obvious behaviors
- Explain the "why" in comments, not the "how"

## Testing
- Test your code manually in-game before submitting
- Verify that the mod compiles without errors
- Make sure there are no regressions

## Pull Requests
Your Pull Request should:

1. **Have a clear title** describing the changes
2. **Include a description** explaining:
   - What was changed
   - Why these changes are necessary
   - How to test the changes
3. **Be up to date** with the target branch (`dev`)
4. **Pass automatic builds** (GitHub Actions)

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] New feature
- [ ] Bug fix
- [ ] Performance improvement
- [ ] Documentation
- [ ] Refactoring

## How to Test
Steps to test the changes

## Checklist
- [ ] My code follows the project standards
- [ ] I have tested my code
- [ ] I have updated documentation if necessary
- [ ] Builds pass
```

## Questions?

If you have questions, feel free to:
- Create an issue on GitHub
- Contact the maintainers

Thank you for contributing!
