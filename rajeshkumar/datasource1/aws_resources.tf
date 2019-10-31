resource "aws_vpc" "myvpc" {
 cidr_block = "10.0.0.0/16"

 tags = {
 Name = "myvpc"
}
}

resource "aws_subnet" "myvpc_subnets" {
count = "${length(data.aws_availability_zones.availability_zones.names)}" #returns number of AZ's
vpc_id = "${aws_vpc.myvpc.id}"
cidr_block = "${cidrsubnet("${aws_vpc.myvpc.cidr_block}",8,count.index+1)}"
availability_zone = "${element(data.aws_availability_zones.availability_zones.names,count.index)}" #returens AZ's name
tags = {
   Name = "myvpc_subnet_${count.index+1}"
  }
}
