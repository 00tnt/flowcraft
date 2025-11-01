# Suggested Commands for Development

## Backend Development (apps/be)

- `pnpm dev` - Start development server with file watching using tsx
- `pnpm build` - Build production bundle using pkgroll (recently updated from tsc)

## Monorepo Root Commands

- `pnpm dev` - Start all applications in development mode
- `pnpm build` - Build all packages and applications
- `pnpm lint` - Run linting across all packages
- `pnpm check-types` - Run TypeScript type checking across all packages
- `pnpm format` - Format code using Prettier

## Testing Commands

- No test framework currently configured
- Recommendation: Add Jest or Vitest for unit testing

## Linting and Formatting

- `pnpm format` - Prettier formatting for TypeScript, markdown files
- No ESLint configuration in backend (frontend has eslint)
- Husky git hooks configured with lint-staged

## Git Workflow

- Husky pre-commit hooks enabled
- Lint-staged runs on staged files
- Frontend ESLint runs on staged .js/.jsx/.ts/.tsx files
- Prettier runs on .json/.md/.yaml/.yml files

## Database Commands

- No database setup commands (using dummy implementation)
- Database connections abstract layer ready for Postgres/MongoDB

## Utility Commands (Darwin system)

- `ls` - List directory contents
- `find` - Search for files and directories
- `grep` - Search text patterns in files
- `git` - Version control operations
- `cd` - Change directory
- `cat` - Display file contents
