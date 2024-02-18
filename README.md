# service-template

A template for micro-services deployed to AWS with Pulumi

## How to use this template

```
git clone git@github.com:fainzley/service-template.git
cd service-template
npm run use-template
```

## What is included in the template

- Pulumi TypeScript code that defines an example stack with the following:
  - an empty S3 bucket
  - a Lambda with a TypeScript handler
- The following GitHub actions:
  - a [`preview.yml`](./.github/workflows/preview.yml) action that comments a stack diff on PRs to `main`
  - a [`deploy.yml`](./.github/workflows/deploy.yml) action that deploys the updated stack to our beta and prod AWS accounts when there is a commit to `main`
