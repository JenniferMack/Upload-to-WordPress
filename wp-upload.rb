#! /usr/bin/env ruby

require 'xmlrpc/client'
require 'xmlrpc/Base64'
require 'json'

begin
  pwfile = File.expand_path("~/. ulysses-wp-password.json")
  if !File.readable?(pwfile) then
    pwfile = File.expand_path("~/.upload-wp-password.json")
  end
  pwinfo = JSON.parse(File.open(pwfile).read)
rescue => err
  puts "Password error: #{err}"
  exit
end

begin
  wordpress = XMLRPC::Client.new_from_hash({
    "host"     => pwinfo["host"],
    "user"     => pwinfo["user"],
    "password" => pwinfo["password"],
    "use_ssl"  => pwinfo["use_ssl"],
    "path"     => "/xmlrpc.php"
  })
rescue => err
  puts "Build XMLRPC error: #{err}"
  exit
end

ARGV.each do |f|
  begin
  data = {
    :bits => XMLRPC::Base64.new(File.open(f).read),
    :name => File.basename(f),
    :type => "image/#{File.extname(f)}"
  }
  rescue => err
    puts "Data encode error: #{err}"
    exit
  end

  begin
    result = wordpress.call(
      'wp.uploadFile',
      0,
      wordpress.user,
      wordpress.password,
      data
    )
    puts "Uploaded: #{File.basename(result["url"])}"
  rescue => err
    puts "Upload error: #{err}"
    exit
  end
end
