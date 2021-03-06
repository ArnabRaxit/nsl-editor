# frozen_string_literal: true
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

# Single controller test.
class NameParentSuggestionsForEditorTest < ActionController::TestCase
  tests NamesController
  setup do
    @name = names(:a_species)
  end

  test "name parent suggestions for editor" do
    @request.headers["Accept"] = "application/javascript"
    get(:name_parent_suggestions,
        { rank_id: name_ranks(:unranked).id, term: "search for this" },
        username: "fred",
        user_full_name: "Fred Jones",
        groups: ["edit"])
    assert_response :success
  end
end
