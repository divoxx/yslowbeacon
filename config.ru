require 'bundler/setup'
Bundler.require(:default)

$:.unshift File.dirname(__FILE__) + "/lib"
require "yslow_beacon"
require "yslow_beacon/show_exceptions"

use Rack::Parser
use Rack::Reloader
use YSlowBeacon::ShowExceptions
run YSlowBeacon::Receiver.new
