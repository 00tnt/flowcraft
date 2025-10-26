import { nextJsConfig } from "@tnt/eslint-config/next-js";

/** @type {import("eslint").Linter.Config} */
const feAppConfig = [
  ...nextJsConfig,
  {
    rules: {
      "no-console": "error"
  }
  }
]
export default feAppConfig;
