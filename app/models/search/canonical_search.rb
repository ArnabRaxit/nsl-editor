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
class Search::CanonicalSearch

  attr_reader :params, :supplied_string, :canonical_string, :tokens, :count, :list, :list_limit
  DEFAULT_LIST_LIMIT = 100

  def initialize(params)
    #show_debug(params)
    @params = params
    @supplied_string = params['query_string'] || ''
    parse_string
  end

  def show_debug(params)
    Rails.logger.debug("Search::CanonicalSearch start")
    Rails.logger.debug("#{'=' * 40}")
    params.each do |key,value|
      Rails.logger.debug("#{key}: #{value}")
    end
    Rails.logger.debug("#{'=' * 40}")
  end

  def canonical_string
    @params[:query_string]
  end

  def parse_string
    @tokens = @supplied_string.split(/ /)
    remaining_tokens = @supplied_string.split(/ /)
    remaining_tokens = parse_count_or_list(remaining_tokens)
    remaining_tokens = parse_list_limit(remaining_tokens)
  end

  def parse_count_or_list(tokens)
    if tokens.first.match(/count/i)
      tokens = tokens.drop(1)
      @count = true
      @list = !@count
    elsif tokens.first.match(/list/i)
      tokens = tokens.drop(1)
      @list = true
      @count = !@list
    else 
      @list = true
      @count = !@list
    end
    #puts tokens.join(' ')
    tokens
  end

  def parse_list_limit(tokens)
    if tokens.first.match(/\d+/)
      @list_limit = tokens.first.to_i
      tokens = tokens.drop(1)
    else 
      @list_limit = DEFAULT_LIST_LIMIT
    end
    tokens
  end

end


