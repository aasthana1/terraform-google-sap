# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'retriable'

control 'deployment_validation' do

    describe command("gcloud compute instances get-serial-port-output #{attribute('instance_name')} --project=#{attribute('project_id')} --zone=#{attribute('zone')}") do
      its(:exit_status) { should eq 0 }

      # Validate `df -h` command output
      its('stdout') { should match('/dev/mapper/vg_hana-data') }
      its('stdout') { should match('/dev/mapper/vg_hana-log') }

      # Validate `HDB info` command output.
      # TODO: Refine output verification once HDB info works on post deployment script
      its('stdout') { should match('hdbnameserver') }
    end
end