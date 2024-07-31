<h1 align="center">
DalMuDee_v2🌙
</h1>

<h3 align="center">
My Personal Integrated Development Environment (for java)
</h3>

![Spring](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white)
![Apache Maven](https://img.shields.io/badge/Apache%20Maven-C71A36?style=for-the-badge&logo=Apache%20Maven&logoColor=white)
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)

## ☕ Introduction
When I was serving in the military, the environment for programming was inadequate. So, I started this project with the idea of creating my own development environment, specifically for <strong>Java</strong> and <strong>Spring Boot</strong>.

## ✨Features
- ✅ Spring Boot 3 Tools
- ✅ Also support html, css, js
- ✅ Auto Completion & Diagnostics
- ✅ Organize Imports & Code Formatting
- ✅ Run Debug & Tests
- ✅ Code Actions
- ✅ Build Tools (Maven/Gradle)
- ✅ Works perfectly in CommandLine Interface
- ✅ Use ssh, mosh to access and programing anytime, anywhere

## ⚡️ Prerequisites

* Ubuntu 20.04 or higher (64-bit x86)
* RAM 2GB (minimum 1GB)
* Make sure `~/.config/nvim` is empty.
* [Nerd Font](https://www.nerdfonts.com/) *(optional)*

## 🔨 Installation

**Install DalMuDee_v2 in ONE command**

```bash
source <(curl -s https://raw.githubusercontent.com/AndrewCogi/DalMuDee_v2/master/Installer_DalMuDee_v2.sh)
```

**Install Java17 & Springboot3 & Maven & Gradle in ONE command**

```bash
source <(curl -s https://raw.githubusercontent.com/AndrewCogi/DalMuDee_v2/master/Installer_Java17_Springboot3_Maven_Gradle.sh)
```

## ⌨️ Key mapping

> [!NOTE]
> The Leader Key is mapped to the **Spacebar**. The `<leader>` notation used in the key mappings refers to pressing the Spacebar followed by the specified key(s).

<details>
  <summary>🔸 Basic Keymaps </summary>

| Keymap               | Description                              |
| -------------------- | ---------------------------------------- |
| jk                   | Exit insert mode                         |
| Tab                  | Switch to next buffer                    |
| Shift+Tab            | Switch to previous buffer                |
| &lt;leader&gt;bn     | Go to next buffer                        |
| &lt;leader&gt;bp     | Go to previous buffer                    |
| K (visual mode)      | Move selected line(s) up                 |
| J (visual mode)      | Move selected line(s) down               |
| Ctrl-s               | Save file                                |
| Ctrl-q               | Save and quit                            |
| Ctrl-h               | Move to left split                       |
| Ctrl-j               | Move to down split                       |
| Ctrl-k               | Move to up split                         |
| Ctrl-l               | Move to right split                      |
| Ctrl-Up              | Decrease window height                   |
| Ctrl-Down            | Increase window height                   |
| Ctrl-Left            | Decrease window width                    |
| Ctrl-Right           | Increase window width                    |
| < (visual mode)      | Move indent left                         |
| > (visual mode)      | Move indent right                        |
| &lt;leader&gt;h      | Clear search highlight                   |
| ]c                   | Go to next diagnostic                    |
| [c                   | Go to previous diagnostic                |

</details>

<details>
  <summary>🔸 Plugin Keymaps </summary>

#### [Plugin] vim-bbye
| Keymap           | Description            |
| ---------------- | ---------------------- |
| &lt;leader&gt;bd | Delete buffer          |

#### [Plugin] nvim-osc52
| Keymap               | Description                  |
| -------------------- | ---------------------------- |
| Ctrl+c (visual mode) | Copy to clipboard            |
| Ctrl+v               | Paste from clipboard         |
| Ctrl+v (visual mode) | Paste from clipboard         |

### [Plugin] hop.nvim
| Keymap          | Description                     |
| --------------- | ------------------------------- |
| &lt;leader&gt;s | Jump to character               |

### [Plugin] kommentary
| Keymap    | Description                                |
| --------- | ------------------------------------------ |
| Ctrl+/    | Toggle comment (normal and visual mode)    |

### [Plugin] luasnip
| Keymap    | Description                                                       |
| --------- | ----------------------------------------------------------------- |
| Ctrl+l    | Jump to the next snippet placeholder (insert and visual mode)     |
| Ctrl+h    | Jump to the previous snippet placeholder (insert and visual mode) |

### [Plugin] nvim-surround
| Keymap          | Description                        |
| --------------- | ---------------------------------- |
| ys              | Surround text                      |
| ds              | Delete surrounding characters      |
| cs              | Change surrounding characters      |
| S (visual mode) | Surround visual selection          |

### [Plugin] FTerm
| Keymap          | Description                   |
| --------------- | ----------------------------- |
| &lt;leader&gt;t | Toggle terminal               |

### [Plugin] gitsigns.nvim
| Keymap    | Description                                 |
| --------- | ------------------------------------------- |
| ]g        | Go to next git hunk                         |
| [g        | Go to previous git hunk                     |
| gha       | Stage current hunk                          |
| ghA       | Stage entire buffer                         |
| ghu       | Undo stage current hunk                     |
| ghr       | Reset current hunk                          |
| ghR       | Reset entire buffer                         |
| ghd       | Show diff for current file                  |
| ghb       | Show blame for current line                 |

### [Plugin] neo-tree.nvim
| Keymap          | Description                |
| --------------- | -------------------------- |
| &lt;leader&gt;e | Toggle file explorer       |

### [Plugin] telescope
| Keymap           | Description                    |
| ---------------- | ------------------------------ |
| &lt;leader&gt;ff | Find files                     |
| &lt;leader&gt;fg | Live grep                      |
| &lt;leader&gt;fb | List open buffers              |
| &lt;leader&gt;fh | Find help tags                 |

### [Plugin] nvim-lspconfig
| Keymap           | Description                                 |
| ---------------- | ------------------------------------------- |
| ?                | Show information                            |
| gd               | Go to definition                            |
| gi               | Go to implementation                        |
| gr               | Show references                             |
| &lt;leader&gt;ac | Code action                                 |
| &lt;leader&gt;rn | Rename symbol                               |
| &lt;leader&gt;fm | Format code (normal and visual mode)        |

### [Plugin] nvim-jdtls
| Keymap           | Description                                 |
| ---------------- | ------------------------------------------- |
| &lt;leader&gt;ko | Organize imports                            |
| &lt;leader&gt;// | Update project configuration                |
| &lt;leader&gt;xv | Extract variable                            |
| &lt;leader&gt;tg | Generate test                               |
| &lt;leader&gt;gt | Go to test                                  |
| &lt;leader&gt;kr | Run project                                 |
| &lt;leader&gt;kt | Test current class                          |
| &lt;leader&gt;km | Test current method                         |

### [Plugin] nvim-dap
| Keymap           | Description                                 |
| ---------------- | ------------------------------------------- |
| &lt;leader&gt;du | Toggle DAP UI                               |
| &lt;leader&gt;db | Toggle breakpoint                           |
| &lt;leader&gt;dB | Set conditional breakpoint                  |
| &lt;leader&gt;dr | Continue (Run)                              |
| &lt;leader&gt;dg | Go to line                                  |
| &lt;leader&gt;di | Step into                                   |
| &lt;leader&gt;do | Step over                                   |
| &lt;leader&gt;dO | Step out                                    |
| &lt;leader&gt;dp | Pause                                       |
| &lt;leader&gt;ds | Show session information                    |
| &lt;leader&gt;dt | Terminate                                   |

### [Plugin] noice.nvim
| Keymap           | Description                                 |
| ---------------- | ------------------------------------------- |
| &lt;leader&gt;ms | Show message history                        |
| &lt;leader&gt;ml | Show last message                           |
| &lt;leader&gt;md | Dismiss all messages                        |

</details>
