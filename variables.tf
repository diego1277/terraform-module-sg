variable name {
  description = "security group name"
  type = string
}

variable description {
  description = "description"
  type = string
}

variable vpc_id {
  description = "vpc id"
  type = string
}

variable ingress_rules {
  description = "default ingress sg rules"
  type = map(object({description=string,from_port=number,to_port=number,protocol=string,
                     cidr_blocks=optional(list(string)),self=optional(bool),security_groups=optional(list(string))
  }))
  default = {
   ingress_self = {
      description = "ingress self"
      protocol  = -1
      self      = true
      from_port = 0
      to_port   = 0
    }
  }
}

variable egress_rules {
  description = "default egress sg rules"
  type = map(object({description=string,from_port=number,to_port=number,protocol=string,
                     cidr_blocks=optional(list(string)),self=optional(bool),security_groups=optional(list(string))
  }))
  default = {
   egress_default = {
      description = "egress default"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable additional_tags {
  description = "additional tags"
  type        = map
  default = {}
}
