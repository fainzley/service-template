# Service Name Title

A template for micro-services deployed to AWS with Pulumi.

The stack is defined in `index.ts`, see the [Pulumi AWS docs](https://www.pulumi.com/registry/packages/aws/) for more information.

This repository was created using the [fainzley service-template](https://github.com/fainzley/service-template).

## Deployment

In order to deploy the stack to an AWS account (we normally develop on the fainzley dev account), you must ensure that you have the AWS environment variables set:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN`
- `AWS_REGION`

You can fetch these from the AWS console. Once these are set, install the NodeJS dependencies using:

```
npm install
```

Finally, deploy the stack with:

```
pulumi up
```

If this is the first deployment of this stack, choose `create a new stack`, create one called `fainzley/dev`, and follow the rest of the Pulumi instructions.

### Previewing deployments

To preview a deployment before it is made, you can run:

```
pulumi preview
```

## GitHub Actions

This repo has the following GitHub actions:
- a [`preview.yml`](./.github/workflows/preview.yml) action that comments a stack diff on PRs to `main`
- a [`deploy.yml`](./.github/workflows/deploy.yml) action that deploys the updated stack to our beta and prod AWS accounts when there is a commit to `main`
