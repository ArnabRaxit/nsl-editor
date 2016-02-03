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

# Reference model typeahead test.
class RefAsEdNoAuthIdWPartValidStringMatchingOneAuthor < ActiveSupport::TestCase
  test "no id with partial valid string matching one author" do
    author = authors(:chaplin)
    result = Reference::AsEdited.author_from_typeahead("", author.name.chop)
    assert_equal author.id, result, "Should get a matching id for the author"
  end
end
