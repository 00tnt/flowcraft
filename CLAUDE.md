# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Turborepo monorepo using pnpm workspaces for a project called "flowcraft". The repository contains:

- **Frontend (fe)**: Next.js 16 app with React 19 running on port 3001
- **Backend (be)**: Basic Node.js application (currently minimal)
- **Documentation (docs)**: Next.js app for documentation
- **Shared UI package**: React component library with Tailwind CSS

## Development Commands

### Root-level commands (run from project root):

- `pnpm dev` - Start all applications in development mode
- `pnpm build` - Build all packages and applications
- `pnpm lint` - Run linting across all packages
- `pnpm check-types` - Run TypeScript type checking across all packages
- `pnpm format` - Format code using Prettier

### Frontend-specific (apps/fe):

- `pnpm dev` - Start Next.js dev server on port 3001
- `pnpm build` - Build the Next.js application
- `pnpm check-types` - Run Next.js typegen and TypeScript checking

### Backend-specific (apps/be):

- `pnpm dev` - Start Node.js with file watching using `--watch` flag

### UI Package (packages/ui):

- `pnpm build:styles` - Build Tailwind CSS styles
- `pnpm build:components` - Compile TypeScript components
- `pnpm dev:styles` - Watch and rebuild styles
- `pnpm dev:components` - Watch and rebuild components

## Architecture

### Monorepo Structure

- Uses Turborepo for build orchestration and caching
- pnpm workspaces for package management
- Shared packages: `@tnt/ui`, `@tnt/eslint-config`, `@tnt/tailwind-config`, `@tnt/tsconfig`

### Technology Stack

- **Frontend**: Next.js 16, React 19, TypeScript 5.9.2, Tailwind CSS 4.1.5
- **Backend**: Node.js with TypeScript (minimal setup)
- **Tooling**: ESLint, Prettier, Turborepo, pnpm

### Package Dependencies

- UI components are shared via `@tnt/ui` workspace package
- Frontend app depends on the shared UI package
- All TypeScript configurations extend from `@tnt/tsconfig`
- Shared Tailwind configuration via `@tnt/tailwind-config`

### Build Pipeline

- Turborepo manages build dependencies and caching
- UI package builds both styles and components separately
- Frontend builds depend on UI package being built first
- All apps use transpilePackages to consume TypeScript directly from workspace packages

## Requirements

- Node.js >= 23
- pnpm 10.19.0 (specified as packageManager)
