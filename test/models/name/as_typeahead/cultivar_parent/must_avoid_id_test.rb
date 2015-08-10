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
require 'test_helper'

class NameCultivarParentSuggestionsMustAvoidIdTest < ActiveSupport::TestCase

  test "name cultivar parent suggestions must avoid id" do
    name = names(:angophora_costata)
    suggestions = Name::AsTypeahead.cultivar_parent_suggestions('angophora costata',name.id+1)
    assert(suggestions.is_a?(Array), 'suggestions should be an array')
    assert(suggestions.size == 1, 'suggestions for "angophora costata" should have 1 element')
    assert(suggestions.first[:value].match(/Angophora costata/),"Suggestions should include 'Angophora costata'.")
    suggestions = Name::AsTypeahead.cultivar_parent_suggestions('angophora costata',name.id)
    assert(suggestions.is_a?(Array), 'suggestions should be an array')
    assert(suggestions.size == 0, 'suggestions for "angophora costata" should have no elements to avoid the id')
  end

end

