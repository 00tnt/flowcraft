# Technology Stack Details

## Backend Dependencies

### Production Dependencies

- **express**: ^5.1.0 - Web framework
- **inversify**: ^7.10.4 - Dependency injection container
- **module-alias**: ^2.2.3 - Module path aliasing
- **reflect-metadata**: ^0.2.2 - Decorator metadata support

### Development Dependencies

- **tsx**: ^4.20.6 - TypeScript execution and watch mode
- **@types/express**: ^5.0.5 - Express TypeScript definitions
- **@types/module-alias**: ^2.0.4 - Module alias TypeScript definitions
- **@types/node**: ^22.15.30 - Node.js TypeScript definitions

## TypeScript Configuration

- **Target**: ES5
- **Module**: ESNext with bundler resolution
- **Strict mode**: Enabled
- **Additional strictness**: noUncheckedIndexedAccess, exactOptionalPropertyTypes
- **Path mapping**: @ -> src/\*
- **Source maps**: Enabled
- **Isolated modules**: Required for modern build tools

## Build & Development

- **Development**: tsx watch src/main.ts
- **Build**: tsc (TypeScript compiler)
- **Module type**: ESM (type: "module")
- **Output**: dist/ directory

## Monorepo Configuration

- **Turborepo**: Orchestrates builds and caching
- **pnpm workspaces**: Package management
- **Shared packages**: eslint-config, tailwind-config, typescript-config, ui
- **Cross-package dependencies**: Managed through workspace protocol
