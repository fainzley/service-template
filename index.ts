import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import * as awsx from "@pulumi/awsx";

type Stage = "dev" | "beta" | "prod";

// Read the stage from the STAGE environment variable
const stage = process.env.STAGE as Stage ?? "dev";

// Create an AWS resource (S3 Bucket)
const bucket = new aws.s3.Bucket(`${stage}-service-template-bucket`);

// Export the name of the bucket
export const bucketName = bucket.id;
