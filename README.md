Helm Charts

eksctl create iamserviceaccount \
 --name external-secrets-irsa \
 --namespace external-secrets \
 --cluster eks-external-secrets \
 --role-name "external-secrets-irsa-role" \
 --attach-policy-arn $IAM_POLICY_ARN \
 --approve \
 --override-existing-serviceaccounts
