FROM node:22-alpine AS base

# Enable pnpm through Corepack
RUN corepack enable

WORKDIR /app


FROM base AS dependencies

# Copy dependency files first for caching
COPY package.json pnpm-lock.yaml ./

# Install all dependencies (including dev deps for build)
RUN pnpm install --frozen-lockfile


FROM base AS build

COPY --from=dependencies /app/node_modules ./node_modules
COPY . .

# Build Nest app
RUN pnpm build


FROM base AS production

ENV NODE_ENV=production

COPY package.json pnpm-lock.yaml ./

# Install only production dependencies
RUN pnpm install --prod --frozen-lockfile

# Copy compiled app
COPY --from=build /app/dist ./dist

EXPOSE 3000

CMD ["node", "dist/index.js"]