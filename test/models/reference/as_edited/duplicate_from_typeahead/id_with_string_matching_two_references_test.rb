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

class ReferenceAsEditedDuplicateOfIdWithStringMatching2References < ActiveSupport::TestCase

  test "id with string matching 2 references" do
    reference_1 = references(:has_a_matching_citation_1)
    reference_2 = references(:has_a_matching_citation_2)
    assert reference_1.citation.match(reference_2.citation), "Should be two references with the same ciation."
    result = Reference::AsEdited.duplicate_of_from_typeahead(reference_2.id.to_s,reference_2.citation)
    assert_equal reference_2.id, result, "Should get a match for the correct id"
  end

end
