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
 
class SectionShouldHaveBookParentTest < ActiveSupport::TestCase

  test "section ref type parent is book" do
    ref_type = ref_types(:section)
    # Must have a parent_id to even be in the race with this poor data structure.
    assert ref_type.parent.name == ref_types(:book).name, "Section (#{ref_types(:section).name}), should have #{ref_types(:book).name} as parent not #{ref_type.parent.name}."
  end
 
end



