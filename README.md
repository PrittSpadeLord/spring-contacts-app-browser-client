Currently work in progress. Work will resume after `spring-contacts-app` is completed.

This application will involve a Vue SPA served by Nginx.

The dependencies will be managed by `pnpm`. Regardless of whether you have `pnpm` installed on your machine or not, use the prefix `npx pnpm run` when running any of the scripts described in `package.json`, such as:

```
npx pnpm run test
```

```
npx pnpm run dev
```

```
npx pnpm run build
```

This will ensure builds will not be affected by differences in pnpm versions. In the future, a Docker container will standardize this approach.