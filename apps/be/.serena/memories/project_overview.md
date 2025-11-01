# Flowcraft Project Overview

## Project Purpose

Flowcraft is a Turborepo monorepo containing a Next.js frontend application with a Node.js Express backend API. The backend implements a layered architecture with repository pattern for data access, service layer for business logic, and controller layer for HTTP handling.

## Project Structure

```
flowcraft/
├── apps/
│   ├── be/           # Backend Node.js + Express API
│   ├── fe/           # Frontend Next.js 16 + React 19 app
│   └── docs/         # Documentation Next.js app
├── packages/
│   ├── ui/           # Shared React component library
│   ├── eslint-config/        # Shared ESLint configurations
│   ├── tailwind-config/      # Shared Tailwind CSS configuration
│   └── typescript-config/    # Shared TypeScript configurations
└── turbo.json        # Turborepo configuration
```

## Technology Stack

- **Monorepo**: Turborepo with pnpm workspaces
- **Frontend**: Next.js 16, React 19, TypeScript, Tailwind CSS
- **Backend**: Node.js, Express 5.1.0, TypeScript
- **Dependency Injection**: Inversify 7.10.4
- **Build**: TSX for development, TypeScript compiler for build
- **Package Manager**: pnpm 10.19.0
- **Node.js**: >= 23.x required

## Backend Architecture

The backend follows a clean architecture pattern with:

- **Entities**: Domain models (User)
- **Repositories**: Data access layer with interfaces (IUserRepository, UserRepository)
- **Services**: Business logic layer (UserService)
- **Controllers**: HTTP request handling (UserController)
- **Routes**: Express routing configuration
- **Database**: Abstract connection layer with multiple implementations (DummyConnection, PostgresConnection, MongoConnection)

Current implementation uses dependency injection pattern but manual wiring in routes.
