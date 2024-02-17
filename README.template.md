# Service Name Title

A template for micro-services deployed to AWS with Pulumi.

The stack is defined in `index.ts`, see the [Pulumi AWS docs](https://www.pulumi.com/registry/packages/aws/) for more information.

This repository was created using the [fainzley service-template](https://github.com/fainzley/service-template).

## Deployment

In order to deploy the stack to an AWS account, you must ensure that you have the AWS environment variables set:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_SESSION_TOKEN`
- `AWS_REGION`

You can fetch these from the AWS console. Once these are set, install the NodeJS dependencies using:

```
npm install
```

And finally, deploy the stack with:

```
pulumi up
```

Choose `create a new stack`, create one called `fainzley/dev`, and follow the rest of the Pulumi instructions.
