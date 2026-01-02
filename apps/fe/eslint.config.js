import { nextJsConfig } from '@repo/eslint-config/next-js';

/** @type {import("eslint").Linter.Config} */
const feAppConfig = [
  ...nextJsConfig,
  {
    rules: {
      'no-console': 'warn',
    },
  },
];
export default feAppConfig;
