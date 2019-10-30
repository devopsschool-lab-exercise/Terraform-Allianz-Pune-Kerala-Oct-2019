image_id = "ami-abc123"
availability_zone_names = [
  "us-east-1a",
  "us-west-1c",
]
shard_directors = {
   "shard-director-1"  = {
      name = "sharddirector1"
      host = "vm1"
      port = "1522"
      region = "region1"      
   }
use_dbparamfile = "false"
use_dbtemplatefile = "false"

