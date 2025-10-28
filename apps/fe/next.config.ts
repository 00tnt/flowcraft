import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  transpilePackages: ['@tnt/ui'],
  typescript: {
    ignoreBuildErrors: true,
  },
};

export default nextConfig;
