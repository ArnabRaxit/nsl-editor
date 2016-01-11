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

class ScientificHybridFormulaTest < ActiveSupport::TestCase
  test "scientific hybrid formula name type options" do
    current_category = Name::SCIENTIFIC_HYBRID_FORMULA_CATEGORY
    assert_equal 5, NameType.options_for_category(current_category).size, "Should be 5 #{current_category} name types."
    assert NameType.options_for_category(current_category).collect(&:first).include?("hybrid autonym"), "Name type 'hybrid autonym' should be a #{current_category} option."
    assert NameType.options_for_category(current_category).collect(&:first).include?("intergrade"), "Name type 'intergrade' should be a #{current_category} option."
    assert NameType.options_for_category(current_category).collect(&:first).include?("graft/chimera"), "Name type 'graft/chimera' should be a #{current_category} option."
    assert NameType.options_for_category(current_category).collect(&:first).include?("hybrid formula parents known"),
           "Name type 'hybrid formula parents known' should be a #{current_category} option."
    assert NameType.options_for_category(current_category).collect(&:first).include?("cultivar hybrid formula"),
           "Name type 'cultivar hybrid formula' should be a #{current_category} option."
  end
end
