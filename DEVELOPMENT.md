# Development Guide

This guide provides information for developers working on the Sync mod.

## Project Structure

```
Sync-Forge/
├── src/
│   ├── main/
│   │   ├── java/net/sumik/sync/
│   │   │   ├── api/              # Public API for other mods
│   │   │   ├── client/           # Client-side code
│   │   │   ├── common/           # Shared code
│   │   │   └── mixins/           # Mixin classes
│   │   └── resources/
│   │       ├── assets/           # Textures, models, etc.
│   │       └── META-INF/         # Mod metadata
│   └── test/                     # Test code (if any)
├── scripts/                      # Maintenance scripts
├── .github/                      # GitHub workflows and templates
└── build.gradle                  # Build configuration
```

## API Overview

The Sync mod provides a public API for other mods to interact with shells and synchronization.

### Key API Classes

- `net.sumik.sync.api.shell.Shell` - Represents a shell entity
- `net.sumik.sync.api.shell.ShellState` - Manages shell state
- `net.sumik.sync.api.shell.ShellStateComponent` - Component for storing shell state
- `net.sumik.sync.api.event.PlayerSyncEvents` - Events for synchronization
- `net.sumik.sync.api.event.EntityFitnessEvents` - Events for entity fitness

### Adding Shell State Components

To add custom data to shells, implement `ShellStateComponent`:

```java
public class MyShellStateComponent implements ShellStateComponent {
    // Your custom data here
    
    @Override
    public void serialize(NbtCompound nbt) {
        // Serialize your data
    }
    
    @Override
    public void deserialize(NbtCompound nbt) {
        // Deserialize your data
    }
}
```

Then register it:

```java
ShellStateComponentFactoryRegistry.INSTANCE.register(
    Identifier.of("mymod", "mycomponent"),
    MyShellStateComponent::new
);
```

### Listening to Events

```java
PlayerSyncEvents.SYNC.register((player, shell) -> {
    // Handle sync event
    return ActionResult.PASS;
});
```

## Building

### Prerequisites
- JDK 17 or higher
- Gradle (included via wrapper)

### Build Commands

```bash
# Build the mod
./gradlew build

# Run in development environment
./gradlew runClient    # Run client
./gradlew runServer    # Run server

# Generate sources
./gradlew genSources

# Clean build
./gradlew clean build
```

## Testing

### Manual Testing Checklist

- [ ] Shell construction works correctly
- [ ] Shell storage functions properly
- [ ] Synchronization works across dimensions
- [ ] Death handling works as expected
- [ ] Compatibility mods work correctly
- [ ] Configuration options work
- [ ] No memory leaks or performance issues

### Testing with Other Mods

Test compatibility with:
- Curios
- Diet
- Thirst
- Other popular mods

## Code Style

Follow the existing code style:
- 4 spaces for indentation
- Java naming conventions
- Javadoc for public APIs
- Clear, descriptive variable names

## Debugging

### Common Issues

1. **Mixin conflicts**: Check mixin configuration and other mods
2. **Class loading issues**: Verify dependencies in build.gradle
3. **Runtime errors**: Check logs in `logs/` directory

### Logging

Use the mod's logger:

```java
import net.sumik.sync.Sync;
Sync.LOGGER.info("Your message here");
```

## Version Management

Use the version bump scripts:

```bash
# Linux/Mac
./scripts/bump-version.sh

# Windows
.\scripts\bump-version.ps1
```

Then update CHANGELOG.md with your changes.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

## Resources

- [NeoForge Documentation](https://docs.neoforged.net/)
- [Architectury Loom Documentation](https://docs.architectury.dev/loom/)
- [Mixin Documentation](https://github.com/SpongePowered/Mixin)
