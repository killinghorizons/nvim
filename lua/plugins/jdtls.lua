return {
  "mfussenegger/nvim-jdtls",
  ft = "java", -- only loads for java files
  settings = {
    java = {
      inlayHints = {
        parameterNames = { enabled = "all" },
      },
      import = {
        exclusions = {
          "**/build/**",
          "**/.gradle/**",
          "**/node_modules/**",
          "**/.metadata/**",
          "**/bin/**",
          "**/out/**",
        },
      },
    },
  },
}
