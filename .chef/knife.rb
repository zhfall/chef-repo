current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "zhangjm"
client_key               "#{current_dir}/zhangjm.pem"
validation_client_name   "myvmnet-validator"
validation_key           "#{current_dir}/myvmnet-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/myvmnet"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
