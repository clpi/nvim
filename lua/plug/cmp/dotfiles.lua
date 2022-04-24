  -- local source = {}
  -- ---Return this source is available in current context or not. (Optional)
  -- ---@return boolean
  -- function source:is_available()
  --   return true
  -- end
  -- ---Return the debug name of this source. (Optional)
  -- ---@return string
  -- function source:get_debug_name()
  --   return 'debug name'
  -- end
  -- ---Return keyword pattern for triggering completion. (Optional)
  -- ---If this is ommited, nvim-cmp will use default keyword pattern. See |cmp-config.completion.keyword_pattern|
  -- ---@return string
  -- function source:get_keyword_pattern()
  --   return [[\k\+]]
  -- end
  -- ---Return trigger characters for triggering completion. (Optional)
  -- function source:get_trigger_characters()
  --   return { '.' }
  -- end
  -- ---Invoke completion. (Required)
  -- ---@param params cmp.SourceCompletionApiParams
  -- ---@param callback fun(response: lsp.CompletionResponse|nil)
  -- function source:complete(params, callback)
  --   callback({
  --     { label = 'January' },
  --     { label = 'February' },
  --     { label = 'March' },
  --     { label = 'April' },
  --     { label = 'May' },
  --     { label = 'June' },
  --     { label = 'July' },
  --     { label = 'August' },
  --     { label = 'September' },
  --     { label = 'October' },
  --     { label = 'November' },
  --     { label = 'December' },
  --   })
  -- end
  -- ---Resolve completion item. (Optional)
  -- ---@param completion_item lsp.CompletionItem
  -- ---@param callback fun(completion_item: lsp.CompletionItem|nil)
  -- function source:resolve(completion_item, callback)
  --   callback(completion_item)
  -- end
  -- ---Execute command after item was accepted.
  -- ---@param completion_item lsp.CompletionItem
  -- ---@param callback fun(completion_item: lsp.CompletionItem|nil)
  -- function source:execute(completion_item, callback)
  --   callback(completion_item)
  -- end
  -- ---Register custom source to nvim-cmp.
  -- require('cmp').register_source('month', source.new())
