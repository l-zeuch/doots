local neotree = {
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = false,
      always_show = {
        ".gitignore",
        ".editorconfig",
      },
      never_show = {
        ".DS_Store",
        "thumbs.db",
      },
    },
  },
}

return neotree
