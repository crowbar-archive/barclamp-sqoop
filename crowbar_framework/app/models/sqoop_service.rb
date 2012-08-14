#
# Cookbook Name: sqoop
# Recipe: sqoop_service.rb
#
# Copyright (c) 2012 Dell Inc.
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
  
  def create_proposal
    @logger.debug("sqoop create_proposal: entering")
    base = super
    
    # Find all hadoop edge nodes.
    edge_nodes = []
    hadoop = Barclamp.find_by_name("hadoop")
    if hadoop
      hadoop.proposals.each do |p|
        edge_nodes << p.current_config.get_nodes_by_role("hadoop-edgenode")
      end
    end
    clouderamanager = Barclamp.find_by_name("clouderamanager")
    if clouderamanager
      clouderamanager.proposals.each do |p|
        edge_nodes << p.current_config.get_nodes_by_role("clouderamanager-edgenode")
      end
    end
    edge_nodes = edge_nodes.flatten

    # Check for errors or add the proposal elements
    if !edge_fqdns.nil? && edge_fqdns.length > 0
      edge_nodes.each do |n|
        add_role_to_instance_and_node(n.name, base.name, "sqoop-interpreter")
      end
    else
      @logger.debug("sqoop create_proposal: No edge nodes found, proposal bind failed")
    end
    
    # @logger.debug("sqoop create_proposal: #{base.to_json}")
    @logger.debug("sqoop create_proposal: exiting")
    base
  end
  
end
