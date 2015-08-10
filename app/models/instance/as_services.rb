#   Copyright 2015 Australian National Botanic Gardens
#
#   This file is part of the NSL Editor.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#   
class Instance::AsServices < Instance

  def self.name_strings_url(id)
    "#{Rails.configuration.name_services}#{id}/api/name-strings"
  end

  # Service will send back 200 even if delete fails, but will also sometimes send back 404,
  # so have to look at both.
  # The interface *should* never let a user try to delete an instance
  # that cannot be deleted, so the chances of hitting a 'meaningful' error are small.
  # The service error messages are not suitable for showing to users. e.g. "There are 1 instances that cite this."
  # so just log them. 
  def self.delete(id)
    api_key = Rails.configuration.api_key
    resource = "#{Rails.configuration.services}instance/apni/#{id}/api/delete?apiKey=#{api_key}&reason=Edit"
    response = RestClient.delete(resource,{accept: :json})
    json = JSON.load(response)
    raise "Could not delete that instance [#{response.try('code')}]" unless response.code == 200 and json["ok"] == true
  rescue => e
    logger.error("Instance::AsServices.delete exception for resource: #{resource}")
    logger.error("Instance::AsServices.delete exception with response: #{response}")
    raise 
  end

end

