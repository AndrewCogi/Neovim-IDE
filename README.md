<h1 align="center">
DalMuDee_v2🌙
</h1>

<h3 align="center">
My Personal Integrated Development Environment
</h3>

![Spring](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![Anaconda](https://img.shields.io/badge/Anaconda-44A833?style=for-the-badge&logo=Anaconda&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![React](https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=flutter&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![Python](https://img.shields.io/badge/python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white)
![Apache Maven](https://img.shields.io/badge/Apache%20Maven-C71A36?style=for-the-badge&logo=Apache%20Maven&logoColor=white)
![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)


## ☕ Introduction
When I was serving in the military, the environment for programming was inadequate. So, I started this project with the idea of creating my own development environment.

## ✨Features
- ✅ Supported OS: Linux AMD, Linux ARM, macOS Silicon/ARM, macOS Intel/AMD
- ✅ Full-Stack Tool Support: Spring Boot (Maven/Gradle), Anaconda, Flutter, React
- ✅ Supports HTML, CSS, JavaScript
- ✅ Auto Completion & Diagnostics
- ✅ Code Formatting & Code Actions
- ✅ Run Debug & Tests
- ✅ Fully supports Command Line Interface (no mouse needed)
- ✅ Quick access anytime, anywhere via SSH and mosh

> [!NOTE]
> GUI-based features for web and app development require a separate environment.


## ⚡️ Prerequisites

* RAM 4GB (minimum 2GB)
* Make sure `~/.config/nvim` is empty.
* [Nerd Font](https://www.nerdfonts.com/) *(optional)*

> [!NOTE]
> I highly recommend the Fira Code Nerd Font available in my GitHub root.


## 🔨 Installation

**Install DalMuDee_v2 in ONE command**

```bash
source <(curl -s https://raw.githubusercontent.com/AndrewCogi/DalMuDee_v2/master/installer/DalMuDee_IDE.sh)
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

#### [Plugin] hop.nvim
| Keymap          | Description                     |
| --------------- | ------------------------------- |
| &lt;leader&gt;s | Jump to character               |

#### [Plugin] Comment.nvim
| Keymap    | Description                                         |
| --------- | --------------------------------------------------- |
| gcc       | Toggles the current line comment (normal mode)      |
| gc        | Toggles the region linewise comment (visual mode)   |

#### [Plugin] luasnip
| Keymap    | Description                                                       |
| --------- | ----------------------------------------------------------------- |
| Ctrl+l    | Jump to the next snippet placeholder (insert and visual mode)     |
| Ctrl+h    | Jump to the previous snippet placeholder (insert and visual mode) |

#### [Plugin] nvim-surround
| Keymap          | Description                        |
| --------------- | ---------------------------------- |
| ys              | Surround text                      |
| ds              | Delete surrounding characters      |
| cs              | Change surrounding characters      |
| S (visual mode) | Surround visual selection          |

#### [Plugin] toggleterm.nvim
| Keymap          | Description                   |
| --------------- | ----------------------------- |
| &lt;leader&gt;t | Toggle terminal               |

#### [Plugin] gitsigns.nvim
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

#### [Plugin] neo-tree.nvim
| Keymap          | Description                |
| --------------- | -------------------------- |
| &lt;leader&gt;e | Toggle file explorer       |

#### [Plugin] telescope
| Keymap           | Description                    |
| ---------------- | ------------------------------ |
| &lt;leader&gt;ff | Find files                     |
| &lt;leader&gt;fg | Live grep                      |
| &lt;leader&gt;fb | List open buffers              |
| &lt;leader&gt;fh | Find help tags                 |

#### [Plugin] nvim-lspconfig
| Keymap           | Description                                 |
| ---------------- | ------------------------------------------- |
| ?                | Show information                            |
| gd               | Go to definition                            |
| gi               | Go to implementation                        |
| gr               | Show references                             |
| &lt;leader&gt;ac | Code action                                 |
| &lt;leader&gt;rn | Rename symbol                               |
| &lt;leader&gt;fm | Format code (normal and visual mode)        |
| &lt;leader&gt;lr | Restart LSP server                          |

#### [Plugin] nvim-jdtls, flutter-tools.nvim
| Keymap            | Description                                 |
| ----------------- | ------------------------------------------- |
| &lt;leader&gt;oo  | Organize imports                            |
| &lt;leader&gt;ko  | Open/Close outline view                     |
| &lt;leader&gt;//  | Update project configuration                |
| &lt;leader&gt;xv  | Extract variable                            |
| &lt;leader&gt;tg  | Generate test                               |
| &lt;leader&gt;gt  | Go to test                                  |
| &lt;leader&gt;kr  | Run project or file                         |
| &lt;leader&gt;kR  | Restart project                             |
| &lt;leader&gt;krr | Reload project                              |
| &lt;leader&gt;kq  | Quit(Terminate) running project             |
| &lt;leader&gt;kt  | Test current class                          |
| &lt;leader&gt;km  | Test current method                         |

#### [Plugin] nvim-dap
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

#### [Plugin] noice.nvim
| Keymap           | Description                                 |
| ---------------- | ------------------------------------------- |
| &lt;leader&gt;ms | Show message history                        |
| &lt;leader&gt;ml | Show last message                           |
| &lt;leader&gt;md | Dismiss all messages                        |

</details>

## 📦 Utils

**Install Maven & Gradle (Ubuntu (x86_64))**

```bash
source <(curl -s https://raw.githubusercontent.com/AndrewCogi/DalMuDee_v2/master/installer/Installer_Maven_Gradle_ubuntu_x86_64.sh)
```

**Install Maven & Gradle (Mac)**

```bash
source <(curl -s https://raw.githubusercontent.com/AndrewCogi/DalMuDee_v2/master/installer/Installer_Maven_Gradle_mac.sh)
```

**Install Springboot3 for CLI (Ubuntu (x86_64))**

```bash
source <(curl -s https://raw.githubusercontent.com/AndrewCogi/DalMuDee_v2/master/installer/Installer_Springboot3_ubuntu_x86_64.sh)
```

## ❓ Help

[How To Install Flutter SDK](https://velog.io/@okxooxoo/Flutter-Mac%EC%97%90-%EA%B0%9C%EB%B0%9C-%ED%99%98%EA%B2%BD-%EC%84%B8%ED%8C%85%ED%95%98%EA%B8%B0) 
