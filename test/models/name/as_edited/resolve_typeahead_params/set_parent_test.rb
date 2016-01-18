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
class NameAsEditedResolveTypeaheadParamsSetParentTest < ActiveSupport::TestCase
  test "name as edited revolve typeahead params set parent" do
    dummy = names(:a_genus)
    name = Name::AsEdited.find(names(:has_no_parent).id)
    assert name.parent_id.blank?, "Name should be have no parent to start this test."
    name.resolve_typeahead_params("parent_id" => dummy.id, "parent_typeahead" => dummy.full_name)
    assert_equal dummy.id, name.parent_id, "Should now have a parent id"
  end
end
