# Code Style and Conventions

## TypeScript Configuration

- **Target**: ESNext (recently updated from ES5)
- **Module system**: ESNext with bundler resolution
- **Strict mode**: Enabled with additional type safety
- **Path aliases**: @ maps to src/\*
- **Naming conventions**: PascalCase for classes, camelCase for variables/functions

## Architecture Patterns

### Repository Pattern Implementation

- Interfaces prefixed with 'I' (e.g., IUserRepository, IConnection)
- Repository classes implement corresponding interfaces
- Abstract database connection layer with multiple implementations

### Dependency Injection

- Uses Inversify framework
- Manual dependency wiring in route files (not container-managed yet)
- Constructor injection pattern throughout

### Layered Architecture

```
Controllers -> Services -> Repositories -> Database
```

## File Organization

- **Entities**: Domain models in src/entities/
- **Repositories**: Data access in src/repositories/{domain}/
- **Services**: Business logic in src/services/{domain}/
- **Controllers**: HTTP handlers in src/controllers/{domain}/
- **Routes**: Express routes in src/routes/v{version}/{domain}/
- **Config**: Configuration files in src/config/

## Code Conventions

- Private fields prefixed with underscore (\_field)
- Interface segregation (separate interfaces for contracts)
- Async/await pattern for asynchronous operations
- Express Router for modular routing
- Manual instantiation and dependency wiring in routes

## Import Patterns

- Path alias @ for internal imports
- Named exports preferred over default exports (except for routers)
- Type imports when only importing for types
