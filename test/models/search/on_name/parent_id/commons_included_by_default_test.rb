#   encoding: utf-8
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
load "test/models/search/users.rb"
load "test/models/search/on_name/test_helper.rb"

# Single Search model test.
class SearchOnNameParentIdCommonsIncludedByDefaultTest < ActiveSupport::TestCase
  test "search on name parent id commons included by default" do
    name = names(:argyle_apple)
    params = ActiveSupport::HashWithIndifferentAccess.new(
      query_target: "name",
      query_string: "parent-id: #{name.id}",
      current_user: build_edit_user
    )
    search = Search::Base.new(params)
    confirm_results_class(search.executed_query.results)
    assert_equal 1, search.executed_query.results.size,
                 "Expect common name included by default for parent id query"
  end
end
