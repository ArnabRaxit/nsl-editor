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

class AuthorAsEditedNoDuplicateOfIdWithStringMatchingTwoNamesTest < ActiveSupport::TestCase

  test "no id with invalid string" do
    current_author_id = 1
    author_1 = authors(:has_matching_name_1)
    assert Author.where(name: author_1.name).size == 2, "Should be two Authors with the same name."
    assert_raise(RuntimeError,"Should raise a RuntimeError for invalid author string.") do
      result = Author::AsEdited.duplicate_of_from_typeahead('',author_1.name,current_author_id)
    end
  end

end
