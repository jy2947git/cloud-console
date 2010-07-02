require 'test_helper'

class ServerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "can describe ec2 instance" do
    ec2 = Server.new()
    res = ec2.describe_instance("i-9894aaf0")
    puts res["reservationSet"]["item"][0]["reservationId"]
    puts res["reservationSet"]["item"][0]["instancesSet"]["item"][0]["imageId"]
    puts res["reservationSet"]["item"][0]["instancesSet"]["item"][0]["instanceType"]
    puts res["reservationSet"]["item"][0]["instancesSet"]["item"][0]["instanceState"]["name"]
  end

  test "can start ec2 instance" do
    ec2 = Server.new()
    res = ec2.start_instance("i-9894aaf0")
    puts res
  end

  test "can stop ec2 instance" do
    ec2 = Server.new()
    res = ec2.stop_instance("i-9894aaf0")
    puts res
  end
end
