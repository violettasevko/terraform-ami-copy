module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.23"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  vpc_id     = "vpc-00c83a799f74f93ed"
  subnet_ids = ["subnet-093c431d9db5d8562", "subnet-008f1a536a8623779", "subnet-083ee30bfe79496ac", "subnet-0a6b97a92f1c071bb", "subnet-058e500f0b866e68b", "subnet-0101545d43a467f5b"] #b, c

 
 # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = 10
    instance_types = ["t3.small", "t3a.small"]
  }

  eks_managed_node_groups = {
      green = {
      min_size     = 1
      max_size     = 4
      desired_size = 1

      instance_types = ["t3.small", "t3a.small", "t3.medium", "t3a.medium"]
      capacity_type  = "SPOT"
    }
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::272840860415:AWSReservedSSO_AWSAdministratorAccess_5ce20564651f6360/devops"
      username = "devops"
      groups   = ["system:masters"]
    },
    {
      rolearn  = "arn:aws:iam::272840860415:instance-profile/FullAccess"
      username = "FullAccess"
      groups   = ["system:masters"]
    },
    {
      rolearn  = "arn:aws:iam::272840860415:role/FullAccess"
      username = "FullAccess"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::272840860415:AWSReservedSSO_AWSAdministratorAccess_5ce20564651f6360/roman"
      username = "roman"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_accounts = [
    "272840860415",
  ]

  tags = {
    Terraform   = "true"
    eks_managed_node_group_defaults = {
    disk_size      = 10
    instance_types = ["t3.small", "t3a.small"]
  }

  eks_managed_node_groups = {
      green = {
      min_size     = 1
      max_size     = 4
      desired_size = 1

      instance_types = ["t3.small", "t3a.small", "t3.medium", "t3a.medium"]
      capacity_type  = "SPOT"
    }
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true


  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::272840860415:AWSReservedSSO_AWSAdministratorAccess_5ce20564651f6360/devops"
      username = "devops"
      groups   = ["system:masters"]
    },
    {
      rolearn  = "arn:aws:iam::272840860415:instance-profile/FullAccess"
      username = "FullAccess"
      groups   = ["system:masters"]
    },
    {
      rolearn  = "arn:aws:iam::272840860415:role/FullAccess"
      username = "FullAccess"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::272840860415:AWSReservedSSO_AWSAdministratorAccess_5ce20564651f6360/roman"
      username = "roman"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_accounts = [
    "272840860415",
  ]

  tags = {
    Terraform   = "true"
  }
}
}
