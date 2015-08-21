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

class AuthorReaderNotShowCommentsTabTest < ActionController::TestCase
  tests AuthorsController
  setup do
    @author = authors(:bentham)
  end

  test "should not show reader author comments tab" do
    @request.headers["Accept"] = "application/javascript"
    get(:show,{id: @author.id,tab: 'tab_comments'},{username: 'fred', user_full_name: 'Fred Jones', groups: []})
    assert_response :success
    assert_select 'li.active a#author-show-tab', /Details/, "Should show Author 'Details' tab instead of 'Comments' tab to reader"
    assert_select 'form', false, "Should be no form"
  end

end
