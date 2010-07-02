require 'AWS'
class Server < ActiveRecord::Base
  has_many :accounts
#  has_many :hostings
#  has_many :accounts, :through => :hostings
  def to_s
    self.alias
  end

  def start_instance()
    ec2 = AWS::EC2::Base.new(:access_key_id => AppAttribute.find_by_name("aws-access-key").value, :secret_access_key => AppAttribute.find_by_name("aws-access-secret").value)

    ec2.start_instances(:instance_id=>self.systemName)
  end

  def describe_instance()
     ec2 = AWS::EC2::Base.new(:access_key_id => AppAttribute.find_by_name("aws-access-key").value, :secret_access_key => AppAttribute.find_by_name("aws-access-secret").value)
     ec2.describe_instances(:instance_id=>self.systemName)
  end

  def stop_instance()
    ec2 = AWS::EC2::Base.new(:access_key_id => AppAttribute.find_by_name("aws-access-key").value, :secret_access_key => AppAttribute.find_by_name("aws-access-secret").value)

    ec2.stop_instances(:instance_id=>self.systemName)
  end

  def create_instance()
#    create the Ec2 instance, and start it; the ec2 instance id will be used to populate the alias field
    ec2 = AWS::EC2::Base.new(:access_key_id => AppAttribute.find_by_name("aws-access-key").value, :secret_access_key => AppAttribute.find_by_name("aws-access-secret").value)
    ec2.run_instances(:image_id => "ami-714ba518", :key_name => "focaplo-ec2", :security_group => ["default"], :user_data=>"alias=server101", :instance_type => "m1.small", :availability_zone => "us-east-1c")
  end
end
