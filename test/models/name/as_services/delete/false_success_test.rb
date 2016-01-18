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
require "test_helper"

# Single name model test.
class NameAsServicesDeleteFalseSuccessTest < ActiveSupport::TestCase
  test "url" do
    name_id = names(:name_to_delete).id
    name = Name::AsServices.find(name_id)
    assert_raise(RuntimeError, "Should raise exception.") do
      name.delete_with_reason("666 this is the reason.....")
    end
  end
end
