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

# Single instance model test.
class ShowRelnshipInstUnderSearchedForNameSimpleTest < ActiveSupport::TestCase
  def assert_with_args(_results, index, expected, actual)
    assert(/\A#{Regexp.escape(expected)}\z/.match(actual),
           "Wrong at index #{index}; should be: #{expected} NOT #{actual}")
  end

  test "show relationship instance under searched for name simple" do
    name = names(:rusty_gum)
    instance = instances(:gaertner_created_metrosideros_costata)
    results = Instance::AsSearchEngine
              .show_relationship_instance_under_searched_for_name(name,
                                                                  instance)
    # results.each do |r|
    #   puts "#{r.name.full_name} #{r.instance_type.name} #{r.display_as}"
    # end
    assert results.size == 2
    expected = "Metrosideros costata Gaertn. comb. nov. "
    expected << "citing_instance_within_name_search"
    assert_with_args(results,
                     0,
                     expected,
                     "#{results[0].name.full_name} #{results[0]\
                     .instance_type.name} #{results[0].display_as}")
    expected = "Rusty Gum vernacular name "
    expected << "cited-by-relationship-instance-name-only"
    assert_with_args(results,
                     1,
                     expected,
                     "#{results[1].name.full_name} #{results[1]\
                     .instance_type.name} #{results[1].display_as}")
  end
end
