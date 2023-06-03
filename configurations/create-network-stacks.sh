aws cloudformation create-stack \
--stack-name network-stack \
--region us-east-1 \
--template-body file://network.yaml \
--parameters file://parameters/network.json