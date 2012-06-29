#
# Cookbook Name: sqoop
# Recipe: sqoop_service.rb
#
# Copyright (c) 2011 Dell Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author: Paul Webster
#

class SqoopService < ServiceObject
  
  def initialize(thelogger)
    @bc_name = "sqoop"
    @logger = thelogger
  end
  
  def create_proposal
    @logger.debug("sqoop create_proposal: entering")
    base = super
    
    # Get the node list.
    nodes = NodeObject.all
    nodes.delete_if { |n| n.nil? }
    
    # Find all hadoop edge nodes.
    edge_nodes = nodes.find_all { |n| n.role? "hadoop-edgenode" or n.role? "clouderamanager-edgenode" }
    edge_fqdns = Array.new
    edge_nodes.each { |x|
      next if x.nil?
      edge_fqdns << x[:fqdn] if !x[:fqdn].nil? && !x[:fqdn].empty? 
    }
    
    # Check for errors or add the proposal elements
    base["deployment"]["sqoop"]["elements"] = { } 
    if !edge_fqdns.nil? && edge_fqdns.length > 0 
      # @logger.info("GOT EDGE " + edge_fqdns.to_s)
      base["deployment"]["sqoop"]["elements"]["sqoop-interpreter"] = edge_fqdns 
    else
      @logger.debug("sqoop create_proposal: No edge nodes found, proposal bind failed")
    end
    
    # @logger.debug("sqoop create_proposal: #{base.to_json}")
    @logger.debug("sqoop create_proposal: exiting")
    base
  end
  
end
