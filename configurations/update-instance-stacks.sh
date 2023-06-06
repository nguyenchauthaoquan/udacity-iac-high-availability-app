aws cloudformation update-stack  \
--stack-name instance-stack \
--region us-west-2 \
--template-body file://instance.yaml \
--parameters file://parameters/instances.json \
--capabilities "CAPABILITY_NAMED_IAM"