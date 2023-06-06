aws cloudformation update-stack \
--stack-name network-stack \
--region us-west-2 \
--template-body file://network.yaml \
--parameters file://parameters/network.json \
--capabilities "CAPABILITY_NAMED_IAM"