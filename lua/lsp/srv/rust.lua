
return {
  ["rust-analyzer"] = {
    linkedProjects = { },
    semantic_highlighting = {
      strings = { enable = true },
    },
    lens = {
      run = { enable = true },
      debug = { 
        enable = true,
      },
      enable = true,
      methodReferences = { enable = true },
      forceCustomCommands = true,
      implementations = { enable = true },
      references = {
        enable = true,
        adt = { enable = true },
        enumVariant = { enable = true },
        trait = { enable = true },
        method = { enable = true },
      }
    },
    imports = {
      prefix = "plain",
      group = { enable = true },
      merge = "glob",
      granularity = {
        group = "module",
        -- enforce
      }
    },
    debug = {
      -- engine = "",
      openDebugPane = true,
      -- sourceFileMap = true,
    },
    cachePriming = {
      enable = true;
    },
    runnables = {
      -- command = 
    },
    assist = {
      importGroup = true,
      importPrefix = "plain",
      expressionFillDefault = true,

    },
    cargo = {
      autoReload = true,
      allFeatures = false,
      noSysroot = false,
      -- noDefaultFeatures = false,
      buildScripts = {
        enable = true,
        useRustcWrapper = true,
      }
    },
    procMacro = {
      enabled = false,
      attributes = { enable = true },
      ignored = { },
    },
    highlightRelated = {
      breakPoints = { enable = true },
      yieldPoints = { enable = true },
      exitPoints = { enable = true },
      references = { enable = true },
    },
    typing = {
      autoClosingAngleBrackets = { enable = true };
    },

    signatureInfo = {
      documentation = { enable = true },
      detail = true
    },
    inlayHints = {
      renderColons = true,
      -- maxLength = 
      renderColonsInCallSignature = true,
      parameterHints = {
        enable = true
      },
      closingBraceHints = { 
        -- minLines = 
        enable = true },
      bindingModeHints = {
        enable = true,
      },
      lifetimeElisionHints = {
        enable = true,
        useParameterNames = true,
      },
      typeHints = {
        hideClosureInitialization = false,
        hideNamedConstructor = false,
      },
      closureReturnTypeHints = true,
      reborrowHints = { enable = true },
      chainingHints = { enable = true },
    },
    checkOnSave = {
      target = true,
      enable = true
      -- overrideCommand = 
      -- noDefaultFeatures
    },
    rustfmt = {
      rangeFormatting = { enable = true },
      overrideCommand = false,
    },
    diagnostics = {
      disabled = false,
      enable = true;
      experimental = {enable = true},
      enableExperimental = true;
      -- remapPrefix = ""
      -- warningAsInfo
      -- warningAsHint
    },
    experimental = {
      procAttrMacros = true,
    },
    hover = {
      links = { enable = true },
      linksInHover = { enable = true },
      documentation = { enable = true },
      actions = {
        enabled = true,
        debug = { enable = true },
        run = { enable = true },
        references = { enable = true },
        gotoTypeDef = { enable = true },
        implementations = { enable = true }
      }
    },
    notifications = {
      cargoTomlNotFound =true,
    },
    workspace = {
      symbol = {
        search ={
          scope = "workspace",
          -- limit = ""
          -- kind = 
        }
      }
    },
    joinLines = {
      unwrapTrivialBlock = true,
      removeTrailingComma = true,
      joinElseIf = true,
      -- joinAssignments = true
    },
    callInfo = {
      full = true,

    },
    completion = {
      addCallParenthesis = true,
      autoimport = { enable = true },
      callable = { snippets = true },
      snippets = { 
        enable = true,
        -- custom = 
      },
      autoself = {
        enable = true
      },
      postfix = {
        enable = true
      },
      privateEditable = {
        enable = true
      }
    },

  }
}

