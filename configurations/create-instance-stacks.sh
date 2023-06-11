aws cloudformation create-stack \
--stack-name instance-stack \
--region us-east-1 \
--template-body file://instance.yaml \
--parameters file://parameters/instances.json \
--capabilities "CAPABILITY_NAMED_IAM"

sleep 100