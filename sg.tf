resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id   = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = lookup(ingress.value, "description")
      from_port   = lookup(ingress.value, "from_port")
      to_port     = lookup(ingress.value, "to_port")
      protocol    = lookup(ingress.value, "protocol")
      cidr_blocks = lookup(ingress.value, "cidr_blocks",[])
      self        = lookup(ingress.value, "self",false)
      security_groups = lookup(ingress.value, "security_groups",[])
     }
   }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = lookup(egress.value, "description")
      from_port   = lookup(egress.value, "from_port")
      to_port     = lookup(egress.value, "to_port")
      protocol    = lookup(egress.value, "protocol")
      cidr_blocks = lookup(egress.value, "cidr_blocks",[])
      self        = lookup(egress.value, "self",false)
      security_groups = lookup(egress.value, "security_groups",[])
     }
  }
 tags = merge({Name=var.name},var.additional_tags)
}
