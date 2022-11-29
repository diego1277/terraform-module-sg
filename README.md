# Terraform Security group module

## Requirements
Binary version ```v1.3.2```

## Providers

| Name | Version |
|------|---------|
| aws | 4.33.0 |

## How to
Set default configuration
```
module "sg" {
   source = "github.com/diego1277/terraform-module-sg.git"
   name = "my_sg"
   description = "my dsc"
   vpc_id = "my vpc id"
}
```
Enable ingress custom rules
```
module "sg" {
   source = "github.com/diego1277/terraform-module-sg.git"
   name = "my_sg"
   description = "my dsc"
   vpc_id = "my vpc id"   
   ingress_rules = {
      ingress_self = {
         description = "ingress self"
         protocol  = -1
         self      = true
         from_port = 0
         to_port   = 0
       }
      ssh_allow = {
        description = "ingress ssh"
        protocol  = "TCP"
        cidr_blocks = ["1.1.1.1/32"]
        from_port = 22
        to_port   = 22
       }
      sg_allow = {
        description = "ingress self"
        protocol  = "TCP"
        security_groups = ["sg-9115bae1"]
        from_port = 443
        to_port   = 443
    }
  }
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | additional tags | `map` | `{}` | no |
| description | description | `string` | n/a | yes |
| egress\_rules | default egress sg rules | <pre>map(object({description=string,from_port=number,to_port=number,protocol=string,<br>                     cidr_blocks=optional(list(string)),self=optional(bool),security_groups=optional(list(string))<br>  }))</pre> | <pre>{<br>  "egress_default": {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "description": "egress default",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>}</pre> | no |
| ingress\_rules | default ingress sg rules | <pre>map(object({description=string,from_port=number,to_port=number,protocol=string,<br>                     cidr_blocks=optional(list(string)),self=optional(bool),security_groups=optional(list(string))<br>  }))</pre> | <pre>{<br>  "ingress_self": {<br>    "description": "ingress self",<br>    "from_port": 0,<br>    "protocol": -1,<br>    "self": true,<br>    "to_port": 0<br>  }<br>}</pre> | no |
| name | security group name | `string` | n/a | yes |
| vpc\_id | vpc id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | security group id |
| name | security group name |

## Author:
- `Diego Oliveira`
