import { initOpenNextCloudflareForDev } from '@opennextjs/cloudflare';
import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  transpilePackages: ['@repo/ui'],

  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
};

initOpenNextCloudflareForDev();

export default nextConfig;
