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

# Single Search model test on Instance search.
class SearchOnInstanceApcDistMatchesTest < ActiveSupport::TestCase
  test "search on instance apc dist matches" do
    params = ActiveSupport::HashWithIndifferentAccess.new(
      query_target: "instance",
      query_string: "apc-dist-matches: ^apc dist one$",
      current_user: build_edit_user
    )
    search = Search::Base.new(params)
    assert search.executed_query.results.size == 1
           "Expecting exactly 1 matching instance and note."
  end
end
